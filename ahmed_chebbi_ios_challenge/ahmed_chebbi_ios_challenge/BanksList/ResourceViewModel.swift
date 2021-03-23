//
//  BankViewModel.swift
//  ahmed_chebbi_ios_challenge
//
//  Created by Chebbi on 22/03/2021.
//

struct ResourceViewModel {
    
    private let banks: [ParentBank]
    private let code: CountryCode
    
    var displayCountryName: String {
        let countryName = "\(Wording["country_\(code.rawValue)"])"
        var flag = ""
        switch code {
        case .de:
            flag = " 🇩🇪"
        case .fr:
            flag = " 🇫🇷"
        case .gb:
            flag = " 🇬🇧"
        case .es:
            flag = " 🇪🇸"
        case .nl:
            flag = " 🇳🇱"
        }
        return countryName + flag
    }
    
 
    var displayCountryCode: String {
        return code.rawValue.uppercased()
    }
    
    var displayBanksCount: Int {
        return banks.count
    }
    
    var displayBanks: [BankViewModel] {
        var banksViewModel: [BankViewModel] = []
        banks.forEach { (parentBank) in
            parentBank.banks?.forEach({ (bank) in
                banksViewModel.append(BankViewModel(bank: bank))
            })
        }
        return banksViewModel
    }
    
    
    init(code: CountryCode ,bank: [ParentBank]) {
        self.banks = bank
        self.code = code
    }
}
