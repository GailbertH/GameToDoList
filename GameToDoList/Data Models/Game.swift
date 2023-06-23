//
//  Game.swift
//  GameToDoList
//
//  Created by Gailbert Huang on 6/20/23.
//

import Foundation
import RealmSwift

class Game:Object
{
    @objc dynamic var gameID = UUID().uuidString
    @objc dynamic var title: String = ""
    @objc dynamic var done: Bool = false
    @objc dynamic var dateCreated: Date = Date.now
    @objc dynamic var priority: Int = 0
    @objc dynamic var info: Info?
    var parentPlatform = LinkingObjects(fromType: Platform.self, property: "games")
    
    override static func primaryKey() -> String? {
        return "gameID"
    }
}
