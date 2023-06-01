//
//  SquareGrayButtonWithIcon.swift
//  Hubble
//
//  Created by Abdel Baali on 31/05/23.
//

import SwiftUI

struct SquareGrayButtonWithIcon: View {
    
    @State var icon: String = ""
    @State var iconSize: CGFloat = 17
    
    var body: some View {
        HStack{
            Image(icon)
                .resizable()
                .frame(width: iconSize, height: iconSize)
                
        }
        .frame(maxWidth: 50, maxHeight: 50)
        .background{
            RoundedRectangle(cornerRadius: 15)
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
