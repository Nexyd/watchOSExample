//
//  ListAPI.swift
//  VisibleAccounts
//
//  Created by Daniel Morato on 15/01/2019.
//  Copyright © 2019 dani. All rights reserved.
//

import Foundation

public class ListAPI {
    
    public static func getAccounts() -> AccountList {
        let jsonData: Data = """
        {
          "accounts": [
            {
              "accountBalanceInCents": 985000,
              "accountCurrency": "EUR",
              "accountId": 748757694,
              "accountName": "Hr P L G N StellingTD",
              "accountNumber": 748757694,
              "accountType": "PAYMENT",
              "alias": "",
              "isVisible": true,
              "iban": "NL23INGB0748757694"
            },
            {
              "accountBalanceInCents": 1000000,
              "accountCurrency": "EUR",
              "accountId": 700000027559,
              "accountName": ",",
              "accountNumber": 748757732,
              "accountType": "PAYMENT",
              "alias": "",
              "isVisible": false,
              "iban": "NL88INGB0748757732"
            },
            {
              "accountBalanceInCents": 15000,
              "accountCurrency": "EUR",
              "accountId": 700000027559,
              "accountName": "",
              "accountNumber": "H 177-27066",
              "accountType": "SAVING",
              "alias": "GUfffdLSAVINGSdiacrits",
              "iban": "",
              "isVisible": true,
              "linkedAccountId": 748757694,
              "productName": "Oranje Spaarrekening",
              "productType": 1000,
              "savingsTargetReached": 1,
              "targetAmountInCents": 2000
            }
          ],
          "failedAccountTypes": "CREDITCARDS",
          "returnCode": "OK"
        }
        """.data(using: .utf8)!
    
        return try! JSONDecoder().decode(AccountList.self, from: jsonData)
    }
}
