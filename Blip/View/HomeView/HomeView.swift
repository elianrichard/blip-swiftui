//
//  HomePage.swift
//  Blip App
//
//  Created by Balya Elfata on 03/04/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack() {
            VStack {
                HStack {
                    Image("iconFace")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 75, height: 75)
                    Image("iconText")
                        .resizable()
                        .frame(width: 100, height: 75)
                }
                .padding()
                Text("Hi, Usep Suryana")
                    .font(.largeTitle)
                    .bold()
                HStack {
                    Text(Date.now.formatted(date: .complete, time: .omitted))
                    Text("-")
                    Text("Bus 2")
                }
                .foregroundColor(.gray)
                .font(.subheadline)
                Text("You have 2 shift(s) for today")
                    .padding(.top, 20)
                    .padding(.bottom, 10)
                VStack {
                    Text("SHIFT 1 (INTERMODA - VANYA PARK)")
                        .fixedSize(horizontal: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, vertical: false)
                        .multilineTextAlignment(.center)
                        .padding()
                        .frame(width: 350, height: 50)
                        .background(Rectangle().fill(Color(hue: 1.0, saturation: 0.0, brightness: 0.9)))
                        .cornerRadius(15)
                    Text("SHIFT 2 (DE PARK RUTE 1)")
                        .multilineTextAlignment(.center)
                        .padding()
                        .frame(width: 350, height: 50)
                        .background(Rectangle().fill(Color(hue: 1.0, saturation: 0.0, brightness: 0.9)))
                        .cornerRadius(15)
                }
                .padding(.bottom, 70.0)
                
                NavigationLink {
                    StopListView()
                } label: {
                    
                    Text("START")
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding()
                        .frame(width: 350, height: 50)
                        .background(Rectangle().fill(Color.blue).shadow(radius: 2))
                        .cornerRadius(15)
                }
            }
            .padding()
        }.navigationBarBackButtonHidden(true)
    }
}


#Preview {
    HomeView()
}
