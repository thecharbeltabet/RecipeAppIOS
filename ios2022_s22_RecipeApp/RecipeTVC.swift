//
//  RecipeTVC.swift
//  ios2022_s22_msc_exam_TABET_ABDESSLAM
//
//  Created by Utilisateur invité on 27/06/2022.
//

import UIKit

class RecipeTVC: UITableViewController {
    
    var hits = [Hits]()
    var search = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getRecipes()
        print(search)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func download(at url: String, handler: @escaping (Data?) -> Void) {
     // 1 - Create URL
        let URLRequest = URLRequest(url: URL(string: url)!)
        
        let task = URLSession.shared.dataTask(with: URLRequest) {data, response, error in
            handler(data)
            
        }
        
        task.resume()
        
        
        
     }
    
    func getRecipes() {
    // 1 - Download recipes
    download(at: "https://api.edamam.com/api/recipes/v2?q=\(search)&app_id=4c4c90a9&app_key=f89311f8ba6a9fef279bc2b035d1eded&type=public")
    { (recipeData) in
    if let recipeData = recipeData {
    // 2 - Decode JSON into a array of Recipe object
    let decoder: JSONDecoder = JSONDecoder()
    do {
        
        let response = try decoder.decode(Response.self, from: recipeData)
        self.hits = response.hits
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    catch {
    debugPrint("Failed to parse data")
    }
    }
    else {
    debugPrint("Failed to get games data")
    }
    } }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return hits.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

     // Configure the cell...
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = hits[indexPath.row].recipe.label
        cell.detailTextLabel?.text = "\(hits[indexPath.row].recipe.yield) servings"
       
        cell.imageView?.image = UIImageView.imageFromURL(url: hits[indexPath.row].recipe.image)
        
        
        
        
        

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if segue.identifier == "pushDetail" {
             

             let RecipeDetailVC = segue.destination as! RecipeDetailVC
             if let indexPath = tableView.indexPathForSelectedRow{
                 RecipeDetailVC.recipe = hits[indexPath.row].recipe
                 
             }
    } }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension UIImageView {
    static func imageFromURL(url:String)-> UIImage? {
        if let data = try? Data(contentsOf: URL(string: url)!) {
            let imageData = UIImage(data: data)
            return imageData
        }
        return nil
    }
}
