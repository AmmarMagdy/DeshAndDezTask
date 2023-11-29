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
        if data.isFollowedByMe {
            unfollow()
        } else {
            follow()
        }
    }
    
    func follow() {
        followButton.setTitle("Follow", for: .normal)
        followButton.backgroundColor = #colorLiteral(red: 1, green: 0.7220000029, blue: 0.00400000019, alpha: 1)
    }
    
    func unfollow() {
        followButton.setTitle("UnFollow", for: .normal)
        followButton.backgroundColor = #colorLiteral(red: 0.1099999994, green: 0.1220000014, blue: 0.1840000004, alpha: 1)
        followButton.layer.borderColor = #colorLiteral(red: 1, green: 0.7220000029, blue: 0.00400000019, alpha: 1)
        followButton.layer.borderWidth = 1
    }
}
