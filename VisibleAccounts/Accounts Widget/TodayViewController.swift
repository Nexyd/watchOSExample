//
//  TodayViewController.swift
//  Accounts Widget
//
//  Created by Daniel Morato on 16/01/2019.
//  Copyright © 2019 dani. All rights reserved.
//

import UIKit
import NotificationCenter
import AccountListAPI

class TodayViewController: UIViewController, NCWidgetProviding,
    UITableViewDelegate, UITableViewDataSource {

    private var data: [Account]
    private var sortedData: [Account]
    @IBOutlet weak var table: UITableView!
    
    /// Initializer from NSCoder
    /// Required from parent
    /// - Parameters:
    ///     - aDecoder: The decoder to be used.
    required init?(coder aDecoder: NSCoder) {
        self.data = []
        self.sortedData = []
        super.init(coder: aDecoder)
        // fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.data = ListAPI.getAccounts().accounts
        self.table.dataSource = self
        self.table.delegate   = self
        
        sortedData = data
        extensionContext?.widgetLargestAvailableDisplayMode = .expanded
    }
    
    func widgetActiveDisplayModeDidChange(_ activeDisplayMode:
        NCWidgetDisplayMode, withMaximumSize maxSize: CGSize) {
        
        let expanded = activeDisplayMode == .expanded
        preferredContentSize = expanded ? CGSize(
            width: maxSize.width, height: 200) : maxSize
    }
        
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        completionHandler(NCUpdateResult.newData)
    }
    
    //MARK: -UITableViewDataSource
    func tableView(_ tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
        return self.sortedData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt
        indexPath: IndexPath) -> UITableViewCell
    {
        let cell = self.table.dequeueReusableCell(
            withIdentifier: "WidgetCustomCell")
            as! WidgetTableViewCell

        cell.accountName.text = sortedData[indexPath.row].accountName
        cell.iban.text = sortedData[indexPath.row].iban
        cell.balance.text = String(sortedData[indexPath.row]
            .accountBalanceInCents!)

        return cell
    }
}
