//
//  recipeModel.swift
//  Seenapay-task
//
//  Created by Mrwan on 17/04/2025.
//

import Foundation

struct Recipe: Identifiable {
    let id = UUID()
    let name: String
    let rating: String
    let reviews: String
    let chef: String
    let image : String
}
