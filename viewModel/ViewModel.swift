//
//  ViewModel.swift
//  CovidStatsApp
//
//  Created by Duash on 10/15/21.
//

import Foundation

class ViewModel {
    var countries = [Country]() , filteredCountries = [Country]()
    let networking = Networking()
    func viewModelResponse (for url: String , completion: @escaping  (Countries) ->()) {
        networking.response(with: url) { [weak self] (countries) in
            self?.countries = countries.Countries
            completion(countries)
        }
    }
}
