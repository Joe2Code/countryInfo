//
//  CountryInfo.swift
//  SimpleCountry
//
//  Created by Joseph Mennemeier on 6/1/16.
//  Copyright © 2016 Joseph Mennemeier. All rights reserved.
//

import Foundation

struct CountryInfo {
    var name: String?
    var capital: String?
    var region: String?
    var subregion: String?
    var population: Int
    var timeZoneArea: String?
    var callingCode: Int
    var currency: String?
    
init(name: String?, capital: String?, region: String?, subregion: String?, population: Int, timeZoneArea: String, callingCode: Int, currency: String?) {
    self.name = name
    self.capital = capital
    self.region = region
    self.subregion = subregion
    self.population = population
    self.timeZoneArea = timeZoneArea
    self.callingCode = callingCode
    self.currency = currency
    }
}

var Countries = [CountryInfo]()