//
//  PlatformViewController.swift
//  GameToDoList
//
//  Created by Gailbert Huang on 6/20/23.
//

import UIKit
import RealmSwift
import ChameleonFramework

class PlatformViewController: SwipeTableViewController {
    let realm = try! Realm()
    var platforms: Results<Platform>?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        loadPlatforms()
        tableView.rowHeight = 80.0
        tableView.separatorStyle = .none
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        
    }
    
    func savePlatforms(platform: Platform)
    {
        do
        {
            try realm.write
            {
                realm.add(platform)
            }
        }
        catch
        {
            print("Failed to add new platform. - \(error)")
        }
        self.tableView.reloadData()
    }
    
    func loadPlatforms()
    {
        platforms = realm.objects(Platform.self)
        tableView.reloadData()
    }
    
    @IBAction func addPressed(_ sender: UIBarButtonItem)
    {
        var newPlatformTextField = UITextField()
        let action = UIAlertAction(title: "Add", style: .default)
        { (action) in
            if let safeNewPlatformText = newPlatformTextField.text
            {
                let newPlatform = Platform()
                newPlatform.name = safeNewPlatformText
                newPlatform.priority = self.platforms != nil ? self.platforms!.count - 1 : 0
                self.savePlatforms(platform: newPlatform)
            }
        }
        
        let alert = UIAlertController(title: "Add New Platform", message: "", preferredStyle: .alert)
        alert.addTextField
        { (alertTextField) in
            alertTextField.placeholder = "Add new platform."
            newPlatformTextField = alertTextField
        }
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return platforms?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        cell.textLabel!.text = platforms?[indexPath.row].name ?? "None"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        performSegue(withIdentifier: "goToGames", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let destinationVC = segue.destination as! GameTableViewController
        
        if let indexPath = tableView.indexPathForSelectedRow
        {
            destinationVC.selectedPlatform = platforms?[indexPath.row]
        }
    }
}
