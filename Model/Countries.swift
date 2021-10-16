//
//  Countries.swift
//  CovidStatsApp
//
//  Created by Duash on 10/15/21.
//

import Foundation


struct Countries : Codable {
    var Countries : [Country]
}

struct Country : Codable {
    var Country : String
    var NewConfirmed : Int
    var TotalConfirmed : Int
    var NewDeaths : Int
    var TotalDeaths : Int
    var NewRecovered : Int
    var TotalRecovered : Int
    var CountryCode : String
}

