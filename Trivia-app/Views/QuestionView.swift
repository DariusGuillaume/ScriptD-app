
import SwiftUI

struct QuestionView: View {
    
    @EnvironmentObject var triviaManager : TriviaManager
    var body: some View {
        VStack(spacing:40){
            HStack {
                Text("ScriptD")
                    .orangeTitle()
                
                Spacer()
                Text("1 out of 10")
                    .foregroundColor(Color("AccentColor"))
                    .fontWeight(.heavy)
            }
            ProgressBar(progress: 40)
            VStack(alignment: .leading, spacing: 20) {
               Text("How old was Laurence Fishburne when Francis Ford Coppola cast him in Apocalypse Now (1979)? ")
                
                    .font(.system(size: 20))
                    .foregroundColor(Color.yellow)
                    .bold()
                    
                AnswerRow(answer:Answer(text: AttributedString("16"), isCorrect: false))
                    .environmentObject(triviaManager)
                AnswerRow(answer:Answer(text: AttributedString("14"), isCorrect: true))
                    .environmentObject(triviaManager)
                AnswerRow(answer:Answer(text: AttributedString("18"), isCorrect: false))
                    .environmentObject(triviaManager)
                AnswerRow(answer:Answer(text: AttributedString("20"), isCorrect: false))
                    .environmentObject(triviaManager)
                    
            }
            PrimaryButton(text:"Next")
            
            Spacer()
        }
        
        .padding()
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
        .background(Color(white:0.1))
        .navigationBarHidden(true)
    }
}

struct QuestionView_Previews : PreviewProvider {
    static var previews : some View {
        QuestionView()
            .environmentObject(TriviaManager())
    }
}
