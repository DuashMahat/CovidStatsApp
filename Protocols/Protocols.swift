//
//  Protocols.swift
//  CovidStatsApp
//
//  Created by Duash on 10/15/21.
//

import Foundation


// Any class that conforms to these must implement functions and identifier on their own
protocol SelfConfiguringCell {
    static var reuseidentifier: String {get}
    func configure (with country: Country , for indexpath: IndexPath)
}



protocol selfConfiguringViewController {
    func configure (with country: Country)
}

