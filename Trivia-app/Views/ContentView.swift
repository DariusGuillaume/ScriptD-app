
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack (spacing:40){
            
            VStack(spacing:20){
                Text("Trivia Game")
                    .orangeTitle()
                    
                Text("Are you ready to test your movie knowledge?")
                    .foregroundColor(Color("AccentColor"))
                    
            }
            
            PrimaryButton(text: "START")
           
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.all )
        .background(Color(white: 0.1))
        
    }
}

#Preview {
    ContentView()
}
