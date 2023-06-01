//
//  CreateUsernameScreen.swift
//  Hubble
//
//  Created by Abdel Baali on 01/06/23.
//

import SwiftUI

struct CreateUsernameScreen: View {
    
    private enum FocusTextField {
        case username
    }
    
    @FocusState private var isFocusedOn: FocusTextField?
    @Environment(\.dismiss) private var dismiss
    @State private var username: String = ""
    
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
                            Text("STEP 3/5")
                                .foregroundColor(.primary_400)
                                .font(.system(size: 15, weight: .medium))
                            
                            
                            Spacer()
                        }
                        .padding(.bottom, 5)
                        
                        
                        HStack{
                            Text("Create username")
                                .foregroundColor(.neutral_10)
                                .font(.system(size: 35, weight: .medium))
                                .multilineTextAlignment(.leading)
                                .minimumScaleFactor(0.5)
                                .lineLimit(1)
                            
                            Spacer()
                        }
                        
                        HStack{
                            Text("Create a unique username that represents you so your friends can recognise you")
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
                    VStack(spacing: 18){
                        
                        //Username textfield
                        VStack(spacing: 10) {
                            
                            HStack{
                                Text("Create username")
                                    .foregroundColor(.neutral_10)
                                    .font(.system(size: 12,weight: .medium))
                                
                                Spacer()
                            }
                            .padding(.leading,10)
                            
                            ZStack(alignment: .leading) {
                                if username.isEmpty {
                                    Text("Enter username")
                                        .foregroundColor(.neutral_400)
                                }
                                TextField("", text: $username)
                                    .foregroundColor(.neutral_10)
                                    .submitLabel(.done)
                                    .focused($isFocusedOn, equals: .username)
                                    .onSubmit {
                                        withAnimation {
                                            self.isFocusedOn = nil
                                        }
                                    }
                                
                                HStack{
                                    Spacer()
                                    
                                    Image(systemName: "checkmark.circle")
                                        .font(.system(size: 19,weight: .regular))
                                        .foregroundColor(Color.green_300)
                                        
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
                                            .stroke(isFocusedOn == .username ? Color.primary_300 : .clear, lineWidth: isFocusedOn == .username ? 2.8 : 0)
                                            .foregroundColor(.clear)
                                    }
                            }
                            
                        }
                        
                        //Error text
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
                    
                    
                    Spacer()
                    
                    //Buttons
                    VStack(spacing: 20){
                        NavigationLink {
                            CreatePasswordScreen()
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


struct CreateUsernameScreen_Previews: PreviewProvider {
    static var previews: some View {
        CreateUsernameScreen()
    }
}
