//
//  ParentBank.swift
//  ahmed_chebbi_ios_challenge
//
//  Created by Chebbi on 22/03/2021.
//

// MARK: - ParentBank
struct ParentBank: Codable {
    let name: String?
    let logoURL: String?
    let banks: [Bank]?
    let isHighlighted: Bool?
    let displayOrder: Int?

    enum CodingKeys: String, CodingKey {
        case name
        case logoURL = "logo_url"
        case banks
        case isHighlighted = "is_highlighted"
        case displayOrder = "display_order"
    }
}
