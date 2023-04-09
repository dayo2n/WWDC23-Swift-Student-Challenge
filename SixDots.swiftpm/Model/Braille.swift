//
//  Braille.swift
//  
//
//  Created by 제나 on 2023/04/08.
//

import Foundation

struct Braille {
    let keyword: String
    let cells: [Bool]
    
    static let BRAILLE_NUMBERS = [Braille(keyword: "1", cells: [true, false, false, false, false, false]),
                                  Braille(keyword: "2", cells: [true, true, false, false, false, false]),
                                  Braille(keyword: "3", cells: [true, false, false, true, false, false]),
                                  Braille(keyword: "4", cells: [true, false, false, true, true, false]),
                                  Braille(keyword: "5", cells: [true, false, false, false, true, false]),
                                  Braille(keyword: "6", cells: [true, true, false, true, false, false]),
                                  Braille(keyword: "7", cells: [true, true, false, true, true, false]),
                                  Braille(keyword: "8", cells: [true, true, false, false, true, false]),
                                  Braille(keyword: "9", cells: [false, true, false, true, false, false]),
                                  Braille(keyword: "0", cells: [false, true, false, true, true, false])]
    static let BRAILLE_ALPHABETS = [Braille(keyword: "a", cells: [true, false, false, false, false, false]),
                                    Braille(keyword: "b", cells: [true, true, false, false, false, false]),
                                    Braille(keyword: "c", cells: [true, false, false, true, false, false]),
                                    Braille(keyword: "d", cells: [true, false, false, true, true, false]),
                                    Braille(keyword: "e", cells: [true, false, false, false, true, false]),
                                    Braille(keyword: "f", cells: [true, true, false, true, false, false]),
                                    Braille(keyword: "g", cells: [true, true, false, true, true, false]),
                                    Braille(keyword: "h", cells: [true, true, false, false, true, false]),
                                    Braille(keyword: "i", cells: [false, true, false, true, false, false]),
                                    Braille(keyword: "j", cells: [false, true, false, true, true, false])]
}
