//
//  BankViewModel.swift
//  ahmed_chebbi_ios_challenge
//
//  Created by Chebbi on 22/03/2021.
//

struct ResourceViewModel {
    
    private let resource: Resource
    
    var displayCountryName: String {
        if let code = resource.countryCode {
            let countryName = "# \(Wording["country_\(code.rawValue)"])"
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
        return ""
    }
    
 
    var displayCountryCode: String {
        return resource.countryCode?.rawValue.uppercased() ?? ""
    }
    
    var displayBanksCount: Int {
        return resource.parentBanks?.count ?? 0
    }
    
    var displayBanks: [BankViewModel] {
        var banksViewModel: [BankViewModel] = []
        resource.parentBanks?.forEach { (parentBank) in
            parentBank.banks?.forEach({ (bank) in
                banksViewModel.append(BankViewModel(bank: bank))
            })
        }
        return banksViewModel
    }
    
    
    init(resource: Resource) {
        self.resource = resource
    }
}
