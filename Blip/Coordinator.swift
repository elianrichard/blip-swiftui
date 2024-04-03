//
//  Coordinator.swift
//  Blip
//
//  Created by Elian Richard on 03/04/24.
//

import SwiftUI

final class Coordinator: ObservableObject {
    @Published var path = NavigationPath()
    
    func show<V>(_ viewType: V.Type) where V: View {
        path.append(String(describing: viewType.self))
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
}
