//
//  Networking.swift
//  CovidStatsApp
//
//  Created by Duash on 10/15/21.
//

import Foundation


// this is basically is escaping closure
// we need to use this closure and use it in different places so that we use it a like a block of code we can use around


class Networking {
    func response (with url: String  ,  completion: @escaping (Countries) -> ()) {
        guard let url = URL(string: url) else {
            return
        }
        
        URLSession.shared.dataTask(with: url, completionHandler: { (data , response , error ) in
            self.selfCompletingHandler(data: data, response: response, error: error, completion: completion)
           }
        ).resume()
    }
    
    
    func selfCompletingHandler ( data: Data? , response: URLResponse? , error: Error? , completion: (Countries)-> ()) {
        guard let data = data else {return}
        do {
           let jsonDecoder = JSONDecoder()
            let countries = try jsonDecoder.decode(Countries.self, from: data)
            completion(countries)
        } catch {
            print("Unable to decode with error  \(error)")
        }
    }
}

