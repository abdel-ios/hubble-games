//
//  SuccessfulPaymentPlanScreen.swift
//  Hubble
//
//  Created by Abdel Baali on 01/06/23.
//

import SwiftUI

struct SuccessfulPaymentPlanScreen: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color.neutral_900.ignoresSafeArea()
                
                VStack{
                    
                    Spacer()
                    
                    Image("check-circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120, height: 120)
                    
                    VStack(spacing: 30){
                        Text("Successful payment!")
                            .foregroundColor(.neutral_10)
                            .font(.system(size: 38,weight: .bold))
                            .minimumScaleFactor(0.5)
                            .lineLimit(1)
                        
                        Text("Welcome to Hubble. Your subscription is now active, your next billing will be on May 20,  2023 for $12,99.")
                            .foregroundColor(.neutral_500)
                            .font(.system(size: 18, weight: .medium))
                            .multilineTextAlignment(.center)
                            .minimumScaleFactor(0.5)
                            .lineLimit(3)
                        
                        Text("You can cancel subscription at any time")
                            .foregroundColor(.neutral_10)
                            .font(.system(size: 18, weight: .medium))
                    }
                    .padding(.horizontal, 10)
                    
                    Spacer()
                    
                    //Buttons
                    VStack(spacing: 20) {
                        NavigationLink {
                            
                        } label: {
                            PrimaryPurpleButton(label: "Continue")
                            
                        }
                        
                        Button {
                            //download invoice
                        } label: {
                            Text("Download invoice")
                                .foregroundColor(.primary_500)
                                .font(.system(size: 18,weight: .medium))
                        }


                    }
                    .padding(.bottom, 20)
                }
                .padding(.horizontal, 20)
            }
        }
    }
}

struct SuccessfulPaymentPlanScreen_Previews: PreviewProvider {
    static var previews: some View {
        SuccessfulPaymentPlanScreen()
            .previewDevice("iPhone 14 Pro")
        
        SuccessfulPaymentPlanScreen()
            .previewDevice("iPhone 14 Pro Max")
        
        SuccessfulPaymentPlanScreen()
            .previewDevice("iPhone 13 mini")
    }
}
