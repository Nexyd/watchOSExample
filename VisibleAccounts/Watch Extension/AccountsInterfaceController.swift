//
//  AccountsInterfaceController.swift
//  Watch Extension
//
//  Created by Daniel Morato on 16/01/2019.
//  Copyright © 2019 dani. All rights reserved.
//

import WatchKit
import AccountListAPI
import Foundation

class AccountsInterfaceController: WKInterfaceController {

    @IBOutlet var table: WKInterfaceTable!
    private var data: [Account]

    override init() {
        data = []
        super.init()
    }

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)

        // Configure interface objects here.
        data = ListAPI.getAccounts().accounts
        table.setNumberOfRows(data.count,
            withRowType: "AccountCustomRow")

        for index in 0..<table.numberOfRows {
            guard let controller = table.rowController(at: index)
                as? AccountRowController else { continue }

            controller.account = data[index]
        }
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
}
