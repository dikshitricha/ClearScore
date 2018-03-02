//
//  DataManager.swift
//  ClearScore
//
//  Created by Dikshit, Richa.
//  Copyright © 2018 Richa Dikshit. All rights reserved.
//

import Foundation



public enum APIError:Error {
    case networkError
    case dataError
    case inValidURL
    case unknownError
    
    func errorString() -> String {
        switch self {
        case .networkError:
            return NSLocalizedString("An error occured while processing the request", comment: "Network Error")
        case .dataError:
            return NSLocalizedString("Unable to parse dara", comment: "Error in data parsing")
        case .inValidURL:
            return NSLocalizedString("Unable to recongnize the url", comment: "Error in the url")
        case .unknownError:
            return NSLocalizedString("Something went wrong. Please try again later", comment: "Unknown Error")
        }
    }
}

public typealias Success = (_ response: Any) -> ()
public typealias Failure = (_ error: APIError?) -> ()
private let creditScoreURL = "https://5lfoiyb0b3.execute-api.us-west-2.amazonaws.com/prod/mockcredit/values"
class DataManager: NSObject {
    func fetchCreditScore(success : @escaping Success, failure: @escaping Failure) {
        guard let url = URL(string:creditScoreURL) else {
           failure(.inValidURL)
            return
        }
        let request = URLRequest(url:url)
        URLSession.shared.dataTask(with: request) {
            (data, response, error) in
            if error == nil {
                do {
                    let creditScore = try JSONDecoder().decode(CreditScore.self, from: data!)
                    success(creditScore)
                } catch {
                    failure(.networkError)
                    return
                }
            } else {
                failure(.dataError)
                return
            }
            
            }.resume()
    }
}
