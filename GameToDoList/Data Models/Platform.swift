//
//  Platform.swift
//  GameToDoList
//
//  Created by Gailbert Huang on 6/20/23.
//

import Foundation
import RealmSwift

class Platform: Object
{
    @objc dynamic var priority: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var hexColor: String = ""
    let games = List<Game>()
}
