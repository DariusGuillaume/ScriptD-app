
import SwiftUI

struct TriviaView: View {
    @EnvironmentObject var triviaManager : TriviaManager
    
    
    var body: some View {
        if triviaManager.endOfGame{
            VStack(spacing:20){
                Text("ScriptD")
                    .orangeTitle()
                
                Text("Thanks for playing , You Win !")
                
                Text ("Your score was \(triviaManager.score) out of \(triviaManager.length)")
                
                Button {
                    Task.init{
                        await triviaManager.fetchTrivia()
                        
                    }
                } label: {
                    PrimaryButton(text: "Play again")
                }
                
            }
            .foregroundColor(Color("AccentColor"))
            .padding()
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
            .background(Color(white: 0.1))
            
        } else {
            QuestionView()
                .environmentObject(triviaManager)
        }
    }
}

#Preview {
    TriviaView()
        .environmentObject(TriviaManager())
}
