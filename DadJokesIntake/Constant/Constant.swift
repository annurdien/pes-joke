//
//  Constant.swift
//  DadJokesIntake
//
//  Created by Annurdien Rasyid on 07/09/24.
//

import Foundation


struct K {
    struct ProductionServer {
        static let baseURL = "https://icanhazdadjoke.com"
    }
    
    struct PesState {
        static let processing = "Processing"
        static let shake = "Shake"
    }
    
    struct Resources {
        static let pesRive = "pes"
    }
    
    struct Message {
        static let networkErrorMessage = "Ups!, your you have problem with internet connection, Pes can't fetch jokes right now"
    }
}
