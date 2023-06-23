//
//  GameTableViewController.swift
//  GameToDoList
//
//  Created by Gailbert Huang on 6/20/23.
//

import UIKit
import RealmSwift

class GameTableViewController: SwipeTableViewController
{
    let realm = try! Realm()
    var games: Results<Game>?
    
    var selectedPlatform: Platform? {
        didSet
        {
            loadGame()
            print(selectedPlatform?.name ?? "None")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func saveGame(game: Game)
    {
        if let platform = selectedPlatform
        {
            do
            {
                try realm.write({
                    platform.games.append(game)
                })
            }
            catch
            {
                print("Failed to add new platform. - \(error)")
            }
        }
        self.tableView.reloadData()
    }
    
    func loadGame()
    {
        games = selectedPlatform?.games.sorted(byKeyPath: "title", ascending: true)
        self.tableView.reloadData()
    }
    
    override func delete(at indexPath: IndexPath)
    {
        super.delete(at: indexPath)
    }
    
    @IBAction func addPressed(_ sender: UIBarButtonItem)
    {
        var newGameText = UITextField()
        let action = UIAlertAction(title: "Add", style: .default)
        { (action) in
            if let safeNewGameText = newGameText.text
            {
                let game = Game()
                game.title = safeNewGameText
                game.priority = self.games?.endIndex ?? 0
                game.info = Info()
                self.saveGame(game: game)
            }
        }
        
        let alert = UIAlertController(title: "Add New Game,", message: "", preferredStyle: .alert)
        alert.addTextField
        { (alertTextField) in
            alertTextField.placeholder = "Add new game."
            newGameText = alertTextField
        }
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = super.tableView(tableView, cellForRowAt: indexPath)
        cell.textLabel!.text = games?[indexPath.row].title ?? "None"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        self.performSegue(withIdentifier: "goToInfo", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if (segue.identifier == "goToInfo")
        {
            let destinationVC = segue.destination as! InfoViewController
            
            if let indexPath = tableView.indexPathForSelectedRow
            {
                let selectedGame = games?[indexPath.row]
                destinationVC.selectedGame = selectedGame
            }
        }
    }
}
