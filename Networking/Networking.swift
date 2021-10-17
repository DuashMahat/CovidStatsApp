//
//  Networking.swift
//  CovidStatsApp
//
//  Created by Duash on 10/15/21.
//

import Foundation

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

