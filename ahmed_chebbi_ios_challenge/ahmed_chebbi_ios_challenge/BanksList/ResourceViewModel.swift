//
//  BankViewModel.swift
//  ahmed_chebbi_ios_challenge
//
//  Created by Chebbi on 22/03/2021.
//

struct ResourceViewModel {
    
     let banks: [ParentBank]
    private let code: CountryCode
    //Currently we only support banks from FR, GB, DE, ES and NL.
    
    var displayCountryName: String {
        switch code {
        case .de:
            return "Allemagne"
        case .fr:
            return "France"
        case .gb:
            return "Royaume-Uni"
        case .es:
            return "Espagne"
        case .nl:
            return "Royaume des Pays-Bas"
        }
    }
    
    var displayNumbersOfBanks: String {
        return "\(banks.count) banks"
    }
    
    var displayCountryCode: String {
        return code.rawValue.uppercased()
    }
    
    var displayBanksCount: Int {
        return banks.count
    }
    
    
    init(code: CountryCode ,bank: [ParentBank]) {
        self.banks = bank
        self.code = code
    }
}
