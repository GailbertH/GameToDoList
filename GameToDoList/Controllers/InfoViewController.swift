//
//  InfoViewController.swift
//  GameToDoList
//
//  Created by Gailbert Huang on 6/21/23.
//

import UIKit
import DropDown
import RealmSwift

class InfoViewController: UIViewController{
    let realm = try! Realm()
    var selectedGame: Game?
    
    @IBOutlet weak var gameTitle: UILabel!
    @IBOutlet weak var noteTextView: UITextView!
    @IBOutlet weak var statusDropDownView: UIView!
    @IBOutlet weak var statusDropDownLabel: UILabel!
    
    let menu: DropDown =
    {
        let menu = DropDown()
        menu.dataSource = Status.allCases.map { $0.desc}
        return menu
    }()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        menu.anchorView = statusDropDownView
        menu.bottomOffset = CGPoint(x: 0, y: (menu.anchorView?.plainView.bounds.height)!)
        menu.selectionAction = {index, title in
            self.dropDownSelection(row: index)
        }
        noteTextView.contentInset = UIEdgeInsets(top: 0, left: 25, bottom: 0, right: 25)
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        populateDate()
    }
    
    override func viewWillDisappear(_ animated: Bool)
    {
        save()
    }
    
    func populateDate()
    {
        if let safeGame = selectedGame
        {
            gameTitle.text = safeGame.title
            menu.selectRow(at: safeGame.info?.status ?? Status.Unplayed.rawValue)
            dropDownSelection(row: menu.indexForSelectedRow!)
            noteTextView.text = safeGame.info?.note
        }
    }
    
    func save()
    {
        if let safeInfo = selectedGame?.info
        {
            do
            {
                try self.realm.write({
                    safeInfo.status = menu.indexForSelectedRow ?? Status.Unplayed.rawValue
                    safeInfo.note = noteTextView.text
                })
                print("Save Done")
            }
            catch
            {
                print("Failed to save notes. - \(error)")
            }
        }
    }
    
    func dropDownSelection(row: Int)
    {
        statusDropDownLabel.text = Status(rawValue: row)?.desc
    }
    
    @IBAction func dropDownButton(_ sender: UIButton)
    {
        menu.show()
    }
}
