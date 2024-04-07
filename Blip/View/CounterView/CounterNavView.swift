//
//  CounterNavView.swift
//  Blip
//
//  Created by Elian Richard on 02/04/24.
//

import SwiftUI

struct CounterNavView: View {
    @ObservedObject var allStopData: StopListData
    
    @Binding var shiftIdx: Int
    @Binding var stopIdx: Int
    
    var prevStop: BusStop? {
        return allStopData.findPrevBusStop(currentShiftIdx: shiftIdx, currentStopIdx: stopIdx)
    }
    
    var nextStop: BusStop? {
        return allStopData.findNextBusStop(currentShiftIdx: shiftIdx, currentStopIdx: stopIdx)
    }
    
    var body: some View {
        if (prevStop == nil && nextStop == nil) {
            Text("No Prev Stop or Next Stop Found \(shiftIdx) \(stopIdx)")
                .frame(minHeight: 100)
        } else {
            HStack (spacing: 0) {
                if let prevStop = prevStop {
                    Button {
                        if let (prevShiftIndex, prevStopIndex) = allStopData.findPrevIndex(currentShiftIdx: shiftIdx, currentStopIdx: stopIdx) {
                            shiftIdx = prevShiftIndex
                            stopIdx = prevStopIndex
                        }
                    } label: {
                        HStack {
                            Image(systemName: "chevron.left")
                                .imageScale(.large)
                                .foregroundStyle(.black)
                                .fontWeight(.bold)
                            Text(prevStop.stopName)
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
                        if let (nextShiftIndex, nextStopIndex) = allStopData.findNextIndex(currentShiftIdx: shiftIdx, currentStopIdx: stopIdx) {
                            shiftIdx = nextShiftIndex
                            stopIdx = nextStopIndex
                        }
                    } label: {
                        HStack {
                            Text(nextStop?.stopName ?? "See Summary")
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
    CounterNavView(allStopData: StopListData(),
                   shiftIdx: .constant(3),
                   stopIdx: .constant(20))
}
