//
//  BankViewModel.swift
//  ahmed_chebbi_ios_challenge
//
//  Created by Chebbi on 23/03/2021.
//

struct BankViewModel {
    
    private let bank: Bank
 
 
    var displayBankName: String {
        return bank.name ?? ""
    }
    
    var displayLogUrl: String {
        return bank.logoURL ?? ""
    }
 
    
    init(bank: Bank) {
        self.bank = bank
    }
}
