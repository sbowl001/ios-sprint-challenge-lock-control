//
//  AppearanceHelper.swift
//  Sprint 4 Challenge
//
//  Created by Stephanie Bowles on 6/17/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

enum AppearanceHelper {
    
    static var barColor = UIColor(red: 177.0/255.0, green: 0.0/255.0, blue: 27.0/255.0, alpha: 1.0)
    
    static func setThemeAppearance() {
        
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UINavigationBar.appearance().barTintColor = barColor
        UIBarButtonItem.appearance().tintColor = .black
        
        UINavigationBar.appearance().titleTextAttributes =  textAttributes
    }
}
