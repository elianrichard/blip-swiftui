//
//  CounterViewModel.swift
//  Blip
//
//  Created by Elian Richard on 02/04/24.
//

import SwiftUI

enum SelectedDrawView {
    case passIn, passOut
}

@Observable class CounterViewModel: ObservableObject {
    var selectedDrawView: SelectedDrawView = .passIn
    var isShowDrawView = false
}
