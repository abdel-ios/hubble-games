//
//  AboutYourChildScreen.swift
//  Hubble
//
//  Created by Abdel Baali on 01/06/23.
//

import SwiftUI

struct AboutYourChildScreen: View {
    
    private enum FocusTextfield {
         case fullname
     }
     
     
     @FocusState private var isFocusedOn: FocusTextfield?
     @Environment(\.dismiss) private var dismiss
     @State private var firstName: String = ""
    
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
                            Text("STEP 1/7")
                                .foregroundColor(.primary_400)
                            .font(.system(size: 15, weight: .medium))
                            
                            
                            Spacer()
                        }
                        .padding(.bottom, 5)
                        
                        
                        HStack{
                            Text("About your child")
                                .foregroundColor(.neutral_10)
                                .font(.system(size: 35, weight: .medium))
                                .multilineTextAlignment(.leading)
                                .minimumScaleFactor(0.5)
                                .lineLimit(1)
                            
                            Spacer()
                        }
                        
                        HStack{
                            Text("We love to get to know each other, tell us a little about yourself.")
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
                       
                        //Full name textfield
                        VStack(spacing: 10) {
                            
                            HStack{
                                Text("Full name")
                                    .foregroundColor(.neutral_10)
                                    .font(.system(size: 12,weight: .medium))
                                
                                Spacer()
                            }
                            .padding(.leading,10)
                            
                            ZStack(alignment: .leading) {
                                if firstName.isEmpty {
                                    Text("Jhon Jenner")
                                        .foregroundColor(.neutral_400)
                                }
                                TextField("", text: $firstName)
                                    .foregroundColor(.neutral_10)
                                    .submitLabel(.done)
                                    .focused($isFocusedOn, equals: .fullname)
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
                                            .stroke(isFocusedOn == .fullname ? Color.primary_300 : .clear, lineWidth: isFocusedOn == .fullname ? 2.8 : 0)
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
                    
                    
                    Spacer()
                    
                    //Buttons
                    VStack(spacing: 20){
                        NavigationLink {
                            AgeOfChildScreen()
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

struct AboutYourChildScreen_Previews: PreviewProvider {
    static var previews: some View {
        AboutYourChildScreen()
    }
}
