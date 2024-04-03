//
//  ContentView.swift
//  App
//
//  Created by Muhammad Yusuf on 02/04/24.
//

import SwiftUI

struct SummaryView: View {
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                HeaderView()
                ShiftLabelView()
                ScrollView {
                    VStack(spacing: 16) {
                        ForEach(1...6, id: \.self) { index in
                            ReportCardView(edutownNumber: index)
                        }
                    }
                }
                .padding(.horizontal, 23)
            }
        }
    }
}

struct HeaderView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 3) {
            HStack {
                Button(action: {}) {
                    HStack(spacing: 3) {
                        Image(systemName: "chevron.left")
                        Text("Bus Stops")
                    }
                    .foregroundColor(.blue)
                }
                Spacer()
                Button(action: {}) {
                    Image(systemName: "house.fill")
                        .foregroundColor(.blue)
                }
            }
            .frame(height: 44)
            .padding(.horizontal, 17)
            
            Text("28 / 03 / 2024 - Bus 2")
                .font(.system(size: 25, weight: .bold))
                .padding(.horizontal, 25)
            
            HStack {
                PassengerCountView(title: "Passenger In", count: 106)
                Spacer()
                PassengerCountView(title: "Passenger Out", count: 106)
            }
            .padding(.horizontal, 35)
            .frame(height: 103)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.black, lineWidth: 1)
            )
        }
    }
}

struct PassengerCountView: View {
    let title: String
    let count: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(count)")
                .font(.system(size: 34, weight: .bold))
            Text(title)
                .font(.system(size: 17, weight: .semibold))
        }
    }
}

struct ShiftLabelView: View {
    var body: some View {
        Text("SHIFT 1 (INTERMODA - VANYA PARK)")
            .font(.system(size: 17, weight: .semibold))
            .padding(.horizontal, 47)
            .padding(.top, 16)
    }
}

struct ReportCardView: View {
    let edutownNumber: Int
    
    var body: some View {
        VStack {
            HStack {
                Text("Edutown \(edutownNumber)")
                Spacer()
                Button(action: {}) {
                    Image(systemName: "chevron.right")
                        .foregroundColor(.blue)
                }
                Spacer()
                Text("IN")
                Spacer()
                Text("OUT")
            }
            .font(.system(size: 17, weight: .semibold))
            
            Divider()
            HStack {
                Text("Total")
                Spacer(minLength: 169)
                Text("78")
                Spacer()
                Text("78")
            }
            .font(.system(size: 17, weight: .semibold))
        }
        .padding()
        .frame(height: 106)
        .background(Color.white)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.black, lineWidth: 1)
        )
    }
}

struct BlurView: UIViewRepresentable {
    var style: UIBlurEffect.Style
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: style))
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryView()
    }
}
