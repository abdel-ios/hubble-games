//
//  PrimaryPurpleButton.swift
//  Hubble
//
//  Created by Abdel Baali on 31/05/23.
//

import SwiftUI

struct PrimaryPurpleButton: View {
    
    @State var label: String = ""
    
    var body: some View {
        HStack{
            Text(label)
                .foregroundColor(.neutral_10)
                .font(.system(size: 17, weight: .semibold))
                
        }
        .frame(maxWidth: .infinity, maxHeight: 60)
        .background{
            Color.primary_500
        }
        .cornerRadius(18)
    }
}

struct PrimaryPurpleButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryPurpleButton()
    }
}
