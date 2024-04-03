//
//  DrawView.swift
//  Blip
//
//  Created by Elian Richard on 02/04/24.
//

import SwiftUI

struct DrawView: View {
    @Binding var prevInValue: Int
    @Binding var prevOutValue: Int
    @Binding var isShowDrawer: Bool
    @Binding var isPassInModified: Bool
    @Binding var isPassOutModified: Bool
    var selectedDrawer: SelectedDrawView
    
    @State var newValue: String = ""
    
    var body: some View {
        VStack{
            Text("Previous Value: \(selectedDrawer == .passIn ? prevInValue : prevOutValue )")
            
            TextField("Input your number", text: $newValue).frame(width: 200).border(Color.black)
            
            Button ("Submit Value") {
                switch (selectedDrawer) {
                    case .passIn:
                        prevInValue = Int(newValue) ?? 0
                        isPassInModified = true
                    case .passOut:
                        prevOutValue = Int(newValue) ?? 0
                        isPassOutModified = true
                }
                isShowDrawer = false
            }
            .buttonStyle(.bordered)
            .tint(.black)
        }
    }
}

#Preview {
    DrawView(prevInValue: .constant(10),
             prevOutValue: .constant(20),
             isShowDrawer: .constant(true),
             isPassInModified: .constant(false),
             isPassOutModified: .constant(false),
             selectedDrawer: .passIn)
}
