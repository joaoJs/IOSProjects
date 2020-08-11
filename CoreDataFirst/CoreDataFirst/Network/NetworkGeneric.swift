//
//  NetworkService.swift
//  GenericsExample
//
//  Created by iAskedYou2nd on 8/11/20.
//  Copyright © 2020 iAskedYou2nd. All rights reserved.
//

import Foundation

class NetworkGeneric {
    
    let session: URLSession
    let decoder: JSONDecoder
    
    init(session: URLSession = URLSession.shared, decoder: JSONDecoder = JSONDecoder()) {
        self.session = session
        self.decoder = decoder
    }
    
    // Type Inference Generics
    func fetch<T: Codable>(urlString: String, completion: @escaping (T?) -> ()) {
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        self.session.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                completion(nil)
                return
            }
            
            do {
                let value = try self.decoder.decode(T.self, from: data)
                completion(value)
            } catch {
                print(error.localizedDescription)
                completion(nil)
            }
        }.resume()
        
        
    }
    
    // Type Passing Generics
    func fetch<T: Codable>(urlString: String, type: T.Type, completion: @escaping (T?) -> ()) {
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        self.session.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                completion(nil)
                return
            }
            
            do {
                let value = try self.decoder.decode(type, from: data)
                completion(value)
            } catch {
                print(error.localizedDescription)
                completion(nil)
            }
        }.resume()
        
    }
    
}
