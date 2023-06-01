//
//  WelcomeScreen.swift
//  Hubble
//
//  Created by Abdel Baali on 31/05/23.
//

import SwiftUI

struct WelcomeScreen: View {
    var body: some View {
        NavigationStack {
            GeometryReader { geo in
                ZStack{
                    Color.neutral_900.ignoresSafeArea()
                    
                    // Background
                    VStack {
                        Image("ws-wallpaper")
                            .resizable()
                            .scaledToFill()
                            .frame(width: geo.size.width * 1.0, height: geo.size.height * 0.75)
                            .ignoresSafeArea()
                        
                        Spacer()
                    }
                    
                    VStack{
                        
                        Spacer()
                        
                        Image("icon-logo-primary-500")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                    
                        
                        //Texts
                        VStack(spacing: 10){
                            Text("Welcome to the universe of games")
                                .foregroundColor(.neutral_10)
                                .font(.system(size: 50, weight: .heavy))
                                .multilineTextAlignment(.center)
                                .minimumScaleFactor(0.5)
                                .lineLimit(2)
                            
                            Text("Discover new games and exclusives, chat with your friends and much more.")
                                .foregroundColor(.neutral_500)
                                .font(.system(size: 19,weight: .medium))
                                .multilineTextAlignment(.center)
                                .minimumScaleFactor(0.5)
                                .lineLimit(2)
                            
                        }
                        .padding(.horizontal, 25)
                        .padding(.bottom, 30)
                        
                        //Buttons
                        VStack(spacing: 15){
                            
                            //Go to onboarding flow
                            NavigationLink {
                                RegisterScreen()
                            } label: {
                                PrimaryPurpleButton(label: "Get started")
                            }


                            NavigationLink {
                                //Go to login flow
                                LoginScreen()
                            } label: {
                                SecondaryGrayButton(label: "I already have an account")
                            }
                            
                        }
                        .padding(.horizontal, 25)
                        .padding(.bottom, 25)
                    }
                }
            }
        }
        .preferredColorScheme(.dark)
        .navigationBarBackButtonHidden(true)
    }
}

struct WelcomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeScreen()
            .previewDevice("iPhone 14 Pro")
        
        WelcomeScreen()
            .previewDevice("iPhone 14 Pro Max")
        
        WelcomeScreen()
            .previewDevice("iPhone 13 mini")
    }
}
