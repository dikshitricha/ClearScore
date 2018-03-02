//
//  NetworkManager.swift
//  ClearScore
//
//  Created by Dikshit, Richa.
//  Copyright © 2018 Richa Dikshit. All rights reserved.
//

import Foundation

private let _requestTimeout = TimeInterval(20)

class NetworkManager: NSObject, URLSessionDelegate {
    //MARK: - singleton
    static var sharedInstance = NetworkManager()
    
    //MARK: - variables
    fileprivate var session : Foundation.URLSession!
    
    override init() {
        super.init()
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = _requestTimeout
        session = Foundation.URLSession(configuration: configuration, delegate: self, delegateQueue: nil)
    }
    
    func getDataFromURL(urlString : String, completion : @escaping (Data?, URLResponse?, Error?) -> Void) {
        
        let url = URL(string: urlString)!
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            completion(data,response,error)
            
        }
        
        task.resume()
        
        
    }
}
