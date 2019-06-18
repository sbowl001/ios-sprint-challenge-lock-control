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
    

    @IBOutlet weak var customControl: CustomControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        resetButton.title = ""
        appearanceSet()
       
       
    }

    
    @IBAction func slidingAction(_sender: CustomControl) {
        
        if customControl.isUnlocked {
            lockImage.image = UIImage(named: "Unlocked")
            customControl.isUserInteractionEnabled = true
            resetButton.title = "Reset"
        }
    }
 
    @IBAction func resetTapped(_ sender: UIBarButtonItem) {
//        customControl.reset()
        lockImage.image = UIImage(named: "Locked")
        resetButton.title = ""
    }
    
    func appearanceSet() {
        grayContainer.layer.cornerRadius = 25
        sliderContainer.layer.cornerRadius = 25
    }
}

