//
//  JokeView.swift
//  DadJokesIntake
//
//  Created by Annurdien Rasyid on 07/09/24.
//

import SwiftUI

struct JokeView: View {
    private var joke: Joke?
    
    init(joke: Joke? = nil) {
        self.joke = joke
    }
    
    var body: some View {
        VStack {
            Text(joke?.joke ?? "Touch Pes to get joke")
                .font(.title2)
                .foregroundStyle(.pesBlack)
                .fontDesign(.serif)
                .multilineTextAlignment(.center)
            if joke != nil {
                Button(action: copyJokeToClipboard) {
                    Image(systemName: "doc.on.doc")
                        .foregroundStyle(.pesBlack)
                        .padding(5)
                }
            }
        }
    }
    
    func copyJokeToClipboard() {
        guard let joke = joke?.joke else {
            print("No joke loaded")
            return
        }
        
        UIPasteboard.general.string = joke
    }
}
