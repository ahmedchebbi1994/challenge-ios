//
//  BanksListViewModelSpec.swift
//  ahmed_chebbi_ios_challengeTests
//
//  Created by Chebbi on 23/03/2021.
//

import XCTest
@testable import ahmed_chebbi_ios_challenge

class BanksListViewModelSpec: XCTestCase {

    
    var viewModel: BanksListViewModel!
    var mockBanksService: MockBanksService!
    
    
    override func setUp() {
        mockBanksService = MockBanksService()
        viewModel = .init(service: mockBanksService)
    }
    
    func testBankViewModel(){
        let bank = Bank(id: nil, resourceURI: nil, resourceType: nil, name: "LCL", countryCode: .fr, automaticRefresh: true, primaryColor: nil, secondaryColor: nil, logoURL: nil, deeplinkIos: nil, deeplinkAndroid: nil, transferEnabled: nil, paymentEnabled: nil, form: nil, authenticationType: nil, parentName: nil, capabilities: nil, payment: nil, transfer: nil)
        
        let bankViewModel = BankViewModel(bank: bank)
        

        XCTAssertEqual(bank.name, bankViewModel.displayBankName)
 
    }

}
