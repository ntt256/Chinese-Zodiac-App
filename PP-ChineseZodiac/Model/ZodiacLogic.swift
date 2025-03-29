//
//  ZodiacLogic.swift
//  PP-ChineseZodiac
//
//  Created by Tay Yeu on 3/25/25.
//This file will serve as the
import UIKit

struct ZodiacLogic{
    let zodiacDict = ["Rat": [2020, 2008, 1996, 1984, 1972, 1960],
                      "Ox": [2021, 2009, 1997, 1985, 1973, 1961],
                      "Tiger": [2022, 2010, 1998, 1986, 1974, 1962, 1950],
                      "Rabbit": [2023, 2011, 1999, 1987, 1975, 1963, 1951],
                      "Dragon": [2024, 2012, 2000, 1988, 1976, 1964, 1952],
                      "Snake": [2025, 2013, 2001, 1989, 1977, 1965, 1953],
                      "Horse": [2014, 2002, 1990, 1978, 1966, 1954],
                      "Goat": [2015, 2003, 1991, 1979, 1967, 1955],
                      "Monkey": [2016, 2004, 1992, 1980, 1968, 1956],
                      "Chicken": [2017, 2005, 1993, 1981, 1969, 1957],
                      "Dog": [2018, 2006, 1994, 1982, 1970, 1958],
                      "Pig": [2019, 2007, 1995, 1983, 1971, 1959]]
    
    var delegate: ZodiacDelegate?
    
    //when a user submits their birthdate, find the animal associated with the year
    func calculateBirthYear(userBirthYear: Int) {
        for(animal, years) in zodiacDict{
            for year in years{
                if year == userBirthYear{
                    delegate?.updateZodiacSign(animal)
                    return
                }
            }
        }
        delegate?.didFailWithError(error: ZodiacError.invalidYear)
    }
}

//MARK: - Protocol: ZodiacDelegate
protocol ZodiacDelegate{
    func updateZodiacSign(_ animal: String)
    func didFailWithError(error: Error)
}

