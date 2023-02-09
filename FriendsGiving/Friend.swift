//
//  Friend.swift
//  FriendsGiving
//
//  Created by Thomas Radford on 08/02/2023.
//

import Foundation

struct Friend: Identifiable, Codable{
    var id: String?
    var name: String = ""
    var bringing: String = ""
    var notes: String = ""
    
}
