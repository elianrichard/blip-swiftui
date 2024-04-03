//
//  StopListModel.swift
//  Blip
//
//  Created by Elian Richard on 03/04/24.
//

import SwiftUI

struct BusStop: Identifiable {
    var id = UUID()
    var stopName: String
    var departureTime: String
}

struct ShiftCycle: Identifiable {
    var id = UUID()
    var shiftName: String
    var shiftCount: Int
    var shiftCycle: Int
    var stops: [BusStop]
}

struct StopListData {
    static let data = [
        ShiftCycle(shiftName: "Intermoda - Vanya park", shiftCount: 1, shiftCycle: 1, stops: [
            BusStop(stopName: "Intermoda 1", departureTime: "05:50"),
            BusStop(stopName: "Intermoda 2", departureTime: "05:54"),
            BusStop(stopName: "Intermoda 3", departureTime: "06:00"),
            BusStop(stopName: "Intermoda 4", departureTime: "06:10"),
            BusStop(stopName: "Intermoda 5", departureTime: "06:20"),
        ]),
        ShiftCycle(shiftName: "Intermoda - Vanya park", shiftCount: 1, shiftCycle: 2, stops: [
            BusStop(stopName: "Intermoda", departureTime: "05:50"),
            BusStop(stopName: "Intermoda", departureTime: "05:50"),
            BusStop(stopName: "Intermoda", departureTime: "05:50"),
            BusStop(stopName: "Intermoda", departureTime: "05:50"),
            BusStop(stopName: "Intermoda", departureTime: "05:50"),
        ]),
        ShiftCycle(shiftName: "Intermoda - Vanya park", shiftCount: 2, shiftCycle: 1, stops: [
            BusStop(stopName: "Intermoda", departureTime: "05:50"),
            BusStop(stopName: "Intermoda", departureTime: "05:50"),
            BusStop(stopName: "Intermoda", departureTime: "05:50"),
            BusStop(stopName: "Intermoda", departureTime: "05:50"),
            BusStop(stopName: "Intermoda", departureTime: "05:50"),
        ]),
        ShiftCycle(shiftName: "Intermoda - Vanya park", shiftCount: 2, shiftCycle: 2, stops: [
            BusStop(stopName: "Intermoda", departureTime: "05:50"),
            BusStop(stopName: "Intermoda", departureTime: "05:50"),
            BusStop(stopName: "Intermoda", departureTime: "05:50"),
            BusStop(stopName: "Intermoda", departureTime: "05:50"),
            BusStop(stopName: "Intermoda", departureTime: "05:50"),
        ]),
    ]
}
