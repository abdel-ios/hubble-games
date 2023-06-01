//
//  AddParentEmailScreen.swift
//  Hubble
//
//  Created by Abdel Baali on 01/06/23.
//

import SwiftUI

struct AddParentEmailScreen: View {
    
    private enum FocusTextField {
        case email
    }
    
    @FocusState private var isFocusedOn: FocusTextField?
    @Environment(\.dismiss) private var dismiss
    @State private var email: String = ""
    
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
                            Text("STEP 4/7")
                                .foregroundColor(.primary_400)
                                .font(.system(size: 15, weight: .medium))
                            
                            
                            Spacer()
                        }
                        .padding(.bottom, 5)
                        
                        
                        HStack{
                            Text("Add your email")
                                .foregroundColor(.neutral_10)
                                .font(.system(size: 35, weight: .medium))
                                .multilineTextAlignment(.leading)
                                .minimumScaleFactor(0.5)
                                .lineLimit(1)
                            
                            Spacer()
                        }
                        
                        HStack{
                            Text("We want to be able to communicate with you, add you email address.")
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
                    
                    //Text field
                    VStack(spacing: 18){
                        
                        //First name textfield
                        VStack(spacing: 10) {
                            
                            HStack{
                                Text("Your email")
                                    .foregroundColor(.neutral_10)
                                    .font(.system(size: 12,weight: .medium))
                                
                                Spacer()
                            }
                            .padding(.leading,10)
                            
                            ZStack(alignment: .leading) {
                                if email.isEmpty {
                                    Text(verbatim: "example@mail.com")
                                        .foregroundColor(.neutral_400)
                                }
                                TextField("", text: $email)
                                    .foregroundColor(.neutral_10)
                                    .submitLabel(.done)
                                    .focused($isFocusedOn, equals: .email)
                                    .onSubmit {
                                        withAnimation {
                                            self.isFocusedOn = nil
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
                                            .stroke(isFocusedOn == .email ? Color.primary_300 : .clear, lineWidth: isFocusedOn == .email ? 2.8 : 0)
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
                        
                        HStack {
                            
                            Spacer()
                            
                            Text("*This email address will be used to log in to the platform")
                                .foregroundColor(.neutral_500)
                                .font(.system(size: 11,weight: .regular))
                     
                        }
                        .padding(.horizontal,10)
                        .padding(.top, 12)
                        
                        
                    }
                    .padding(.horizontal,20)
                    .padding(.top,20)
                    
                    
                    Spacer()
                    
                    //Buttons
                    VStack(spacing: 20){
                        NavigationLink {
                            CreateUsernameForChild()
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


struct AddParentEmailScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddParentEmailScreen()
    }
}
