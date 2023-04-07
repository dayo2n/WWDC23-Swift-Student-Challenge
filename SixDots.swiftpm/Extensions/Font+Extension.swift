//
//  File.swift
//  
//
//  Created by 제나 on 2023/04/07.
//
import SwiftUI

extension Font {
    static func sandoll(size fontSize: CGFloat, weight: Font.Weight) -> Font {
            let familyName = "AppleSDGothicNeo"

            var weightString: String
            switch weight {
            case .regular:
                weightString = "Regular"
            case .thin:
                weightString = "Thin"
            case .ultraLight:
                weightString = "UltraLight"
            case .light:
                weightString = "Light"
            case .medium:
                weightString = "Medium"
            case .semibold:
                weightString = "SemiBold"
            case .bold:
                weightString = "Bold"
            default:
                weightString = "Regular"
            }

        return .custom("\(familyName)-\(weightString)", size: fontSize) ?? .system(size: fontSize, weight: weight)
        }
}
