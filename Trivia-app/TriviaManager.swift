
import Foundation
import SwiftUI

class TriviaManager: ObservableObject {
    private(set) var trivia: [Trivia.Result] = []
    @Published private(set) var length = 0
    @Published private(set) var index = 0
    @Published private(set) var question: AttributedString = ""
    @Published private(set) var answerChoices: [Answer] = []
    @Published private(set) var score = 0
    @Published private(set) var progress: CGFloat = 0.00
    @Published private(set) var answerChosen = false
    @Published private(set) var endOfGame = false
    

    init() {
        Task.init {
            await fetchTrivia()
        }
    }
    
    func fetchTrivia() async {
        guard let url = URL(string: "https://opentdb.com/api.php?amount=20&category=11 " ) else { fatalError("Missing URL") }
        
        let urlRequest = URLRequest(url: url)
        
        do {
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                throw FetchingError.invalidStatusCode
            }
            
            enum FetchingError: Error {
                case invalidStatusCode
            }


            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let decodedData = try decoder.decode(Trivia.self, from: data)

            DispatchQueue.main.async {
              
                self.index = 0
                self.score = 0
                self.progress = 0.00
                self.endOfGame = false

               
                self.trivia = decodedData.results
                self.length = self.trivia.count
                self.setQuestion()
            }
        } catch {
            print("Triva error \(error)")
        }
    }
    
  
    func nextQuestion() {
      
        if index + 1 < length {
            index += 1
            setQuestion()
        } else {
          
            endOfGame = true
        }
    }
    
 
    func setQuestion() {
        answerChosen = false
        progress = CGFloat(Double((index + 1)) / Double(length) * 350)

        
        if index < length {
            let currentTriviaQuestion = trivia[index]
            question = currentTriviaQuestion.formattedQuestion
            answerChoices = currentTriviaQuestion.answers
        }
    }
    
  
    func selectAnswer(answer: Answer) {
        answerChosen = true
        
      
        if answer.isCorrect {
            score += 1
        }
    }
}
