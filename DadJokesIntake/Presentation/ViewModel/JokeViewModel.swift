//
//  JokeViewModel.swift
//  DadJokesIntake
//
//  Created by Annurdien Rasyid on 07/09/24.
//

import Foundation
import RiveRuntime
import SwiftUI

class JokeViewModel: ObservableObject {
    @Published var joke: Joke?
    
    private var pes = RiveViewModel(fileName: "pes")
    
    func getJoke() {
        pes.triggerInput("Shake")
        pes.setInput("Processing", value: true)
        
        APIClient.getJoke() { [weak self] result in
            switch(result) {
            case .success(let joke):
                self?.pes.setInput("Processing", value: false)
                self?.joke = joke
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getPesView() -> AnyView {
        return pes.view()
    }
}
