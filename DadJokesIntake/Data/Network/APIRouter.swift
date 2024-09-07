//
//  ApiRouter.swift
//  DadJokesIntake
//
//  Created by Annurdien Rasyid on 07/09/24.
//

import Foundation
import Alamofire

enum APIRouter: URLRequestConvertible {
    
    case joke
    
    // MARK: - HTTPMethod
    private var method: HTTPMethod {
        switch self {
        case .joke:
            return .get
        }
    }
    
    // MARK: - Path
    private var path: String {
        switch self {
        case .joke:
            return "/"
        }
    }
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try K.ProductionServer.baseURL.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        // Common Headers
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        
        return urlRequest
    }
}
