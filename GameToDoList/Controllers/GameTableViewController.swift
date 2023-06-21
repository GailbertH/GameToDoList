//
//  GameTableViewController.swift
//  GameToDoList
//
//  Created by Gailbert Huang on 6/20/23.
//

import UIKit

class GameTableViewController: SwipeTableViewController {

    var selectedPlatform: Platform? {
        didSet
        {
            //LoadItem
            print(selectedPlatform?.name)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
}
