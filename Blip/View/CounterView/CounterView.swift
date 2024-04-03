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
    
    var currentStop = "Edutown 1"
    var departureTime = "05:50"
    var prevStop = "Simplicity 1"
    var nextStop = "Simplicity 2"
    
    var body: some View {
        NavigationView {
            VStack {
                CounterHeaderView(currentStop: currentStop, departureTime: departureTime, presentationMode: presentationMode)
                Spacer()
                VStack {
                    CounterValueContainerView(countValue: $viewModel.passInValue,
                                              isModified: $viewModel.isInValueModified,
                                              selectedCounter: .passIn,
                                              selectedDrawView: $viewModel.selectedDrawView,
                                              isShowDrawView: $viewModel.isShowDrawView)
                    CounterValueContainerView(countValue: $viewModel.passOutValue,
                                              isModified:  $viewModel.isOutValueModified,
                                              selectedCounter: .passOut,
                                              selectedDrawView: $viewModel.selectedDrawView,
                                              isShowDrawView: $viewModel.isShowDrawView)
                }
                Spacer()
                CounterNavView(prevStop: prevStop, nextStop: nextStop)
            }
            .ignoresSafeArea(.all)
            .sheet(isPresented: $viewModel.isShowDrawView, content: {
                DrawingView(isShowDrawView: $viewModel.isShowDrawView)
//                DrawView(prevInValue: $viewModel.passInValue,
//                         prevOutValue: $viewModel.passOutValue,
//                         isShowDrawer: $viewModel.isShowDrawView,
//                         isPassInModified: $viewModel.isInValueModified,
//                         isPassOutModified: $viewModel.isOutValueModified,
//                         selectedDrawer: viewModel.selectedDrawView)
            })
        }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    CounterView()
}
