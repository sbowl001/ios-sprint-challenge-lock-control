//
//  ViewController.swift
//  Sprint 6 Challenge
//
//  Created by Spencer Curtis on 8/29/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resetButton: UIBarButtonItem!
    
    @IBOutlet weak var grayContainer: UIView!
    
    @IBOutlet weak var lockImage: UIImageView!
    
    @IBOutlet weak var sliderContainer: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        appearanceSet()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func appearanceSet() {
        grayContainer.layer.cornerRadius = 25
        sliderContainer.layer.cornerRadius = 25
    }
}

