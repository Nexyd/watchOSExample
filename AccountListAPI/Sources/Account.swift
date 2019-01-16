//
//  Account.swift
//  VisibleAccounts
//
//  Created by Daniel Morato on 15/01/2019.
//  Copyright © 2019 dani. All rights reserved.
//

import Foundation

public class Account: Codable {
    public var accountBalanceInCents: Int?
    public var accountCurrency: String?
    public var accountId: Int?
    public var accountName: String?
    public var accountNumber: Int?
    public var accountType: String?
    public var alias: String?
    public var isVisible: Bool?
    public var iban: String?
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        accountBalanceInCents = try? container.decode(Int.self, forKey: .accountBalanceInCents)
        accountCurrency = try? container.decode(String.self, forKey: .accountCurrency)
        accountId = try? container.decode(Int.self, forKey: .accountId)
        accountName = try? container.decode(String.self, forKey: .accountName)
        accountNumber = try? container.decode(Int.self,  forKey: .accountNumber)
        accountType = try? container.decode(String.self, forKey: .accountType)
        alias = try? container.decode(String.self, forKey: .alias)
        isVisible = try? container.decode(Bool.self, forKey: .isVisible)
        iban = try? container.decode(String.self, forKey: .iban)
    }

    internal enum CodingKeys: String, CodingKey {
        case accountBalanceInCents
        case accountCurrency
        case accountId
        case accountName
        case accountNumber
        case accountType
        case alias
        case isVisible
        case iban
    }
}

public class AccountList: Codable {
    public var accounts: [Account]
}
