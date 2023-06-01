//
//  ChoseYourPlanScreen.swift
//  Hubble
//
//  Created by Abdel Baali on 01/06/23.
//

import SwiftUI

struct ChoseYourPlanScreen: View {
    
    private enum PlanChoice {
        case monthly
        case yearly
    }
    
    @State private var plan: PlanChoice = .monthly
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color.neutral_900.ignoresSafeArea()
                
                VStack{
                    
                    //Navigation back button
                    HStack{
                        
                        Spacer()
                        
                        Button {
                            //dismiss()
                        } label: {
                            SquareGrayButtonWithIcon(icon: "x", iconSize: 22)
                        }
                            
                    }
                    .padding(.horizontal, 25)
                    .padding(.top,15)
                    .padding(.bottom, 10)
                    
                    
                    //Texts
                    VStack(spacing: 15){
                        
                        
                        HStack {
                            Text("STEP 5/5")
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
                        Button {
                            
                        } label: {
                            PrimaryPurpleButton(label: "continue")
                        }
                            
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom,10)
                }
            }
            .ignoresSafeArea(.keyboard)
        }
        .navigationBarBackButtonHidden(true)
        .preferredColorScheme(.dark)
        .onTapGesture {
            hideKeyboard()
        }
    }
}

struct ChoseYourPlanScreen_Previews: PreviewProvider {
    static var previews: some View {
        ChoseYourPlanScreen()
            .previewDevice("iPhone 14 Pro")
        
        ChoseYourPlanScreen()
            .previewDevice("iPhone 14 Pro Max")
        
        ChoseYourPlanScreen()
            .previewDevice("iPhone 13 mini")
    }
}
