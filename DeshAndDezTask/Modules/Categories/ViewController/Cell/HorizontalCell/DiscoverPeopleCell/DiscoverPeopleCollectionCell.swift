//
//  DiscoverPeopleCollectionCell.swift
//  DeshAndDezTask
//
//  Created by Ammar.M on 29/11/2023.
//

import UIKit

class DiscoverPeopleCollectionCell: UICollectionViewCell {
    
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var specialistLabel: UILabel!
    @IBOutlet private weak var followButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func load(data: User) {
        nameLabel.text = data.name
        imageView.image = data.image
        specialistLabel.text = data.specialist
        followButton.setTitle(data.isFollowedByMe ? "UnFollow" : "Follow", for: .normal)
    }
}
