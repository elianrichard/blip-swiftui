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
    var isPassInModified = false
    var isPassOutModified = false
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

@Observable class StopListData: ObservableObject {
    var data = [
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
    
    func findShiftIndexById (shiftId: UUID) -> Int? {
        if let shiftIndex = data.firstIndex(where: { $0.id == shiftId }) {
            return shiftIndex
        }
        return nil
    }
    
    func findBusStopIndexById (shiftId: UUID, stopId: UUID) -> (Int, Int)? {
        if let shiftIndex = data.firstIndex(where: { $0.id == shiftId }),
           let stopIndex = data[shiftIndex].stops.firstIndex(where: { $0.id == stopId }) {
            return (shiftIndex, stopIndex)
        }
        return nil
    }
    
    func findBusStopByIndex(shiftIndex: Int, stopIndex: Int) -> BusStop? {
        guard shiftIndex < data.count,
              shiftIndex >= 0,
              stopIndex < data[shiftIndex].stops.count,
              stopIndex >= 0
        else {
            return nil
        }
        return data[shiftIndex].stops[stopIndex]
    }
    
    func findPrevBusStop (currentShiftIdx: Int, currentStopIdx: Int) -> BusStop? {
        guard let (prevShiftIndex, prevStopIndex) = findPrevIndex(currentShiftIdx: currentShiftIdx, currentStopIdx: currentStopIdx) else {
            return nil
        }
        return findBusStopByIndex(shiftIndex: prevShiftIndex, stopIndex: prevStopIndex)
    }
    
    func findNextBusStop(currentShiftIdx: Int, currentStopIdx: Int) -> BusStop? {
        guard let (nextShiftIndex, nextStopIndex) = findNextIndex(currentShiftIdx: currentShiftIdx, currentStopIdx: currentStopIdx) else {
            return nil
        }
        return findBusStopByIndex(shiftIndex: nextShiftIndex, stopIndex: nextStopIndex)
    }
    
    func findPrevIndex (currentShiftIdx: Int, currentStopIdx: Int) -> (Int, Int)? {
        if (currentStopIdx == 0 && currentShiftIdx > 0) {
            return (currentShiftIdx - 1, data[currentShiftIdx - 1].stops.count - 1)
        } else if (currentStopIdx > 0) {
            return (currentShiftIdx, currentStopIdx - 1)
        } else { return nil }
    }
    
    func findNextIndex (currentShiftIdx: Int, currentStopIdx: Int) -> (Int, Int)? {
        guard currentShiftIdx < data.count, currentStopIdx < data[currentShiftIdx].stops.count else {
            return nil
        }

        if currentStopIdx == data[currentShiftIdx].stops.count - 1 {
            return (currentShiftIdx + 1, 0)
        } else {
            return (currentShiftIdx, currentStopIdx + 1)
        }
    }
    
    func incrementPassengerIn (shiftIndex: Int, busStopIndex: Int) {
        data[shiftIndex].stops[busStopIndex].passengerIn += 1
        data[shiftIndex].stops[busStopIndex].isPassInModified = true
    }
    
    func decrementPassengerIn (shiftIndex: Int, busStopIndex: Int) {
        data[shiftIndex].stops[busStopIndex].isPassInModified = true
        if data[shiftIndex].stops[busStopIndex].passengerIn == 0 { return }
        data[shiftIndex].stops[busStopIndex].passengerIn -= 1
    }
    
    func incrementPassengerOut (shiftIndex: Int, busStopIndex: Int) {
        data[shiftIndex].stops[busStopIndex].passengerOut += 1
        data[shiftIndex].stops[busStopIndex].isPassOutModified = true
    }
    
    func decrementPassengerOut (shiftIndex: Int, busStopIndex: Int) {
        data[shiftIndex].stops[busStopIndex].isPassOutModified = true
        if data[shiftIndex].stops[busStopIndex].passengerOut == 0 { return }
        data[shiftIndex].stops[busStopIndex].passengerOut -= 1
    }
    
    func setPassengerIn (shiftIndex: Int, busStopIndex: Int, value: Int) {
        if (value < 0) { return }
        data[shiftIndex].stops[busStopIndex].isPassInModified = true
        data[shiftIndex].stops[busStopIndex].passengerIn = value
    }
    
    func setPassengerOut (shiftIndex: Int, busStopIndex: Int, value: Int) {
        data[shiftIndex].stops[busStopIndex].isPassOutModified = true
        data[shiftIndex].stops[busStopIndex].passengerOut = value
    }
}
