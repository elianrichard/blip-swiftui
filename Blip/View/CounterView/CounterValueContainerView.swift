//
//  CounterValueContainerView.swift
//  Blip
//
//  Created by Elian Richard on 02/04/24.
//

import SwiftUI

struct CounterValueContainerView: View {
    @Binding var countValue: Int
    @Binding var isModified: Bool
    var selectedCounter: SelectedDrawView
    @Binding var selectedDrawView: SelectedDrawView
    @Binding var isShowDrawView: Bool
    
    var body: some View {
        HStack {
            Button {
                if (countValue != 0) {
                    countValue -= 1
                }
                if (!isModified) {
                    isModified = true
                }
            } label: {
                Text("-")
                    .frame(maxHeight: .infinity)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(.black)
                    .padding(.horizontal, 20)
                    .background(.lightRed)
                    .cornerRadius(10)
            }
            
            Button {
                selectedDrawView = selectedCounter
                isShowDrawView = true
            } label: {
                Text(isModified ? "\(countValue)" : "Tap To Edit" )
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .font(.system(size: isModified ? 80 : 25))
                    .fontWeight(.bold)
                    .foregroundStyle(.black)
                    .opacity(isModified ? 1 : 0.3)
                    .background(
                        Color(red: 0,
                              green: 0,
                              blue: 0,
                              opacity: 0.1))
                    .cornerRadius(10)
                    
            }
            
            Button {
                countValue += 1
                if (!isModified) {
                    isModified = true
                }
            } label: {
                Text("+")
                    .frame(maxHeight: .infinity)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(.black)
                    .padding(.horizontal, 20)
                    .background(.lightGreen)
                    .cornerRadius(10)
            }
        }
        .padding(.horizontal, 10)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    CounterValueContainerView(countValue: .constant(10),
                              isModified: .constant(false),
                              selectedCounter: .passIn,
                              selectedDrawView: .constant(.passIn),
                              isShowDrawView: .constant(false))
}
