//
//  CustomControl.swift
//  Sprint 4 Challenge
//
//  Created by Stephanie Bowles on 6/17/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit


class CustomControl: UIControl {
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        setup()
    }
    
    
    private func setup() {
        let label = UILabel()
        self.addSubview(label)
        
        label.text = "●"
        label.font = UIFont.boldSystemFont(ofSize: 32.0)
        label.textAlignment = .center 
    }
}
