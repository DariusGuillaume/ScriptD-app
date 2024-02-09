//
//

import SwiftUI

struct TriviaView: View {
    @EnvironmentObject var triviaManager : TriviaManager
    var body: some View {
        QuestionView()
            .environmentObject(triviaManager)
    }
}

#Preview {
    TriviaView()
        .environmentObject(TriviaManager())
}
