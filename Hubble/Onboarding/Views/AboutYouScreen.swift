//
//  AboutYouScreen.swift
//  Hubble
//
//  Created by Abdel Baali on 31/05/23.
//

import SwiftUI

struct AboutYouScreen: View {
    
    enum FocusOn {
        case firstName
        case lastName
    }
    
    
    @FocusState private var isFocusedOn: FocusOn?
    @Environment(\.dismiss) private var dismiss
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    
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
                            Text("STEP 1/5")
                                .foregroundColor(.primary_400)
                            .font(.system(size: 15, weight: .medium))
                            
                            
                            Spacer()
                        }
                        .padding(.bottom, 5)
                        
                        
                        HStack{
                            Text("About you")
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
                    
                    //Text fields
                    VStack(spacing: 20){
                       
                        //First name textfield
                        VStack(spacing: 10) {
                            
                            HStack{
                                Text("First name")
                                    .foregroundColor(.neutral_10)
                                    .font(.system(size: 12,weight: .medium))
                                
                                Spacer()
                            }
                            .padding(.leading,10)
                            
                            ZStack(alignment: .leading) {
                                if firstName.isEmpty {
                                    Text("Mike")
                                        .foregroundColor(.neutral_400)
                                }
                                TextField("", text: $firstName)
                                    .foregroundColor(.neutral_10)
                                    .submitLabel(.next)
                                    .focused($isFocusedOn, equals: .firstName)
                                    .onSubmit {
                                        withAnimation {
                                            self.isFocusedOn = .lastName
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
                                            .stroke(isFocusedOn == .firstName ? Color.primary_300 : .clear, lineWidth: isFocusedOn == .firstName ? 2.8 : 0)
                                            .foregroundColor(.clear)
                                    }
                        }
                            
                        }
                        
                        //last name textfield
                        VStack(spacing: 10) {
                            
                            HStack{
                                Text("Last name")
                                    .foregroundColor(.neutral_10)
                                    .font(.system(size: 12,weight: .medium))
                                
                                Spacer()
                            }
                            .padding(.leading,10)
                            
                            ZStack(alignment: .leading) {
                                if lastName.isEmpty {
                                    Text("Jenner")
                                        .foregroundColor(.neutral_400)
                                }
                                TextField("", text: $lastName)
                                    .foregroundColor(.neutral_10)
                                    .submitLabel(.done)
                                    .focused($isFocusedOn, equals: .lastName)
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
                                            .stroke(isFocusedOn == .lastName ? Color.primary_300 : .clear, lineWidth: isFocusedOn == .lastName ? 2.8 : 0)
                                            .foregroundColor(.clear)
                                    }
                        }
                            
                        }
                        
                    }
                    .padding(.horizontal,20)
                    .padding(.top,20)
                    
                    HStack{
                        Button {
                            
                        } label: {
                            HStack {
                                
                                Spacer()
                                
                                Text("Do you have already an account? Log in")
                                    .underline()
                                    .foregroundColor(.primary_400)
                                .font(.system(size: 12,weight: .medium))
                            }
                            .padding(.horizontal,30)
                            .padding(.top, 12)
                        }

                    }
                    
                    Spacer()
                    
                    //Buttons
                    VStack(spacing: 20){
                        Button {
                            
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

struct AboutYouScreen_Previews: PreviewProvider {
    static var previews: some View {
        AboutYouScreen()
            .previewDevice("iPhone 14 Pro")
        
        AboutYouScreen()
            .previewDevice("iPhone 14 Pro Max")
        
        AboutYouScreen()
            .previewDevice("iPhone 13 mini")
    }
}
