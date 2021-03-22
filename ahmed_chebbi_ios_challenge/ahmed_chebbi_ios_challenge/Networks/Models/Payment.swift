//
//  Payment.swift
//  ahmed_chebbi_ios_challenge
//
//  Created by Chebbi on 22/03/2021.
//

// MARK: - Payment
struct Payment: Codable {
    let nbMaxTransactions: Int?
    let maxSizeLabel: Int?

    enum CodingKeys: String, CodingKey {
        case nbMaxTransactions = "nb_max_transactions"
        case maxSizeLabel = "max_size_label"
    }
}
