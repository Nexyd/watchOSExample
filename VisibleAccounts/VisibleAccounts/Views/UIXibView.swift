//
//  UIXibView.swift
//  VisibleAccounts
//
//  Created by Daniel Morato on 15/01/2019.
//  Copyright © 2019 dani. All rights reserved.
//

import Foundation
import UIKit

/// This class serves as a base XIB view initializer
class UIXibView: UIView {

    @IBOutlet var view: UIView!
    
    /// Base initializer
    /// - Parameters:
    ///     - frame: A CGRect to setup the frame.
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    /// Initializer from NSCoder
    /// Required from parent
    /// - Parameters:
    ///     - aDecoder: The decoder to be used.
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        xibSetup()
    }
    
    /// Sets up the nib view to be added to the main view
    func xibSetup() {
        view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [
            UIView.AutoresizingMask.flexibleWidth,
            UIView.AutoresizingMask.flexibleHeight]
        
        addSubview(view)
    }
    
    /// Creates a new nib view.
    /// - Returns: newly created nib view
    func loadViewFromNib() -> UIView {
        let nibName = String(describing: type(of: self)).components(separatedBy: "__").last!
        let nib = UINib(nibName: nibName, bundle: Bundle(for: type(of: self)))
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        return view
    }
}
