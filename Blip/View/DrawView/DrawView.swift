//
//  DrawView.swift
//  Blip
//
//  Created by Elian Richard on 02/04/24.
//

import SwiftUI

struct DrawView: View {
    
    @ObservedObject var allStopData: StopListData
    var shiftId: UUID
    var stopId: UUID
    
    @Binding var isShowDrawer: Bool
    var selectedDrawer: SelectedDrawView
    
    @State var newValue: String = ""
    
    var stopData: BusStop? {
        return allStopData.findBusStopById(shiftId: shiftId, stopId: stopId)
    }

    
    var body: some View {
        if let stopData = stopData {
            VStack{
                Text("Previous Value: \(selectedDrawer == .passIn ? stopData.passengerIn : stopData.passengerOut )")
                
                TextField("Input your number", text: $newValue).frame(width: 200).border(Color.black)
                
                Button ("Submit Value") {
                    switch (selectedDrawer) {
                    case .passIn:
                        allStopData.setPassengerIn(shiftId: shiftId, stopId: stopId, value: Int(newValue) ?? 0)
                    case .passOut:
                        allStopData.setPassengerOut(shiftId: shiftId, stopId: stopId, value: Int(newValue) ?? 0)
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
             shiftId: StopListData().data[0].id,
             stopId: StopListData().data[0].stops[0].id,
             isShowDrawer: .constant(true),
             selectedDrawer: .passIn)
}
