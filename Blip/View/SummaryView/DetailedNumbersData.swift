//
//  DetailedNumbersData.swift
//  App
//
//  Created by Muhammad Yusuf on 03/04/24.
//

import SwiftUI

struct DetailedNumbersData {
    let inNumbers: [Int]
    let outNumbers: [Int]

    // Initializer to provide default data
    init() {
        self.inNumbers = [10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 4, 4]
        self.outNumbers = [10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 4, 4]
    }
}

extension DetailedNumbersData {
    struct View: SwiftUI.View {
        let data: DetailedNumbersData

        var body: some SwiftUI.View {
            HStack {
                VStack(spacing: 22) {
//                    Text("IN")
//                        .font(.system(size: 17, weight: .semibold))
//                        .foregroundColor(.black)
                    ForEach(data.inNumbers, id: \.self) { number in
                        Text("\(number)")
                            .font(.system(size: 10, weight: .regular))
                            .foregroundColor(.black)
                    }
                }
                
                Spacer()
                
                VStack(spacing: 22) {
//                    Text("OUT")
//                        .font(.system(size: 17, weight: .semibold))
//                        .foregroundColor(.black)
                    ForEach(data.outNumbers, id: \.self) { number in
                        Text("\(number)")
                            .font(.system(size: 10, weight: .regular))
                            .foregroundColor(.black)
                    }
                }
            }
        }
    }
}


