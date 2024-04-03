//
//  StopListViewModel.swift
//  Blip
//
//  Created by Elian Richard on 03/04/24.
//

import SwiftUI

final class StopListViewModel: ObservableObject {
    var selectedBusStop: BusStop? {
        didSet {
            isShowCounterView = true
        }
    }
    @Published var isShowCounterView = false
}
