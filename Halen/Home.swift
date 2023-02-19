//
//  Home.swift
//  Halen
//
//  Created by Luke Drushell on 2/19/23.
//

import SwiftUI

struct Home: View {
    
    @State var locked = false
    @State var unlockDate = Date().addingTimeInterval(10000)
    @State var timeRemaining = "0:00"
    
    var body: some View {
        NavigationView {
            ZStack {
//                LinearGradient(colors: [Color("halenOrange").opacity(0.1), .orange.opacity(0.2)], startPoint: .topLeading, endPoint: .bottomTrailing)
//                    .edgesIgnoringSafeArea(.all)
                ScrollView {
                    MainLock(locked: $locked, unlockDate: $unlockDate, timeRemaining: $timeRemaining)
                    ControlLock(locked: $locked, unlockDate: $unlockDate, timeRemaining: $timeRemaining)
                    Divider() .padding(.top)
                    LockLog()
                } .navigationTitle("Found 6 Locks Nearby")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar(content: {
                        ToolbarItem(placement: .navigationBarLeading, content: {
                            Button {
                                
                            } label: {
                                Image(systemName: "map.fill")
                                    .foregroundColor(Color("halenOrange"))
                            }
                        })
                        ToolbarItem(placement: .navigationBarTrailing, content: {
                            Button {
                                
                            } label: {
                                Image(systemName: "person.fill")
                                    .foregroundColor(Color("halenOrange"))
                            }
                        })
                    })
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
