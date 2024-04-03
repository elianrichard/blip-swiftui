//
//  LoginView.swift
//  FirstDay
//
//  Created by Nur Nisrina on 02/04/24.
//

import SwiftUI

struct LoginView: View {
    
    @State private var username = ""
    @State private var password: String = ""
    @State private var isPasswordVisible: Bool = false

    var body: some View {
        NavigationStack() {
            VStack {
                HStack {
                    Image("iconFace")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 69.0, height: 77.0)
                        .clipped()
                        .padding(.trailing, 19)
                    
                    Image("iconText")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 111.0, height: 77.0)
                        .clipped()
                }
                .padding(.vertical, 10)
                
                Text("Hi, Welcome to Blip!")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 10)
                    .padding(.bottom, 1)
                
                Text("Login to continue using the app")
                    .font(.system(size: 17, weight: .regular))
                    .foregroundColor(Color(red: 0.24, green: 0.24, blue: 0.26).opacity(0.6))
                    .padding(.bottom, 30)

                VStack(alignment: .leading) {
                    Text("Username")
                        .font(.system(size: 15))
                    
                    TextField("Enter your username", text: $username)
                        .frame(width: 315, height: 16)
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                    
                    Text("Password")
                        .font(.system(size: 15))
                        .padding(.top, 7)
                    
                    HStack {
                        if isPasswordVisible {
                            TextField("Password", text: $password)
                        } else {
                            SecureField("Password", text: $password)
                        }
                        
                        Button(action: {
                            isPasswordVisible.toggle()
                        }) {
                            Image(systemName: isPasswordVisible ? "eye.slash.fill" : "eye.fill")
                                .foregroundColor(.gray)
                        }
                    }
                    .frame(width: 315, height: 16)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                }
                HStack {
                    Spacer()
                    Button("Forgot password?") {
                        // Action
                    }
                    .padding(.vertical, 5)
                }
            
                VStack {
                    
                    NavigationLink {
                        HomeView()
                    } label: {
                        Text("Sign In")
                            .frame(width: 315)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(12)
                    }.navigationBarBackButtonHidden(true).toolbar(.hidden)
                    
                    Button(action: {
                        // Action
                    }) {
                        HStack {
                            Image(systemName: "apple.logo")
                                .foregroundColor(.white)
                            Text("Sign In with Apple")
                                .foregroundColor(.white)
                        }
                        .frame(width: 315)
                        .padding()
                    }
                    .background(Color.black)
                    .cornerRadius(12)
                }
                .padding(.vertical, 25)
                VStack {
                    Text("Don't have account?")
                        .font(.system(size: 16))
                        .padding(.top, 10)
                    Button(action: {
                        // Action
                    }) {
                        Text("Sign Up here")
                            .font(.system(size: 16))
                    }
                }
            }
            .padding(.horizontal, 22)
        }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    LoginView()
}
