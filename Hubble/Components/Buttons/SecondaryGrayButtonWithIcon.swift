//
//  SecondaryGrayButtonWithIcon.swift
//  Hubble
//
//  Created by Abdel Baali on 31/05/23.
//

import SwiftUI

struct SecondaryGrayButtonWithIcon: View {
    
    @State var icon: String = ""
    @State var label: String = ""
    
    var body: some View {
        HStack{
            HStack {
                Image(icon)
                    .resizable()
                    .frame(width: 22, height: 22)
                
                Text(label)
                    .foregroundColor(.neutral_200)
                .font(.system(size: 17, weight: .semibold))
            }
                
        }
        .frame(maxWidth: .infinity, maxHeight: 60)
        .background{
            RoundedRectangle(cornerRadius: 18)
                .stroke(Color.neutral_600, lineWidth: 2.5)
                .foregroundColor(.clear)
                
        }
    }
}

struct SecondaryGrayButtonWithIcon_Previews: PreviewProvider {
    static var previews: some View {
        SecondaryGrayButtonWithIcon()
    }
}
