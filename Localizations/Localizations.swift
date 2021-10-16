//
//  Localizations.swift
//  CovidStatsApp
//
//  Created by Duash on 10/15/21.
//

import Foundation

public enum LocalizedString: String {
    
    case newConfirmed = "NewConfirmed"
    case totalConfirmed = "TotalConfirmed"
    case newDeaths = "NewDeaths"
    case totalDeaths = "TotalDeaths"
    case newRecovered = "NewRecovered"
    case totalRecovered = "TotalRecovered"
    case navPlaceHolder = "Enter a country"
    case covidStatsNavTitle = "Covid Statistics"
    
    var translated: String {
        return NSLocalizedString(self.rawValue, comment: "")
    }
}
