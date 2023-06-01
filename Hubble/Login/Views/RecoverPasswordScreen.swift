//
//  RecoverPasswordScreen.swift
//  Hubble
//
//  Created by Abdel Baali on 01/06/23.
//

import SwiftUI

struct RecoverPasswordScreen: View {
    
    private enum FocusTextfield {
         case fieldInput
     }
    
    @FocusState private var isFocusedOn: FocusTextfield?
    @Environment(\.dismiss) private var dismiss
    @State private var fieldInput: String = ""
    
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
                    .padding(.bottom,30)
                    
                    
                    //Texts
                    VStack(spacing: 15){
                        HStack{
                            Text("Recover password")
                                .foregroundColor(.neutral_10)
                                .font(.system(size: 35, weight: .medium))
                                .multilineTextAlignment(.leading)
                                .minimumScaleFactor(0.5)
                                .lineLimit(1)
                            
                            Spacer()
                        }
                        
                        HStack{
                            Text("Enter your email or phone number associated with your account.")
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
                    
                    //Text field
                    VStack(spacing: 18){
                       
                        //input textfield
                        VStack(spacing: 10) {
                            
                            HStack{
                                Text("Username or email")
                                    .foregroundColor(.neutral_10)
                                    .font(.system(size: 12,weight: .medium))
                                
                                Spacer()
                            }
                            .padding(.leading,10)
                            
                            ZStack(alignment: .leading) {
                                if fieldInput.isEmpty {
                                    Text(verbatim: "example@mail.com")
                                        .foregroundColor(.neutral_400)
                                }
                                TextField("", text: $fieldInput)
                                    .foregroundColor(.neutral_10)
                                    .submitLabel(.done)
                                    .focused($isFocusedOn, equals: .fieldInput)
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
                                            .stroke(isFocusedOn == .fieldInput ? Color.primary_300 : .clear, lineWidth: isFocusedOn == .fieldInput ? 2.8 : 0)
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
                            AboutYouScreen()
                        } label: {
                            PrimaryPurpleButton(label: "continue")
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

struct RecoverPasswordScreen_Previews: PreviewProvider {
    static var previews: some View {
        RecoverPasswordScreen()
    }
}
