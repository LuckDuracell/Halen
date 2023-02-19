//
//  ControlLock.swift
//  Halen
//
//  Created by Luke Drushell on 2/19/23.
//

import SwiftUI

struct ControlLock: View {
    
    @Binding var locked: Bool
    @Binding var unlockDate: Date
    @Binding var timeRemaining: String
    
    let width = UIScreen.main.bounds.width
    
    var body: some View {
        Button {
            withAnimation {
                if locked {
                    unlockDate = Date().addingTimeInterval(1)
                } else {
                    timeRemaining = "49:59"
                    unlockDate = Date().addingTimeInterval(3000)
                }
                locked.toggle()
            }
        } label: {
            HStack {
                Text(locked ? "UNLOCK" : "LOCK")
                    .foregroundColor(Color("halenOrange"))
                    .font(.system(size: 40, weight: .bold, design: .monospaced))
                    .position(x: width * 0.4, y: 40)
                Image(systemName: locked ? "lock.fill" : "lock.open.fill")
                    .foregroundColor(Color("halenOrange"))
                    .font(.system(size: 30, weight: .bold, design: .monospaced))
                    .position(x: width * 0.2, y: 40)
            }
            .frame(height: 80)
            .background(.regularMaterial)
            .cornerRadius(25)
            .padding(.horizontal)
        }
    }
}

struct ControlLock_Previews: PreviewProvider {
    static var previews: some View {
        ControlLock(locked: .constant(false), unlockDate: .constant(Date()), timeRemaining: .constant("0:00"))
    }
}
