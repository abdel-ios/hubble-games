//
//  ChosePlanForChildScreen.swift
//  Hubble
//
//  Created by Abdel Baali on 01/06/23.
//

import SwiftUI

struct ChosePlanForChildScreen: View {
    
    private enum PlanChoice {
        case monthly
        case yearly
    }
    
    @State private var plan: PlanChoice = .monthly
    @State private var showAlert: Bool = false
    @State private var showWelcomeScreen =  false
    
    var body: some View {
        NavigationStack{
            if showWelcomeScreen {
                WelcomeScreen()
            } else {
                ZStack{
                    Color.neutral_900.ignoresSafeArea()
                    
                    VStack{
                        
                        //Navigation back button
                        HStack{
                            
                            Spacer()
                            
                            Button {
                                self.showAlert = true
                            } label: {
                                SquareGrayButtonWithIcon(icon: "x", iconSize: 22)
                            }
                            .alert("You can lose all progress", isPresented: $showAlert) {
                                Button("Exit without saving", role: .destructive) {
                                    //go to welcome screen
                                    withAnimation {
                                        self.showWelcomeScreen = true
                                    }
                                }
                                Button("Continue creating profile", role: .cancel) {
                                    self.showAlert = false
                                }
                            } message: {
                                Text("If you cancel at this point all the progress you have recorded will be lost and you will have to write it all over again.")
                            }

                                
                        }
                        .padding(.horizontal, 25)
                        .padding(.top,15)
                        .padding(.bottom, 10)
                        
                        
                        //Texts
                        VStack(spacing: 15){
                            
                            
                            HStack {
                                Text("STEP 7/7")
                                    .foregroundColor(.primary_400)
                                    .font(.system(size: 15, weight: .medium))
                                
                                
                                Spacer()
                            }
                            .padding(.bottom, 5)
                            
                            
                            HStack{
                                Text("Chose your plan")
                                    .foregroundColor(.neutral_10)
                                    .font(.system(size: 35, weight: .medium))
                                    .multilineTextAlignment(.leading)
                                    .minimumScaleFactor(0.5)
                                    .lineLimit(1)
                                
                                Spacer()
                            }
                            
                            HStack{
                                Text("Your membership starts as soon as you set up the payment.")
                                    .foregroundColor(.neutral_500)
                                    .font(.system(size: 18, weight: .medium))
                                    .multilineTextAlignment(.leading)
                                    .minimumScaleFactor(0.5)
                                    .lineLimit(2)
                                
                                Spacer()
                            }
                        }
                        .padding(.horizontal, 25)
                        .padding(.bottom,2)
                        
                        
                        //Toggles
                        VStack(spacing: 18){
                            
                            HStack {
                                Text("You can cancel subscription at any time")
                                    .foregroundColor(.neutral_10)
                                    .font(.system(size: 14, weight: .medium))
                                
                                Spacer()
                            }
                            .padding(.horizontal, 5)
                            
                            //Monthly toggle
                            HStack{
                                VStack(alignment: .leading, spacing: 8){
                                    Text("Monthly")
                                        .foregroundColor(.neutral_10)
                                        .font(.system(size: 22, weight: .bold))
                                    
                                    Text("12,99$ Month")
                                        .foregroundColor(.neutral_300)
                                        .font(.system(size: 16, weight: .medium))
                                }
                                
                                Spacer()
                                
                                ZStack{
                                    Image(systemName: "circle")
                                        .foregroundColor(plan == .monthly ? Color.primary_500 : .neutral_700)
                                        .font(.system(size: 24, weight: .regular))
                                    
                                    Image(systemName: "circle.fill")
                                        .foregroundColor(plan == .monthly ? Color.primary_500 : .clear)
                                        .font(.system(size: 15))
                                    
                                    
                                }
                            }
                            .onTapGesture {
                                withAnimation {
                                    self.plan = .monthly
                                }
                            }
                            .padding(.horizontal, 25)
                            .frame(maxWidth: .infinity, maxHeight: 115)
                            .background{
                                RoundedRectangle(cornerRadius: 18)
                                    .stroke(plan == .monthly ? Color.primary_500 : .neutral_700, lineWidth: plan == .monthly ? 3.5 : 2)
                                    .foregroundColor(.clear)
                            }
                            
                            
                            //Yearly toggle
                            HStack{
                                VStack(alignment: .leading, spacing: 8){
                                    
                                    Text("Best choice")
                                        .foregroundColor(.primary_400)
                                        .font(.system(size: 12, weight: .medium))
                                    
                                    Text("Yearly")
                                        .foregroundColor(.neutral_10)
                                        .font(.system(size: 22, weight: .bold))
                                    
                                    Text("119,99$ Year")
                                        .foregroundColor(.neutral_300)
                                        .font(.system(size: 16, weight: .medium))
                                }
                                
                                Spacer()
                                
                                ZStack{
                                    Image(systemName: "circle")
                                        .foregroundColor(plan == .yearly ? Color.primary_500 : .neutral_700)
                                        .font(.system(size: 24, weight: .regular))
                                    
                                    Image(systemName: "circle.fill")
                                        .foregroundColor(plan == .yearly ? Color.primary_500 : .clear)
                                        .font(.system(size: 15))
                                    
                                    
                                }
                            }
                            .onTapGesture {
                                withAnimation {
                                    self.plan = .yearly
                                }
                            }
                            .padding(.horizontal, 25)
                            .frame(maxWidth: .infinity, maxHeight: 115)
                            .background{
                                RoundedRectangle(cornerRadius: 18)
                                    .stroke(plan == .yearly ? Color.primary_500 : .neutral_700, lineWidth: plan == .yearly ? 3.5 : 2)
                                    .foregroundColor(.clear)
                            }
                            
                            
                            HStack {
                                Text("*Save up to 20% by subscribing to the annual plan")
                                    .foregroundColor(.neutral_400)
                                    .font(.system(size: 12, weight: .regular))
                                
                                Spacer()
                            }
                            .padding(.horizontal, 5)
                            
                            
                        }
                        .padding(.horizontal,20)
                        .padding(.top,20)
                        
                        
                        Spacer()
                        
                        //Buttons
                        VStack(spacing: 15){
                            NavigationLink {
                                SuccessfulPaymentPlanScreen()
                            } label: {
                                PrimaryPurpleButton(label: "continue")
                            }
                                
                        }
                        .padding(.horizontal, 20)
                        .padding(.bottom,10)
                    }
                }
                .blur(radius: showAlert ? 3 : 0)
            }
           
            
        }
        .navigationBarBackButtonHidden(true)
        .preferredColorScheme(.dark)
        .onTapGesture {
            hideKeyboard()
        }
    }
}

struct ChosePlanForChildScreen_Previews: PreviewProvider {
    static var previews: some View {
        ChosePlanForChildScreen()
    }
}
