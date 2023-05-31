//
//  SquareGrayButtonWithIcon.swift
//  Hubble
//
//  Created by Abdel Baali on 31/05/23.
//

import SwiftUI

struct SquareGrayButtonWithIcon: View {
    
    @State var icon: String = ""
    
    var body: some View {
        HStack{
            Image(icon)
                .resizable()
                .frame(width: 17, height: 17)
                
        }
        .frame(maxWidth: 55, maxHeight: 55)
        .background{
            RoundedRectangle(cornerRadius: 18)
                .stroke(Color.neutral_600, lineWidth: 1.8)
                .foregroundColor(.clear)
                
        }
    }
}

struct SquareGrayButtonWithIcon_Previews: PreviewProvider {
    static var previews: some View {
        SquareGrayButtonWithIcon()
    }
}
