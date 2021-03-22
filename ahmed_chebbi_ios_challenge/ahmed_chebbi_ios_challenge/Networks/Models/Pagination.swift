//
//  Pagination.swift
//  ahmed_chebbi_ios_challenge
//
//  Created by Chebbi on 22/03/2021.
//

// MARK: - Pagination
struct Pagination: Codable {
    let previousURI, nextURI: String?

    enum CodingKeys: String, CodingKey {
        case previousURI = "previous_uri"
        case nextURI = "next_uri"
    }
}
