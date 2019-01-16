//
//  AccountRowController.swift
//  Watch Extension
//
//  Created by Daniel Morato on 16/01/2019.
//  Copyright © 2019 Daniel Morato. All rights reserved.
//

import WatchKit
import AccountListAPI

class AccountRowController: NSObject {
    @IBOutlet var accountName: WKInterfaceLabel!
    @IBOutlet var balance: WKInterfaceLabel!
    @IBOutlet var iban: WKInterfaceLabel!
    
    var account: Account? {
        didSet {
            guard let account = account else { return }
            accountName.setText(account.accountName)
            balance.setText(String(account.accountBalanceInCents!))
            iban.setText(account.iban)
        }
    }
}
