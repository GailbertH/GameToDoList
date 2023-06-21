//
//  Info.swift
//  GameToDoList
//
//  Created by Gailbert Huang on 6/20/23.
//

import Foundation
import RealmSwift

class Info: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var note: String = ""
    @objc dynamic var status: Int = Status.Unplayed.rawValue
    @objc dynamic var dateLastPlayed: Date = Date.now
}
