//
//  Wording.swift
//  ahmed_chebbi_ios_challenge
//
//  Created by Chebbi on 23/03/2021.
//
import Foundation
enum Wording {

    // ==========================
    // MARK: Current Localization
    // ==========================

    static let currentLocalization = Bundle.main.preferredLocalizations.first ?? "(unknown)"


    static subscript(_ key: String) -> String {
        return NSLocalizedString(key, comment: "")
    }

   
}
