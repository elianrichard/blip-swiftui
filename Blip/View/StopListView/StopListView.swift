//
//  StopListView.swift
//  Blip
//
//  Created by Elian Richard on 03/04/24.
//

import SwiftUI

struct StopListView: View {
    @State var selectedRoute: String = ""
    
    @StateObject var viewModel = StopListViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(StopListData.data) { shift in
                    Section(header:
                                Text("Shift \(shift.shiftCount) - Cycle \(shift.shiftCycle) (\(shift.shiftName))")
                        .frame(maxWidth: .infinity, alignment: .center)
                        .font(.body)
                        .fontWeight(.bold)
                        .foregroundStyle(.black)
                    ) {
                        ForEach(shift.stops) { stop in
                            //                            NavigationLink("\(stop.stopName) - [\(stop.departureTime)]", destination: CounterView(currentStop: stop.stopName, departureTime: stop.departureTime, prevStop: "Simplicity 1", nextStop: "Simplicity 2"))
                            NavigationLink {
                                CounterView(currentStop: stop.stopName, departureTime: stop.departureTime, prevStop: "Simplicity 1", nextStop: "Simplicity 2")
                            } label: {
                                HStack {
                                    Text("\(stop.stopName) - [\(stop.departureTime)]")
//                                    Spacer()
//                                    HStack {
//                                        Text("Edit")
//                                        Image(systemName: "chevron.right")
//                                    }
//                                    .foregroundStyle(.secondary)
                                }
                                .padding(.vertical)
                                .listRowSeparator(/*@START_MENU_TOKEN@*/.visible/*@END_MENU_TOKEN@*/, edges: .top)
                                .listRowSeparatorTint(.black)
                                .onTapGesture {
                                    viewModel.selectedBusStop = stop
                                }
                            }
                            //                            HStack {
                            //                                Text("\(stop.stopName) - [\(stop.departureTime)]")
                            //                                Spacer()
                            //                                HStack {
                            //                                    Text("Edit")
                            //                                    Image(systemName: "chevron.right")
                            //                                }
                            //                                .foregroundStyle(.secondary)
                            //                            }
                            //                            .padding(.vertical)
                            //                            .listRowSeparator(/*@START_MENU_TOKEN@*/.visible/*@END_MENU_TOKEN@*/, edges: .top)
                            //                            .listRowSeparatorTint(.black)
                            //                            .onTapGesture {
                            //                                viewModel.selectedBusStop = stop
                            //                            }
                        }
                    }
                    .listSectionSeparator(.hidden)
                    .ignoresSafeArea()
                    .padding(.leading, 21)
                    .listRowInsets(EdgeInsets())
                }
            }
            .listStyle(.inset)
            .padding(.trailing, 21)
            .navigationTitle("26/03/24 - Bus 2")
        }
    }
}

#Preview {
    StopListView()
}
