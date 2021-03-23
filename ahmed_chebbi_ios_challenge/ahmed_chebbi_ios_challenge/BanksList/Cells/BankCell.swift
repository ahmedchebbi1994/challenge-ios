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
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.firstTitle.text = nil
        self.profileIMGView.image = nil
    }
 
    
    // MARK: - Bind ViewModel
    func bind(to viewModel: BankViewModel){
        firstTitle.text = viewModel.displayBankName
        let urlPath = viewModel.displayLogUrl
        if urlPath.isEmpty {
            self.profileIMGView.image = UIImage(named: "country")
        } else {
            if let url = URL(string: urlPath) {
                MTAPIClient.downloadImage(url: url) { (image, err) in
                    if err == nil {
                        if let image = image {
                            DispatchQueue.main.async {
                                self.profileIMGView.image = image
                            }
                        }
                    } else {
                        DispatchQueue.main.async {
                            self.profileIMGView.image = UIImage(named: "country")
                        }
                    }
                }
            }
        }
        
    }
    
}
