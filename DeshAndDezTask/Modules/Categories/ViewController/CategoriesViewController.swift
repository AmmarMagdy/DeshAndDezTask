//
//  CategoriesViewController.swift
//  DeshAndDezTask
//
//  Created by Ammar.M on 29/11/2023.
//

import UIKit

private enum CategorySections {
    case discoverPeople
    case categories
    case ads
}

class CategoriesViewController: UIViewController {
    
    @IBOutlet private weak var searchTextField: UITextField!
    @IBOutlet private weak var collectionView: UICollectionView!
    
    private var sections: [CategorySections] = [.discoverPeople, .categories, .ads]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupRegisterCollectionView()
        searchTextField.attributedPlaceholder = NSAttributedString(string: "Search", attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.6862745098, green: 0.6862745098, blue: 0.6862745098, alpha: 1)])
    }
    
    func setupRegisterCollectionView() {
        collectionView.register(HorizontalCollectionCell.nib, forCellWithReuseIdentifier: HorizontalCollectionCell.identifier)
        collectionView.register(CategoryImageCollectionCell.nib, forCellWithReuseIdentifier: CategoryImageCollectionCell.identifier)
        
    }
    
    @IBAction func addAd(_ sender: UIButton) {
        let vc = CreateAdViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension CategoriesViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch sections[section] {
        case .discoverPeople, .categories:
            return 1
        case .ads:
            return 10
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets  {
        if sections[section] == .categories || sections[section] == .discoverPeople {
            return UIEdgeInsets.zero
        }
        return UIEdgeInsets(top: 0, left: 16, bottom: 65, right: 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width  = collectionView.bounds.width
        let height = view.bounds.height
        
        switch sections[indexPath.section] {
        case .discoverPeople:
            return CGSize(width: width, height: 225)
        case .categories:
            return CGSize(width: width, height: 88)
        case .ads:
            return CGSize(width: width / 2 - 24, height: height * 0.4)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch sections[indexPath.section] {
        case .discoverPeople, .categories:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HorizontalCollectionCell.identifier, for: indexPath) as! HorizontalCollectionCell
            let type: HorizontalSections = sections[indexPath.section] == .discoverPeople ? .discoverPeople : .categories
            cell.loadSection(of: type)
            return cell
        case .ads:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryImageCollectionCell.identifier, for: indexPath)
            return cell
        }
        
    }
}
