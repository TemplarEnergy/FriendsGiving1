//
//  FriendsGivingApp.swift
//  FriendsGiving
//
//  Created by Thomas Radford on 08/02/2023.
//

import SwiftUI

@main
struct FriendsGivingApp: App {
    @StateObject var friendsVM = FriendsViewModel()
    var body: some Scene {
        WindowGroup {
            ListView()
                .environmentObject(FriendsViewModel())
        }
    }
}
