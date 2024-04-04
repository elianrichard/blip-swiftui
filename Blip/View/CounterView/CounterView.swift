//
//  ContentView.swift
//  Blip
//
//  Created by Elian Richard on 02/04/24.
//

import SwiftUI

struct CounterView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @StateObject var viewModel = CounterViewModel()
    
    @ObservedObject var allStopData: StopListData
    var shiftId: UUID
    var stopId: UUID
    
    var stopData: BusStop? {
        return allStopData.findBusStopById(shiftId: shiftId, stopId: stopId)
    }
    var prevStop: String? {
        guard let prevBusStop = allStopData.findPrevBusStop(currentShiftId: shiftId, currentStopId: stopId) else {
            return nil
        }
        return prevBusStop.stopName
    }
    var nextStop: String? {
        guard let nextBusStop = allStopData.findNextBusStop(currentShiftId: shiftId, currentStopId: stopId) else {
            return nil
        }
        return nextBusStop.stopName
    }
    var body: some View {
        NavigationView {
            VStack {
                CounterHeaderView(currentStop: stopData?.stopName,
                                  departureTime: stopData?.departureTime,
                                  presentationMode: presentationMode)
                Spacer()
                VStack {
                    CounterValueContainerView(allStopData: allStopData,
                                              shiftId: shiftId,
                                              stopId: stopId,
                                              selectedCounter: .passIn,
                                              selectedDrawView: $viewModel.selectedDrawView,
                                              isShowDrawView: $viewModel.isShowDrawView)
                    CounterValueContainerView(allStopData: allStopData,
                                              shiftId: shiftId,
                                              stopId: stopId,
                                              selectedCounter: .passOut,
                                              selectedDrawView: $viewModel.selectedDrawView,
                                              isShowDrawView: $viewModel.isShowDrawView)
                }
                Spacer()
                CounterNavView(prevStop: prevStop, nextStop: nextStop)
            }
            .ignoresSafeArea(.all)
            .sheet(isPresented: $viewModel.isShowDrawView, content: {
                //                DrawingView(isShowDrawView: $viewModel.isShowDrawView)
                DrawView(allStopData: allStopData,
                         shiftId: shiftId,
                         stopId: stopId,
                         isShowDrawer: $viewModel.isShowDrawView,
                         selectedDrawer: viewModel.selectedDrawView)
            })
        }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    CounterView(allStopData: StopListData(),
                shiftId: StopListData().data[0].id,
                stopId: StopListData().data[0].stops[0].id)
}
