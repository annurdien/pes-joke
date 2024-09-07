//
//  JokeViewModel.swift
//  DadJokesIntake
//
//  Created by Annurdien Rasyid on 07/09/24.
//

import SwiftUI
import RiveRuntime
import os

class JokeViewModel: ObservableObject {
    private static let logger = Logger(
        subsystem: Bundle.main.bundleIdentifier!,
        category: String(describing: JokeViewModel.self)
    )
    
    @Published private(set) var joke: Joke?
    @Published private(set) var errorMessage: String?
    @Published var shouldShowError: Bool = false
    
    private var pes = RiveViewModel(fileName: K.Resources.pesRive)
    
    func getJoke() {
        pes.triggerInput(K.PesState.shake)
        pes.setInput(K.PesState.processing, value: true)
        
        APIClient.getJoke() { result in
            switch(result) {
            case .success(let joke):
                self.pes.setInput(K.PesState.processing, value: false)
                withAnimation { self.joke = joke }
                
            case .failure(let error):
                self.pes.setInput(K.PesState.processing, value: false)
                self.errorMessage = K.Message.networkErrorMessage
                self.shouldShowError = true
                Self.logger.error("\(error.localizedDescription, privacy: .public)")
            }
        }
    }
    
    func getPesView() -> AnyView {
        return pes.view()
    }
}
