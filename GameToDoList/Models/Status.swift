//
//  Status.swift
//  GameToDoList
//
//  Created by Gailbert Huang on 6/20/23.
//

import Foundation

enum Status: Int, CaseIterable {
    case Unplayed = 0
    case Playing = 1
    case Completed = 2
    case Backlog = 3
    
    var desc : String
    {
        switch self
        {
            case .Unplayed:  return "Unplayed"
            case .Playing: return "Playing"
            case .Completed: return "Completed"
            case .Backlog: return "Backlog"
        }
    }
}
