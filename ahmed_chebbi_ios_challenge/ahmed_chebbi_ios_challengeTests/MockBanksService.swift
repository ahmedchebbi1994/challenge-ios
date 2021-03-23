//
//  MockBanksService.swift
//  ahmed_chebbi_ios_challengeTests
//
//  Created by Chebbi on 23/03/2021.
//

@testable import ahmed_chebbi_ios_challenge

final class MockBanksService: BanksServiceProtocol {
    
    
    
    func fetchAllBanks(path: String?, completion: @escaping (([Resource]) -> Void)) {
        let bank = Bank(id: nil, resourceURI: nil, resourceType: nil, name: "LCL", countryCode: .fr, automaticRefresh: true, primaryColor: nil, secondaryColor: nil, logoURL: nil, deeplinkIos: nil, deeplinkAndroid: nil, transferEnabled: nil, paymentEnabled: nil, form: nil, authenticationType: nil, parentName: nil, capabilities: nil, payment: nil, transfer: nil)
        let banks = [bank]
        let parentBank1 = ParentBank(name: "LCL BANK", logoURL: nil, banks: banks, isHighlighted: nil, displayOrder: nil)
        let parentsBank1: [ParentBank] = [parentBank1]
        let resource1 = Resource(countryCode: .fr, parentBanks: parentsBank1)
        
        completion([resource1])
    }
    
    
    
  
    
}
