//
//  ViewController.swift
//  ios2022_s22_msc_exam_TABET_ABDESSLAM
//
//  Created by Utilisateur invité on 27/06/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if segue.identifier == "pushTVC" {
             

             let RecipeTVC = segue.destination as! RecipeTVC
            
             if let text = textField.text  {
             RecipeTVC.search = text
             }
                 
             
         }
        
    }
    
   

}

