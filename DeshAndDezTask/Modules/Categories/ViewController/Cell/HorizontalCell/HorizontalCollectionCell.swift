//
//  HorizontalCollectionCell.swift
//  DeshAndDezTask
//
//  Created by Ammar.M on 29/11/2023.
//

import UIKit

enum HorizontalSections: String {
    case discoverPeople = "Discover People"
    case categories = "Categories"
}

class HorizontalCollectionCell: UICollectionViewCell {
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var collectionView: UICollectionView!
    
    private var sectionType: HorizontalSections = .discoverPeople
    var viewModel: CategoriesViewModel = CategoriesViewModel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.register(DiscoverPeopleCollectionCell.nib, forCellWithReuseIdentifier: DiscoverPeopleCollectionCell.identifier)
        collectionView.register(LabelCollectionViewCell.nib, forCellWithReuseIdentifier: LabelCollectionViewCell.identifier)
    }
    
    func loadSection(of type: HorizontalSections) {
        self.sectionType = type
        titleLabel.text = sectionType.rawValue
    }
}

extension HorizontalCollectionCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if sectionType == .categories {
            return viewModel.categories.count
        }
        return viewModel.users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if sectionType == .categories {
            return 8
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets  {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width  = collectionView.bounds.width - 32
        let height = collectionView.bounds.height
        if sectionType == .categories {
            let string = viewModel.categories[indexPath.row]
            let width = string.calculateWidth(withConstrainedHeight: 40, font: UIFont.systemFont(ofSize: 17, weight: .semibold))
            return CGSize(width: width + 4, height: height)
        }
        return CGSize(width: width / 3, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch sectionType {
        case .discoverPeople:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DiscoverPeopleCollectionCell.identifier, for: indexPath) as! DiscoverPeopleCollectionCell
            cell.load(data: viewModel.users[indexPath.row])
            return cell
        case .categories:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LabelCollectionViewCell.identifier, for: indexPath) as! LabelCollectionViewCell
            cell.set(text: viewModel.categories[indexPath.row])
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if sectionType == .categories {
            let cell = collectionView.cellForItem(at: indexPath) as! LabelCollectionViewCell
            viewModel.selectedCategoryIndex = indexPath.row
            cell.select()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if sectionType == .categories {
            let cell = collectionView.cellForItem(at: indexPath) as! LabelCollectionViewCell
            cell.deselect()
        }
    }
}
