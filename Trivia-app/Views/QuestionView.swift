
import SwiftUI

struct QuestionView: View {
    
    @EnvironmentObject var triviaManager : TriviaManager
    var body: some View {
        VStack(spacing:40){
            HStack {
                Text("ScriptD")
                    .orangeTitle()
                
                Spacer()
                
                Text("\(triviaManager.index + 1)out of \(triviaManager.length)")
                    .foregroundColor(Color("AccentColor"))
                    .fontWeight(.heavy)
            }
            ProgressBar(progress: triviaManager.progress)
            VStack(alignment: .leading, spacing: 20) {
                Text(triviaManager.question)
                    .font(.system(size: 20))
                    .foregroundColor(Color.yellow)
                    .bold()
                
                ForEach(triviaManager.answerChoices , id: \.id) {answer in
                    AnswerRow(answer:answer)
                        .environmentObject(triviaManager)
                }
                    
            }
            Button{
                triviaManager.nextQuestion()
                
            } label: {
                PrimaryButton(text:"Next", background: triviaManager.answerChosen ? Color("AccentColor") : Color(hue: 1.0, saturation: 0.0 , brightness: 0.564 , opacity : 0.327))
            }
            
            .disabled(!triviaManager.answerChosen)
            Spacer()
        }
        
        .padding()
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity )
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
