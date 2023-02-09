//
//  DetailView.swift
//  FriendsGiving
//
//  Created by Thomas Radford on 08/02/2023.
//

import SwiftUI

struct DetailView: View {
    @EnvironmentObject var friendsVM: FriendsViewModel
    @Environment(\.dismiss) var dismiss
    @State var friend: Friend
    var body: some View {
        NavigationStack{
            List{
                Text("Name")
                    .font(.title2)
                    .padding(.top)
                TextField("Enter Friends Name", text: $friend.name)
                Text("Bringing")
                    .font(.title2)
                    .padding(.top)
                TextField("Enter What THey are Bringing", text: $friend.bringing)
                Text("Notes")
                    .font(.title2)
                    .padding(.top)
                TextField("Enter Notes", text: $friend.notes)
            }
            .navigationTitle("Invited Friend")
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button("Cancel") {
                            dismiss()
                        }
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Save") {
                            friendsVM.saveFriend(friend: friend)
                            dismiss()
                        }

                    }
                }
                .navigationBarBackButtonHidden()
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(friend: Friend())
            .environmentObject(FriendsViewModel())
    }
}
