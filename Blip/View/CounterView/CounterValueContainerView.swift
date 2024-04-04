//
//  CounterValueContainerView.swift
//  Blip
//
//  Created by Elian Richard on 02/04/24.
//

import SwiftUI

struct CounterValueContainerView: View {
    
    @ObservedObject var allStopData: StopListData
    var shiftId: UUID
    var stopId: UUID
    
    var stopData: BusStop? {
        return allStopData.findBusStopById(shiftId: shiftId, stopId: stopId)
    }
    
    var selectedCounter: SelectedDrawView
    @Binding var selectedDrawView: SelectedDrawView
    @Binding var isShowDrawView: Bool
    
    var isModified: Bool {
        if (selectedCounter == .passIn) {
            return stopData?.isPassInModified ?? false
        } else {
            return stopData?.isPassOutModified ?? false}
    }
    
    var body: some View {
        if let stopData = stopData {
            HStack {
                Button {
                    if (selectedCounter == .passIn){
                        allStopData.decrementPassengerIn(shiftId: shiftId, stopId: stopId)
                    } else {
                        allStopData.decrementPassengerOut(shiftId: shiftId, stopId: stopId)
                    }
                } label: {
                    Text("-")
                        .frame(maxHeight: .infinity)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundStyle(.black)
                        .padding(.horizontal, 20)
                        .background(.lightRed)
                        .cornerRadius(10)
                }
                
                Button {
                    selectedDrawView = selectedCounter
                    isShowDrawView = true
                } label: {
                    Text(isModified ? "\(selectedCounter == .passIn ? stopData.passengerIn : stopData.passengerOut)" : "\(selectedCounter == .passIn ? "IN" : "OUT")\nTap To Edit" )
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .font(.system(size: isModified ? 80 : 25))
                        .fontWeight(.bold)
                        .foregroundStyle(.black)
                        .opacity(isModified ? 1 : 0.3)
                        .background(
                            Color(red: 0,
                                  green: 0,
                                  blue: 0,
                                  opacity: 0.1))
                        .cornerRadius(10)
                    
                }
                
                Button {
                    if (selectedCounter == .passIn) {
                        allStopData.incrementPassengerIn(shiftId: shiftId, stopId: stopId)
                    } else {
                        allStopData.incrementPassengerOut(shiftId: shiftId, stopId: stopId)
                    }
                } label: {
                    Text("+")
                        .frame(maxHeight: .infinity)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundStyle(.black)
                        .padding(.horizontal, 20)
                        .background(.lightGreen)
                        .cornerRadius(10)
                }
            }
            .padding(.horizontal, 10)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        } else {
            Text("Bus Stop Data not found")
        }
    }
}

#Preview {
    CounterValueContainerView(allStopData: StopListData(),
                              shiftId: StopListData().data[0].id,
                              stopId: StopListData().data[0].stops[0].id,
                              selectedCounter: .passIn,
                              selectedDrawView: .constant(.passIn),
                              isShowDrawView: .constant(false))
}
