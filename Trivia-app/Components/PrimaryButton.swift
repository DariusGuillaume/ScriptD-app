//
//  PrimaryButton.swift
//  Trivia-app
//
//  Created by Darius Guillaume on 2/8/24.
//

import SwiftUI

struct PrimaryButton: View {
    var text : String
    var background: Color = Color("AccentColor")
    
    
    var body: some View {
        
        Text(text)
            .foregroundColor(.white)
            .padding()
            .padding(.horizontal)
            .background(background)
            .cornerRadius(30)
            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    PrimaryButton(text:"Next")
}
