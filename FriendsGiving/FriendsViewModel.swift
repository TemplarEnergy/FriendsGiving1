//
//  FriendsViewModel.swift
//  FriendsGiving
//
//  Created by Thomas Radford on 08/02/2023.
//

import Foundation

class FriendsViewModel: ObservableObject{
    @Published var friends: [Friend] = []
    
    init() {
        loadData()
    }
    
    func loadData() {
        let path = URL.documentsDirectory.appending(component: "friends")
        guard let data = try? Data(contentsOf: path) else { return }
        do {
            friends = try JSONDecoder().decode(Array<Friend>.self, from: data)
        }catch{
            print("*** ERROR *** Could not load data \(error.localizedDescription)")
        }
    }
    
    func deleteFriend(indexSet: IndexSet) {
        friends.remove(atOffsets: indexSet)
        saveData()
    }
    
    func moveFriend(indexSet: IndexSet, toIndex: Int) {
        friends.move(fromOffsets: indexSet, toOffset: toIndex)
    }
    
    func saveData() {
        let path = URL.documentsDirectory.appending(component: "friends")
        let data = try? JSONEncoder().encode(friends)
        do {
            try data?.write(to: path)
        }catch{
            print("*** ERROR *** Could not write data \(error.localizedDescription)")
            
        }
    }
    
    func saveFriend(friend: Friend){
        if friend.id == nil {
            var newFriend = friend
            newFriend.id = UUID().uuidString
            friends.append(newFriend)
        } else
        if let index = friends.firstIndex(where: {$0.id == friend.id}){
            friends[index] = friend
        }
    }
    
}
