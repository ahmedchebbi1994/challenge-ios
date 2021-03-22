//
//  Resource.swift
//  ahmed_chebbi_ios_challenge
//
//  Created by Chebbi on 22/03/2021.
//


// MARK: - Resource
struct Resource: Codable {
    let countryCode: CountryCode?
    let parentBanks: [ParentBank]?

    enum CodingKeys: String, CodingKey {
        case countryCode = "country_code"
        case parentBanks = "parent_banks"
    }
}

//Currently we only support banks from FR, GB, DE, ES and NL.
enum CountryCode: String, Codable {
    case fr = "FR"
    case gb = "GB"
    case de = "DE"
    case es = "ES"
    case nl = "NL"
}
