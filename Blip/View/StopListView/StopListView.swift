//
//  StopListView.swift
//  Blip
//
//  Created by Elian Richard on 03/04/24.
//

import SwiftUI

struct StopListView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var selectedRoute: String = ""
    
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
                                                                        shiftId: shift.id,
                                                                        stopId: stop.id))
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
