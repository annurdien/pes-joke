//
//  ApiClient.swift
//  DadJokesIntake
//
//  Created by Annurdien Rasyid on 07/09/24.
//

import Foundation
import Alamofire

class APIClient {
    @discardableResult
    private static func performRequest<T:Decodable>(route:APIRouter, decoder: JSONDecoder = JSONDecoder(), completion:@escaping (Result<T, AFError>)->Void) -> DataRequest {
        return AF.request(route)
                        .responseDecodable (decoder: decoder){ (response: DataResponse<T, AFError>) in
                            completion(response.result)
        }
    }
    
    static func getJoke(completion: @escaping (Result<Joke, AFError>)->Void) {
        performRequest(route: APIRouter.joke, completion: completion)
    }
}
