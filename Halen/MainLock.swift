//
//  MainLock.swift
//  Halen
//
//  Created by Luke Drushell on 2/19/23.
//

import SwiftUI

struct MainLock: View {
    
    @Binding var locked: Bool
    @Binding var unlockDate: Date
    
    
    @Binding var timeRemaining: String
    @State var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    func updateTimer() {
        if locked {
            let difference = unlockDate.timeIntervalSince1970 - Date().timeIntervalSince1970
            if difference <= 0 {
                locked = false
                timeRemaining = "0:00"
                return
            }
            let timeDifference = Date(timeIntervalSince1970: difference)
            let minutes = Calendar.current.component(.minute, from: timeDifference)
            let seconds = Calendar.current.component(.second, from: timeDifference)
            timeRemaining = String(format: "%d:%02d", minutes, seconds)
        }
    }
    
    var body: some View {
        VStack {
            Image("lock")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
            HStack {
                Spacer()
            }
            if locked {
                HStack {
                    HStack(alignment: .bottom, spacing: 2) {
                        Text(timeRemaining)
                            .font(.largeTitle.bold())
                        Text("remaining")
                            .font(.headline.bold())
                            .offset(y: -5)
                    } .padding(.leading, 5)
                        .onReceive(timer, perform: { _ in
                            updateTimer()
                        })
                    Spacer()
                    Button {
                        timeRemaining = "49:59"
                        unlockDate = Date().addingTimeInterval(3000)
                    } label: {
                        Image(systemName: "clock.arrow.2.circlepath")
                            .foregroundColor(Color("halenOrange"))
                            .font(.title)
                    }
                }
            }
        }
        .overlay(alignment: .topLeading, content: {
            VStack(alignment: .leading) {
                Text("Status:")
                Text(locked ? "Locked" : "Unlocked")
                    .foregroundColor(Color("halenOrange"))
                    .bold()
                    .padding(.leading)
            }
            Spacer()
        })
        .padding()
        .background(.regularMaterial)
        .cornerRadius(25)
        .padding()
    }
}

struct MainLock_Previews: PreviewProvider {
    static var previews: some View {
        MainLock(locked: .constant(false), unlockDate: .constant(Date()), timeRemaining: .constant("0:00"))
    }
}
