//
//  StopListView.swift
//  Blip
//
//  Created by Elian Richard on 03/04/24.
//

import SwiftUI

struct StopListView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @ObservedObject var allStopList: StopListData
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack (spacing: 20) {
                    HStack {
                        Button {
                            presentationMode.wrappedValue.dismiss()
                        } label: {
                            HStack {
                                Image(systemName: "chevron.left")
                                Text("Home")
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    Text("26/03/24 - Bus 2")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                }
                List {
                    ForEach(allStopList.data) { shift in
                        Section(header:
                                    HStack{
                            
                            Text("Shift \(shift.shiftCount) Cycle \(shift.shiftCycle) \n(\(shift.shiftName))").frame(maxWidth: .infinity, alignment: .center).multilineTextAlignment(.center)
                        }
                            .frame(maxWidth: .infinity, alignment: .center)
                            .font(.body)
                            .fontWeight(.bold)
                            .foregroundStyle(.black)
                        ) {
                            ForEach(shift.stops) { stop in
                                NavigationLink("\(stop.stopName) - [\(stop.departureTime)]",
                                               destination: CounterView(allStopData: allStopList,
                                                                        shiftIdx: allStopList.findShiftIndexById(shiftId: shift.id) ?? 0,
                                                                        stopIdx: {
                                    let (_, stopIdx) =  allStopList.findBusStopIndexById(shiftId: shift.id, stopId: stop.id) ?? (0, 0)
                                    return stopIdx
                                }()))
                                //                                HStack {
                                //                                    Text("\(stop.stopName) - [\(stop.departureTime)]")
                                //                                    Spacer()
                                //                                    HStack {
                                //                                        Text("Edit")
                                //                                        Image(systemName: "chevron.right")
                                //                                    }
                                //                                    .foregroundStyle(.secondary)
                                //                                }
                                //                                .padding(.vertical)
                                //                                .listRowSeparator(/*@START_MENU_TOKEN@*/.visible/*@END_MENU_TOKEN@*/, edges: .top)
                                //                                .listRowSeparatorTint(.black)
                                //                                .onTapGesture {
                                //                                    //                                                                    viewModel.selectedBusStop = stop
                                //                                    NavigationLink("\(stop.stopName) - [\(stop.departureTime)]",
                                //                                                   destination: CounterView(allStopData: allStopList,
                                //                                                                            shiftId: shift.id,
                                //                                                                            stopId: stop.id))
                                //
                                //                                    isActive = true
                                //                                    print("Mike gans")
                                //                                }
                            }
                        }
                        .listSectionSeparator(.hidden)
                        .ignoresSafeArea()
                        .padding(.leading, 21)
                        .listRowInsets(EdgeInsets())
                    }
                    .padding(.trailing, 21)
                }
                .listStyle(.inset)
            }
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    StopListView(allStopList: StopListData())
}
