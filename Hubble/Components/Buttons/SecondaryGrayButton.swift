//
//  SecondaryGreyButton.swift
//  Hubble
//
//  Created by Abdel Baali on 31/05/23.
//

import SwiftUI

struct SecondaryGrayButton: View {
    
    @State var label: String = ""
    
    var body: some View {
        HStack{
            Text(label)
                .foregroundColor(.neutral_200)
                .font(.system(size: 17, weight: .semibold))
                
        }
        .frame(maxWidth: .infinity, maxHeight: 60)
        .background{
            RoundedRectangle(cornerRadius: 18)
                .stroke(Color.neutral_600, lineWidth: 2.5)
                .foregroundColor(.clear)
                
        }
        
            
    }
}

struct SecondaryGreyButton_Previews: PreviewProvider {
    static var previews: some View {
        SecondaryGrayButton()
    }
}
