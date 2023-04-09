//
//  LearningItem.swift
//  
//
//  Created by 제나 on 2023/04/08.
//

import Foundation

enum LearningMode {
    case number
    case alphabet
}

struct LearningItem {
    var learningMode: LearningMode
    var learningItems: [String] {
        switch learningMode {
        case .number:
            return ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"]
        case .alphabet:
            return ["a", "b", "c", "d", "e",
                    "f", "g", "h", "i", "j",
                    "k", "l", "m", "n", "o",
                    "p", "q", "r", "s", "t",
                    "u", "v", "w", "x", "y", "z"]
        }
    }
}
