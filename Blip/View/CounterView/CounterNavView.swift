//
//  CounterNavView.swift
//  Blip
//
//  Created by Elian Richard on 02/04/24.
//

import SwiftUI

struct CounterNavView: View {
    var prevStop: String?
    var nextStop: String?
    
    var body: some View {
        if (prevStop == nil && nextStop == nil) {
            Text("No Prev Stop or Next Stop Found")
                .frame(minHeight: 100)
        } else {
            HStack (spacing: 0) {
                if let prevStop = prevStop {
                    Button {
                        print("Back")
                    } label: {
                        HStack {
                            Image(systemName: "chevron.left")
                                .imageScale(.large)
                                .foregroundStyle(.black)
                                .fontWeight(.bold)
                            Text(prevStop)
                                .font(.title)
                                .fontWeight(.regular)
                                .foregroundStyle(.black)
                                .minimumScaleFactor(0.5)
                                .lineLimit(2)
                        }
                        .padding(.horizontal, 10)
                        .frame(minHeight: 100)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .overlay(Rectangle()
                            .frame(width: 0.75,
                                   height: nil,
                                   alignment: .trailing)
                                .foregroundColor(.black),
                                 alignment: .trailing)
                    }
                }
                    Button {
                        print("Forward")
                    } label: {
                        HStack {
                            Text(nextStop ?? "See Summary")
                                .font(.title)
                                .fontWeight(.regular)
                                .foregroundStyle(.black)
                                .minimumScaleFactor(0.5)
                                .lineLimit(2)
                            Image(systemName: "chevron.right")
                                .imageScale(.large)
                                .foregroundStyle(.black)
                                .fontWeight(.bold)
                        }
                        .padding(.horizontal, 10)
                        .frame(minHeight: 100)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .overlay(Rectangle()
                            .frame(width: 0.75,
                                   height: nil,
                                   alignment: .leading)
                                .foregroundColor(.black),
                                 alignment: .leading)
                    }
                
            }
            .overlay(Rectangle()
                .frame(width: nil,
                       height: 1.5,
                       alignment: .top)
                    .foregroundColor(.black),
                     alignment: .top)
        }
    }
}
#Preview {
    CounterNavView(prevStop: "Simplicity 1",
                   nextStop: "Simplicity 2")
}
