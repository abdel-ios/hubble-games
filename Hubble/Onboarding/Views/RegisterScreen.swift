//
//  RegisterScreen.swift
//  Hubble
//
//  Created by Abdel Baali on 31/05/23.
//

import SwiftUI

struct RegisterScreen: View {
    
    enum AccountChoice {
        case forMe, forMyChild
    }
    
    @Environment(\.dismiss) private var dismiss
    @State private var accountIsFor: AccountChoice = .forMe
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color.neutral_900.ignoresSafeArea()
                
                VStack{
                    
                    //Navigation back button
                    HStack{
                        
                        Button {
                            dismiss()
                        } label: {
                            SquareGrayButtonWithIcon(icon: "arrow-left")
                        }
           
                        Spacer()
                        
                        Image("icon-logo-primary-500")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                    }
                    .padding(.horizontal, 25)
                    .padding(.top,20)
                    .padding(.bottom,30)
                    
                    
                    //Texts
                    VStack(spacing: 15){
                        HStack{
                            Text("Register")
                                .foregroundColor(.neutral_10)
                                .font(.system(size: 35, weight: .bold))
                                .multilineTextAlignment(.leading)
                                .minimumScaleFactor(0.5)
                                .lineLimit(1)
                            
                            Spacer()
                        }
                        
                        HStack{
                            Text("We would like to know is this account is for you or for your child.")
                                .foregroundColor(.neutral_500)
                                .font(.system(size: 18, weight: .medium))
                                .multilineTextAlignment(.leading)
                                .minimumScaleFactor(0.5)
                                .lineLimit(2)
                            
                            Spacer()
                        }
                    }
                    .padding(.horizontal, 25)
                    .padding(.bottom,20)
                    
                    //Toggles
                    VStack(spacing: 20){
                        
                        HStack{
                            Text("For me")
                                .foregroundColor(accountIsFor == .forMe ? .neutral_10 : .neutral_700)
                                .font(.system(size: 17, weight: .semibold))
                        }
                        .frame(maxWidth: .infinity, maxHeight: 65)
                        .background{
                            RoundedRectangle(cornerRadius: 18)
                                .stroke(accountIsFor == .forMe ? Color.blue_500 : .neutral_700, lineWidth: accountIsFor == .forMe ? 3.5 : 1.8)
                                .foregroundColor(.clear)
                                
                        }
                        .onTapGesture {
                            withAnimation {
                                self.accountIsFor = .forMe
                            }
                        }
                        
                        HStack{
                            Text("For my child")
                                .foregroundColor(accountIsFor == .forMyChild ? .neutral_10 : .neutral_700)
                                .font(.system(size: 17, weight: .semibold))
                        }
                        .frame(maxWidth: .infinity, maxHeight: 65)
                        .background{
                            RoundedRectangle(cornerRadius: 18)
                                .stroke(accountIsFor == .forMyChild ? Color.blue_500 : .neutral_700, lineWidth: accountIsFor == .forMyChild ? 3.5 : 1.8)
                                .foregroundColor(.clear)
                                
                        }
                        .onTapGesture {
                            withAnimation {
                                self.accountIsFor = .forMyChild
                            }
                        }
                    }
                    .padding(.horizontal,20)
                    .padding(.top,20)
                    
                    Spacer()
                    
                    //Buttons
                    VStack(spacing: 20){
                        Button {
                            
                        } label: {
                            PrimaryPurpleButton(label: "continue")
                        }
                        
                        Text("Or sign up with")
                            .foregroundColor(.neutral_500)
                            .font(.system(size: 15, weight: .medium))
                        
                        HStack{
                            
                            Button {
                                //login with facebook
                            } label: {
                                SecondaryGrayButtonWithIcon(icon: "facebook-icon", label: "Facebook")
                            }
                            .padding(.trailing,5)
                            
                            //Spacer()
                            
                            Button {
                                
                            } label: {
                                SecondaryGrayButtonWithIcon(icon: "google-icon", label: "Google")
                            }
                            .padding(.leading,5)


                            
                        }

                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom,20)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .preferredColorScheme(.dark)
    }
}

struct RegisterScreen_Previews: PreviewProvider {
    static var previews: some View {
        RegisterScreen()
            .previewDevice("iPhone 14 Pro")
        
        RegisterScreen()
            .previewDevice("iPhone 14 Pro Max")
        
        RegisterScreen()
            .previewDevice("iPhone 13 mini")
    }
}
