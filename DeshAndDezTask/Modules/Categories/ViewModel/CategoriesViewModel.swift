//
//  CategoriesViewModel.swift
//  DeshAndDezTask
//
//  Created by Ammar.M on 29/11/2023.
//

import Foundation

class CategoriesViewModel {
    var categories = ["All Categories", "Sport", "Cima", "Cars", "Fashion", "Real Estate", "Food", "Toon", "Anything"]
    var users = User.getUsers()
    var selectedCategoryIndex = 0
    
}
