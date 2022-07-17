//
//  Recipe.swift
//  ios2022_s22_msc_exam_TABET_ABDESSLAM
//
//  Created by Utilisateur invité on 27/06/2022.
//

import Foundation
import UIKit

class Recipe : Codable {
    var label : String = ""
    var image: String = ""
    var yield: Int = 0
    var totalTime: Float = 0.0
    var ingredientLines = [String]()
    var cuisineType = [String]()
    
    

    
    init(_ label: String,_ image: String,_ yield: Int ,_ totalTime: Float,_ ingredient: Array<String>,_ type: Array<String>){
        self.label = label
        self.image = image
        self.yield = yield
        self.totalTime = totalTime
        self.ingredientLines = ingredient
        self.cuisineType = type
        
    }
    
    
    
}

class Hits : Codable {
    var recipe: Recipe
    
    init(_ recipe: Recipe){
        self.recipe = recipe
    }
}


class Response : Codable {
    var hits = [Hits]()
    
    init(_ hits: [Hits]) {
        
        self.hits = hits
    }
}
