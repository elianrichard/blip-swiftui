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

final class CounterViewModel: ObservableObject {
    @Published var isInValueModified = false
    @Published var isOutValueModified = false
    @Published var passInValue = 0
    @Published var passOutValue = 0
    @Published var selectedDrawView: SelectedDrawView = .passIn
    @Published var isShowDrawView = false
}
