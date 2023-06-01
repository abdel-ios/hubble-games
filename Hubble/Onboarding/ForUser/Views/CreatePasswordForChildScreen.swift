//
//  CreatePasswordForChildScreen.swift
//  Hubble
//
//  Created by Abdel Baali on 01/06/23.
//

import SwiftUI

struct CreatePasswordForChildScreen: View {
    
    private enum FocusTextField {
        case password
    }
    
    @FocusState private var isFocusedOn: FocusTextField?
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
                        
                        Image("icon-logo-primary-500")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 45, height: 45)
                    }
                    .padding(.horizontal, 25)
                    .padding(.top,20)
                    .padding(.bottom,26)
                    
                    
                    //Texts
                    VStack(spacing: 15){
                        
                        HStack {
                            Text("STEP 6/7")
                                .foregroundColor(.primary_400)
                                .font(.system(size: 15, weight: .medium))
                            
                            
                            Spacer()
                        }
                        .padding(.bottom, 5)
                        
                        
                        HStack{
                            Text("Create password")
                                .foregroundColor(.neutral_10)
                                .font(.system(size: 35, weight: .medium))
                                .multilineTextAlignment(.leading)
                                .minimumScaleFactor(0.5)
                                .lineLimit(1)
                            
                            Spacer()
                        }
                        
                        HStack{
                            Text("Let’s put a little security i place, create a password")
                                .foregroundColor(.neutral_500)
                                .font(.system(size: 18, weight: .medium))
                                .multilineTextAlignment(.leading)
                                .minimumScaleFactor(0.5)
                                .lineLimit(2)
                            
                            Spacer()
                        }
                    }
                    .padding(.horizontal, 25)
                    .padding(.bottom,10)
                    
                    //Text fields
                    VStack(spacing: 30){
                        
                        //password textfield
                        VStack(spacing: 10) {
                            
                            HStack{
                                Text("Create password")
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
                        
                        //Status password
                        VStack(spacing: 15){
                            HStack{
                                Image(systemName: "circle")
                                    .foregroundColor(Color.neutral_500)
                                    .font(.system(size: 14,weight: .medium))
                                
                                Text("At least one uppercased letter")
                                    .foregroundColor(Color.neutral_500)
                                    .font(.system(size: 14,weight: .medium))
                                
                                Spacer()
                            }
                            
                            HStack{
                                Image(systemName: "circle")
                                    .foregroundColor(Color.neutral_500)
                                    .font(.system(size: 14,weight: .medium))
                                
                                Text("Min. 8 characters")
                                    .foregroundColor(Color.neutral_500)
                                    .font(.system(size: 14,weight: .medium))
                                
                                Spacer()
                            }
                            
                            HStack{
                                Image(systemName: "circle")
                                    .foregroundColor(Color.neutral_500)
                                    .font(.system(size: 14,weight: .medium))
                                
                                Text("At least one number or symbol")
                                    .foregroundColor(Color.neutral_500)
                                    .font(.system(size: 14,weight: .medium))
                                
                                Spacer()
                            }
                        }
                        .padding(.leading,10)
                        
                        
                    }
                    .padding(.horizontal,20)
                    .padding(.top,20)
                    
                    
                    Spacer()
                    
                    //Buttons
                    VStack(spacing: 15){
                        NavigationLink {
                            ChosePlanForChildScreen()
                        } label: {
                            PrimaryPurpleButton(label: "continue")
                        }

                        
                        Text("By creating an Hubble account you agree to all of Hubble Terms & Conditions.")
                            .foregroundColor(Color.neutral_500)
                            .font(.system(size: 12, weight: .regular))
                            .multilineTextAlignment(.center)
                            .minimumScaleFactor(0.5)
                            .lineLimit(2)
                            
                        
                        
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

struct CreatePasswordForChildScreen_Previews: PreviewProvider {
    static var previews: some View {
        CreatePasswordForChildScreen()
    }
}
