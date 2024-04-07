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
    @State var shiftIdx: Int
    @State var stopIdx: Int

    var stopData: BusStop? {
        return allStopData.findBusStopByIndex(shiftIndex: shiftIdx, stopIndex: stopIdx)
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
                                              shiftIdx: shiftIdx,
                                              stopIdx: stopIdx,
                                              selectedCounter: .passIn,
                                              selectedDrawView: $viewModel.selectedDrawView,
                                              isShowDrawView: $viewModel.isShowDrawView)
                    CounterValueContainerView(allStopData: allStopData,
                                              shiftIdx: shiftIdx,
                                              stopIdx: stopIdx,
                                              selectedCounter: .passOut,
                                              selectedDrawView: $viewModel.selectedDrawView,
                                              isShowDrawView: $viewModel.isShowDrawView)
                }
                Spacer()
                CounterNavView(allStopData: allStopData,
                               shiftIdx: $shiftIdx,
                               stopIdx: $stopIdx)
            }
            .ignoresSafeArea(.all)
            .sheet(isPresented: $viewModel.isShowDrawView, content: {
                //                DrawingView(isShowDrawView: $viewModel.isShowDrawView)
                DrawView(allStopData: allStopData,
                         shiftIdx: shiftIdx,
                         stopIdx: stopIdx,
                         isShowDrawer: $viewModel.isShowDrawView,
                         selectedDrawer: viewModel.selectedDrawView)
            })
        }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    CounterView(allStopData: StopListData(),
                shiftIdx: 0,
                stopIdx: 0)
}
