//
//  ContentView.swift
//  FriendsGiving
//
//  Created by Thomas Radford on 08/02/2023.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var friendsVM: FriendsViewModel
    @State  var sheetIsPresented = false
    
    var body: some View {
        NavigationStack{
            List {
                ForEach(friendsVM.friends) { friend in
                    HStack{
                        Image(systemName: "rectangle")
                        NavigationLink {
                            DetailView(friend: friend)
                        } label: {
                            Text(friend.name)
                        }
                        
                    }
                }.onMove(perform: friendsVM.moveFriend)
                    .onDelete(perform: friendsVM.deleteFriend)
            }
            .navigationTitle("Friends")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        sheetIsPresented = true
                    } label: {
                        Image(systemName: "plus")
                    }
                    
                }
            }
            }
        .sheet(isPresented: $sheetIsPresented) {
            DetailView(friend: Friend())
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
            .environmentObject(FriendsViewModel())
    }
}
