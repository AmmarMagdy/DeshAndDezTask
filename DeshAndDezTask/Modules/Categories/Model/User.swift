//
//  User.swift
//  DeshAndDezTask
//
//  Created by Ammar Magdy on 29/11/2023.
//

import UIKit

struct User {
    
    var name: String
    var image: UIImage
    var specialist: String
    var isFollowedByMe: Bool
    var isFavorit: Bool
    
    static func getUsers() -> [User] {
        [
            User(name: "Amr Salama", image: #imageLiteral(resourceName: "photo"), specialist: "FilmDirector", isFollowedByMe: false, isFavorit: true),
            User(name: "Ben affleck", image: #imageLiteral(resourceName: "MV5BMzczNzNiMDAtMmUzZS00MTkwLWIwOTYtNmYyNjg3MTVkNThhXkEyXkFqcGdeQXVyMjA4MjI5MTA@._V1_UY1200_CR135,0,630,1200_AL_"), specialist: "American Actor", isFollowedByMe: true, isFavorit: true),
            User(name: "Ana de Armas", image: #imageLiteral(resourceName: "587180_v9_bb"), specialist: "Spenish Actress", isFollowedByMe: false, isFavorit: true),
        ]
    }
}



