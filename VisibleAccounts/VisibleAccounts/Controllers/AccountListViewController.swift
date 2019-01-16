//
//  AccountListViewController.swift
//  VisibleAccounts
//
//  Created by Daniel Morato on 15/01/2019.
//  Copyright © 2019 dani. All rights reserved.
//

import UIKit
import AccountListAPI

class AccountListViewController: UIViewController,
    UITableViewDelegate, UITableViewDataSource {
    
    private var data: [Account]
    private var sortedData: [Account]
    @IBOutlet weak var accountView: AccountListView!
    @IBOutlet weak var visibilityControl: UISegmentedControl!
    
    /// Initializes the controller.
    init() {
        self.data = []
        self.sortedData = []
        super.init(nibName: "AccountListViewController", bundle: nil)
    }
    
    /// Initializer from NSCoder
    /// Required from parent
    /// - Parameters:
    ///     - aDecoder: The decoder to be used.
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        self.data = ListAPI.getAccounts().accounts
        self.accountView.table.dataSource = self
        self.accountView.table.delegate   = self
        
        sortedData = data
        let bundle = Bundle(for: type(of: self))
        let customCell = UINib(nibName: "CustomTableViewCell", bundle: bundle)
        self.accountView.table.register(customCell,
            forCellReuseIdentifier: "CustomTableViewCell")
    }
    
    //MARK: -UISegmentedControl
    @IBAction func onValueChanged(_ sender: Any) {
        sortedData = data
        if visibilityControl.selectedSegmentIndex == 1 {
            sortedData = data.filter { $0.isVisible! }
        }
        
        self.accountView.table.reloadData()
    }
    
    //MARK: -UITableViewDataSource
    func tableView(_ tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
        return self.sortedData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt
        indexPath: IndexPath) -> UITableViewCell
    {
        let cell = self.accountView.table.dequeueReusableCell(
            withIdentifier: "CustomTableViewCell")
            as! CustomTableViewCell

        cell.accountName.text = sortedData[indexPath.row].accountName
        cell.iban.text = sortedData[indexPath.row].iban
        cell.balance.text = String(sortedData[indexPath.row]
            .accountBalanceInCents!)

        return cell
    }
}
