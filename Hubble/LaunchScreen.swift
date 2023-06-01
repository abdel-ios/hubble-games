//
//  ContentView.swift
//  Hubble
//
//  Created by Abdel Baali on 31/05/23.
//

import SwiftUI

struct LaunchScreen: View {
    
    @State private var isActive: Bool = false
    
    var body: some View {
        
        if isActive {
            WelcomeScreen()
        }else {
            ZStack{
                Color.neutral_900.ignoresSafeArea()
                
                VStack{
                    
                    Spacer()
                    
                    Image("exp-logo-purple")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .offset(x: -5)
                        .padding(.top, 30)
                    
                    Spacer()
                    
                    Text("Hubble Inc.")
                        .foregroundColor(.primary_500)
                        .font(.system(size: 15, weight: .regular))
                        .padding(.bottom, 30)
                }
            }
            .preferredColorScheme(.dark)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreen()
    }
}
