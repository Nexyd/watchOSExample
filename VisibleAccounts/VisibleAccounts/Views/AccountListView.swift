//
//  AccountListView.swift
//  VisibleAccounts
//
//  Created by Daniel Morato on 15/01/2019.
//  Copyright © 2019 dani. All rights reserved.
//

import UIKit

/// Class for the AccountListView XIB
class AccountListView: UIXibView {

    @IBOutlet var accountListView: UIView!
    @IBOutlet weak var table: UITableView!
    
    /// Base initializer
    /// - Parameters:
    ///     - frame: A CGRect to setup the frame.
    override init(frame: CGRect) {
        super.init(frame: frame)
        super.view = self.accountListView
    }
    
    /// Initializer from NSCoder
    /// Required from parent
    /// - Parameters:
    ///     - aDecoder: The decoder to be used.
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
