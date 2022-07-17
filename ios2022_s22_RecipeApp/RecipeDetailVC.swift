//
//  RecipeDetailVC.swift
//  ios2022_s22_msc_exam_TABET_ABDESSLAM
//
//  Created by Utilisateur invité on 27/06/2022.
//

import UIKit

class RecipeDetailVC: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var servingsLabel: UILabel!
    @IBOutlet weak var typeTextView: UITextView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var ingredientsTextView: UITextView!
    @IBOutlet weak var timeLabel: UILabel!
    var recipe = Recipe("", "", 0, 0.0, [""], [""])

    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = UIImageView.imageFromURL(url: recipe.image)
        nameLabel.text = recipe.label
        servingsLabel.text = "\(recipe.yield) servings"
        typeTextView.text = ""
        recipe.cuisineType.forEach { elt in
            typeTextView.text += "\(elt) \n"
        }
        timeLabel.text = "\(recipe.totalTime) minutes"
        ingredientsTextView.text = ""
        recipe.ingredientLines.forEach { elt in
            ingredientsTextView.text += "\(elt) \n"
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
