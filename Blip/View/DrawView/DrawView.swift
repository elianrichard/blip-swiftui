//
//  DrawView.swift
//  Blip
//
//  Created by Elian Richard on 02/04/24.
//

import SwiftUI

struct DrawView: View {
    
    @ObservedObject var allStopData: StopListData
    var shiftIdx: Int
    var stopIdx: Int
    
    @Binding var isShowDrawer: Bool
    var selectedDrawer: SelectedDrawView
    
    @State var newValue: String = ""
    
    var stopData: BusStop? {
        return allStopData.findBusStopByIndex(shiftIndex: shiftIdx, stopIndex: stopIdx)
    }

    
    var body: some View {
        if let stopData = stopData {
            VStack{
                Text("Previous Value: \(selectedDrawer == .passIn ? stopData.passengerIn : stopData.passengerOut )")
                
                TextField("Input your number", text: $newValue).frame(width: 200).border(Color.black)
                
                Button ("Submit Value") {
                    switch (selectedDrawer) {
                    case .passIn:
                        allStopData.setPassengerIn(shiftIndex: shiftIdx, busStopIndex: stopIdx, value: Int(newValue) ?? 0)
                    case .passOut:
                        allStopData.setPassengerOut(shiftIndex: shiftIdx, busStopIndex: stopIdx, value: Int(newValue) ?? 0)
                    }
                    isShowDrawer = false
                }
                .buttonStyle(.bordered)
                .tint(.black)
            }
        } else {
            Text("Bus Stop Data not found")
        }
    }
}

#Preview {
    DrawView(allStopData: StopListData(),
             shiftIdx: 0,
             stopIdx: 0,
             isShowDrawer: .constant(true),
             selectedDrawer: .passIn)
}
