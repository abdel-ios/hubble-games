//
//  LoginPasswordScreen.swift
//  Hubble
//
//  Created by Abdel Baali on 01/06/23.
//

import SwiftUI

struct LoginPasswordScreen: View {
    
    private enum FocusTextfield {
         case password
     }
    
    @FocusState private var isFocusedOn: FocusTextfield?
    @Environment(\.dismiss) private var dismiss
    @State private var password: String = ""
    @State private var passwordIsVisible: Bool = false
    
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
                        
                    }
                    .padding(.horizontal, 25)
                    .padding(.top,20)
                    //.padding(.bottom,5)
                    
                    
                    Image("p-image-8")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 75, height: 75)
                        .padding(.bottom,10)
                    
                    //Texts
                    VStack(spacing: 15){
                        
                        
                        Text("Welcome back Jhon!")
                            .foregroundColor(.neutral_10)
                            .font(.system(size: 32, weight: .medium))
                            .multilineTextAlignment(.leading)
                            .minimumScaleFactor(0.5)
                            .lineLimit(1)
                        
                        
                        Text("First show as that you are you, enter your password")
                            .foregroundColor(.neutral_500)
                            .font(.system(size: 16, weight: .medium))
                            .multilineTextAlignment(.center)
                            .minimumScaleFactor(0.5)
                            .lineLimit(2)
                        
                    }
                    .padding(.horizontal, 25)
                    .padding(.bottom,10)
                    
                    //Text fields
                    VStack(spacing: 18){
                        
                        //password textfield
                        VStack(spacing: 10) {
                            
                            HStack{
                                Text("Password")
                                    .foregroundColor(.neutral_10)
                                    .font(.system(size: 12,weight: .medium))
                                
                                Spacer()
                            }
                            .padding(.leading,10)
                            
                            ZStack(alignment: .leading) {
                                if password.isEmpty {
                                    Text("Enter password")
                                        .foregroundColor(.neutral_400)
                                }
                                if passwordIsVisible {
                                    TextField("", text: $password)
                                        .foregroundColor(.neutral_10)
                                        .submitLabel(.done)
                                        .focused($isFocusedOn, equals: .password)
                                        .onSubmit {
                                            withAnimation {
                                                self.isFocusedOn = nil
                                            }
                                        }
                                }else {
                                    SecureField("", text: $password)
                                        .foregroundColor(.neutral_10)
                                        .submitLabel(.done)
                                        .focused($isFocusedOn, equals: .password)
                                        .onSubmit {
                                            withAnimation {
                                                self.isFocusedOn = nil
                                            }
                                        }
                                }
                                
                               
                                
                                HStack{
                                    Spacer()
                                    
                                    Image(systemName: passwordIsVisible ? "eye" : "eye.slash")
                                        .font(.system(size: 16,weight: .regular))
                                        .foregroundColor(passwordIsVisible ? Color.neutral_100 : Color.neutral_500)
                                        .onTapGesture {
                                            self.passwordIsVisible.toggle()
                                           
                                        }
                                        
                                }
                            }
                            .padding(10)
                            .padding(.horizontal,10)
                            .padding(.vertical, 5)
                            .background{
                                RoundedRectangle(cornerRadius: 15)
                                    .foregroundColor(.neutral_800)
                                    .background{
                                        RoundedRectangle(cornerRadius: 15)
                                            .stroke(isFocusedOn == .password ? Color.primary_300 : .clear, lineWidth: isFocusedOn == .password ? 2.8 : 0)
                                            .foregroundColor(.clear)
                                    }
                            }
                            
                        }
                        
                        HStack {
                            Text("Error text")
                                .foregroundColor(Color.red_500)
                            .font(.system(size: 12,weight: .medium))
                            
                            Spacer()
                        }
                        .padding(.leading,10)
                        
                        
                    }
                    .padding(.horizontal,20)
                    .padding(.top,20)
                    
                    HStack{
                        Button {
                            
                        } label: {
                            HStack {
                                
                                Spacer()
                                
                                NavigationLink {
                                   RecoverPasswordScreen()
                                } label: {
                                    Text("Forgot password? Recover password")
                                        .underline()
                                        .foregroundColor(.primary_400)
                                    .font(.system(size: 12,weight: .medium))
                                }
    
                                
                            }
                            .padding(.horizontal,30)
                            .padding(.top, 12)
                        }

                    }
                    
                    Spacer()
                    
                    //Buttons
                    VStack(spacing: 20){
                        NavigationLink {
                            //AddYourEmailScreen()
                        } label: {
                            PrimaryPurpleButton(label: "continue")
                        }

                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom,20)
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

struct LoginPasswordScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginPasswordScreen()
    }
}
