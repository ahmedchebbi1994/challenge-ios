//
//  Bank.swift
//  ahmed_chebbi_ios_challenge
//
//  Created by Chebbi on 22/03/2021.
//

// MARK: - Bank
struct Bank: Codable {
    let id: Int?
    let resourceURI: String?
    let resourceType: String?
    let name: String?
    let countryCode: CountryCode?
    let automaticRefresh: Bool?
    let primaryColor, secondaryColor: String?
    let logoURL: String?
    let deeplinkIos, deeplinkAndroid: String?
    let transferEnabled, paymentEnabled: Bool
    let form: [Form]?
    let authenticationType: String?
    let parentName: String?
    let capabilities: [String]?
    let payment, transfer: Payment?

    enum CodingKeys: String, CodingKey {
        case id
        case resourceURI = "resource_uri"
        case resourceType = "resource_type"
        case name
        case countryCode = "country_code"
        case automaticRefresh = "automatic_refresh"
        case primaryColor = "primary_color"
        case secondaryColor = "secondary_color"
        case logoURL = "logo_url"
        case deeplinkIos = "deeplink_ios"
        case deeplinkAndroid = "deeplink_android"
        case transferEnabled = "transfer_enabled"
        case paymentEnabled = "payment_enabled"
        case form
        case authenticationType = "authentication_type"
        case parentName = "parent_name"
        case capabilities
        case payment, transfer
    }
}
