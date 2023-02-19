//
//  LockLog.swift
//  Halen
//
//  Created by Luke Drushell on 2/19/23.
//

import SwiftUI

struct LockLog: View {
    var body: some View {
        VStack {
            ForEach(0...19, id: \.self, content: { i in
                HStack {
                    Image(systemName: "bicycle")
                    Text("Bike \(Int.random(in: 0...1) == 1 ? "Locked" : "Unlocked")")
                    Spacer()
                    Text("$\(Int.random(in: 0...1)).\(Int.random(in: 10...99))")
                } .padding()
                if i < 19 {
                    Divider()
                }
            })
        } .padding()
            .background(.regularMaterial)
            .cornerRadius(25)
            .padding()
    }
}

struct LockLog_Previews: PreviewProvider {
    static var previews: some View {
        LockLog()
    }
}
