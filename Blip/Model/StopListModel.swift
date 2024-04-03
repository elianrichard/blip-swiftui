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
    var isModified = false
    var passengerIn = 0
    var passengerOut = 0
}

struct ShiftCycle: Identifiable {
    var id = UUID()
    var shiftName: String
    var shiftCount: Int
    var shiftCycle: Int
    var stops: [BusStop]
}

final class StopListData: ObservableObject {
    @Published var data = [
        ShiftCycle(shiftName: "The Breeze - AEON Mall - The Breeze", shiftCount: 1, shiftCycle: 1, stops: [
            BusStop(stopName: "The Breeze", departureTime: "09:00"),
            BusStop(stopName: "CBD Timur 1", departureTime: "09:02"),
            BusStop(stopName: "Lobby AEON Mall", departureTime: "09:09"),
            BusStop(stopName: "AEON Mall 2", departureTime: "09:11"),
            BusStop(stopName: "CBD Utara 3", departureTime: "09:12"),
            BusStop(stopName: "ICE 1", departureTime: "09:15"),
            BusStop(stopName: "ICE 2", departureTime: "09:20"),
            BusStop(stopName: "ICE 6", departureTime: "09:22"),
            BusStop(stopName: "ICE 5", departureTime: "09:23"),
            BusStop(stopName: "CBD Barat 1", departureTime: "09:26"),
            BusStop(stopName: "CBD Barat 2", departureTime: "09:26"),
            BusStop(stopName: "Lobby AEON Mall", departureTime: "09:33"),
            BusStop(stopName: "AEON Mall 2", departureTime: "09:35"),
            BusStop(stopName: "CBD Timur 2", departureTime: "09:37"),
            BusStop(stopName: "Nava Park 1", departureTime: "09:39"),
            BusStop(stopName: "Green Cove", departureTime: "09:42"),
            BusStop(stopName: "The Breeze", departureTime: "09:45"),
        ]),
        ShiftCycle(shiftName: "The Breeze - AEON Mall - The Breeze", shiftCount: 1, shiftCycle: 2, stops: [
            BusStop(stopName: "The Breeze", departureTime: "14:00"),
            BusStop(stopName: "CBD Timur 1", departureTime: "14:02"),
            BusStop(stopName: "Lobby AEON Mall", departureTime: "14:09"),
            BusStop(stopName: "AEON Mall 2", departureTime: "14:11"),
            BusStop(stopName: "CBD Utara 3", departureTime: "14:12"),
            BusStop(stopName: "ICE 1", departureTime: "14:15"),
            BusStop(stopName: "ICE 2", departureTime: "14:20"),
            BusStop(stopName: "ICE 6", departureTime: "14:22"),
            BusStop(stopName: "ICE 5", departureTime: "14:23"),
            BusStop(stopName: "CBD Barat 1", departureTime: "14:26"),
            BusStop(stopName: "CBD Barat 2", departureTime: "14:26"),
            BusStop(stopName: "Lobby AEON Mall", departureTime: "14:33"),
            BusStop(stopName: "AEON Mall 2", departureTime: "14:35"),
            BusStop(stopName: "CBD Timur 2", departureTime: "14:37"),
            BusStop(stopName: "Nava Park 1", departureTime: "14:39"),
            BusStop(stopName: "Green Cove", departureTime: "14:42"),
            BusStop(stopName: "The Breeze", departureTime: "14:45"),
        ]),
        ShiftCycle(shiftName: "Intermoda - Vanya Park", shiftCount: 2, shiftCycle: 1, stops: [
            BusStop(stopName: "Intermoda", departureTime: "09:15"),
            BusStop(stopName: "Simplicity 2", departureTime: "09:18"),
            BusStop(stopName: "Edutown 1", departureTime: "09:20"),
            BusStop(stopName: "Edutown 2", departureTime: "09:20"),
            BusStop(stopName: "ICE 1", departureTime: "09:21"),
            BusStop(stopName: "ICE 2", departureTime: "09:22"),
            BusStop(stopName: "ICE 6", departureTime: "09:24"),
            BusStop(stopName: "Prestigia", departureTime: "09:25"),
            BusStop(stopName: "The Mozia", departureTime: "09:26"),
            BusStop(stopName: "Plazza Mozia", departureTime: "09:26"),
            BusStop(stopName: "Tabebuya", departureTime: "09:30"),
            BusStop(stopName: "Vanya Park", departureTime: "09:32"),
            BusStop(stopName: "The Mozia", departureTime: "09:36"),
            BusStop(stopName: "Illustria", departureTime: "09:37"),
            BusStop(stopName: "ICE 2", departureTime: "09:41"),
            BusStop(stopName: "ICE 6", departureTime: "09:42"),
            BusStop(stopName: "ICE 5", departureTime: "09:46"),
            BusStop(stopName: "CBD Barat 1", departureTime: "09:46"),
            BusStop(stopName: "CBD Barat 2", departureTime: "09:48"),
            BusStop(stopName: "Simplicity 1", departureTime: "09:49"),
            BusStop(stopName: "Intermoda", departureTime: "09:50"),
        ]),
        ShiftCycle(shiftName: "Intermoda - Vanya Park", shiftCount: 2, shiftCycle: 2, stops: [
            BusStop(stopName: "Intermoda", departureTime: "14:15"),
            BusStop(stopName: "Simplicity 2", departureTime: "14:18"),
            BusStop(stopName: "Edutown 1", departureTime: "14:20"),
            BusStop(stopName: "Edutown 2", departureTime: "14:20"),
            BusStop(stopName: "ICE 1", departureTime: "14:21"),
            BusStop(stopName: "ICE 2", departureTime: "14:22"),
            BusStop(stopName: "ICE 6", departureTime: "14:24"),
            BusStop(stopName: "Prestigia", departureTime: "14:25"),
            BusStop(stopName: "The Mozia", departureTime: "14:26"),
            BusStop(stopName: "Plazza Mozia", departureTime: "14:26"),
            BusStop(stopName: "Tabebuya", departureTime: "14:30"),
            BusStop(stopName: "Vanya Park", departureTime: "14:32"),
            BusStop(stopName: "The Mozia", departureTime: "14:36"),
            BusStop(stopName: "Illustria", departureTime: "14:37"),
            BusStop(stopName: "ICE 2", departureTime: "14:41"),
            BusStop(stopName: "ICE 6", departureTime: "14:42"),
            BusStop(stopName: "ICE 5", departureTime: "14:46"),
            BusStop(stopName: "CBD Barat 1", departureTime: "14:46"),
            BusStop(stopName: "CBD Barat 2", departureTime: "14:48"),
            BusStop(stopName: "Simplicity 1", departureTime: "14:49"),
            BusStop(stopName: "Intermoda", departureTime: "14:50"),
        ]),
    ]
}
