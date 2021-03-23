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
        let bank = Bank(id: nil,
                        resourceURI: nil, resourceType: nil, name: "LCL", countryCode: .fr, automaticRefresh: true, primaryColor: nil, secondaryColor: nil, logoURL: nil, deeplinkIos: nil, deeplinkAndroid: nil, transferEnabled: nil, paymentEnabled: nil, form: nil, authenticationType: nil, parentName: nil, capabilities: nil, payment: nil, transfer: nil)
        
        let bankViewModel = BankViewModel(bank: bank)
        XCTAssertEqual(bank.name, bankViewModel.displayBankName)
    }
    
    func testResourceViewModel(){
        let resource = Resource(countryCode: .fr, parentBanks: [])
        let resourceViewModel = ResourceViewModel(resource: resource)
        XCTAssertEqual("# France 🇫🇷", resourceViewModel.displayCountryName)
        XCTAssertEqual(resourceViewModel.displayBanksCount, 0 )
    }
    
    func testCheckBanksListViewModel(){
        viewModel.fetchAllBanks { (resourcesViewModel) in
            XCTAssertEqual(resourcesViewModel.count, 1)
            XCTAssertEqual(resourcesViewModel.first?.displayCountryName ?? "", "# France 🇫🇷")
            XCTAssertNotEqual(resourcesViewModel.first?.displayBanks.first?.displayBankName ?? "", "BNP Paris bas")
        }
    }
    

}
