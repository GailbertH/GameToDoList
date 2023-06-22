//
//  InfoViewController.swift
//  GameToDoList
//
//  Created by Gailbert Huang on 6/21/23.
//

import UIKit

class InfoViewController: UIViewController
{
    var currentInfo: InfoModel?
    {
        didSet
        {
            print(currentInfo?.title ?? "None")
        }
    }
    
    @IBOutlet weak var gameTitle: UILabel!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var noteTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        noteTextView.contentInset = UIEdgeInsets(top: 0, left: 25, bottom: 0, right: 25)
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        populateDate()
    }
    
    func populateDate()
    {
        gameTitle.text = currentInfo?.title
        status.text = currentInfo?.status
        noteTextView.text = currentInfo?.note
    }
}
