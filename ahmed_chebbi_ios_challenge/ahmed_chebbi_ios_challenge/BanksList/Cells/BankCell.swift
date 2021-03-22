//
//  BankCell.swift
//  ahmed_chebbi_ios_challenge
//
//  Created by Chebbi on 22/03/2021.
//

import UIKit

final class BankCell: GeneralCell {

    // MARK: - Property
    static let identifier = "BankCell"
    
 
    
    // MARK: - Bind ViewModel
    func bind(to viewModel: ResourceViewModel){
        firstTitle.text = viewModel.displayCountryName
        secondTitle.text = viewModel.displayNumbersOfBanks
        profileLblIMGView.text = viewModel.displayCountryCode
        
        profileIMGView.image = UIImage(named: "country")
    }
    
}
