//
//  ViewController.swift
//  YouGiveLoveABadName
//
//  Created by Flatiron School on 6/30/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var bonjoviImage: UIImageView!
    var joviAnchor: NSLayoutConstraint!
    // Had to utilize the exclamation point to get Xcode to stop complaining about initializers
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.bonjoviImage.centerYAnchor.constraintEqualToAnchor(self.view.centerYAnchor).active = true
        self.joviAnchor = self.bonjoviImage.heightAnchor.constraintEqualToAnchor(self.view.heightAnchor, multiplier: 0.4)
        self.joviAnchor.active = true
        // This programmatically defines & activates my NSLayoutConstraint
    }
    
    @IBAction func expandButtonTapped(sender: AnyObject) {
        if isJoviBig() {
            bounceDown()
        } else {
            bounceUp()
        }
    }
    
    func bounceUp() {
        UIView.animateKeyframesWithDuration(0.5, delay: 0, options: [], animations: {
            
            UIView.addKeyframeWithRelativeStartTime(0.0, relativeDuration: 0.1, animations: {
                // The first Double is representative to the timing of when the developer wants the key fram to appear. I.E. this is the first key fram which is why it's 0.0.
                self.joviAnchor.constant = -100
                self.view.layoutIfNeeded()
            })
            
            UIView.addKeyframeWithRelativeStartTime(0.1, relativeDuration: 0.2, animations: {
                self.joviAnchor.constant = 550
                self.view.layoutIfNeeded()
            })
            
            
            UIView.addKeyframeWithRelativeStartTime(0.2, relativeDuration: 0.3, animations: {
                self.joviAnchor.constant = 520
                self.view.layoutIfNeeded()
            })
            
        }) { (true) in
            self.joviAnchor.constant = 520
            self.view.layoutIfNeeded()
        }
    }
    
    func bounceDown() {
        UIView.animateKeyframesWithDuration(0.5, delay: 0, options: [], animations: {
            
            UIView.addKeyframeWithRelativeStartTime(0.0, relativeDuration: 0.1, animations: {
                self.joviAnchor.constant = 550
                self.view.layoutIfNeeded()
            })
            
            UIView.addKeyframeWithRelativeStartTime(0.1, relativeDuration: 0.2, animations: {
                self.joviAnchor.constant = 520
                self.view.layoutIfNeeded()
            })
            
            
            UIView.addKeyframeWithRelativeStartTime(0.2, relativeDuration: 0.3, animations: {
                self.joviAnchor.constant = -100
                self.view.layoutIfNeeded()
            })
            
            
            UIView.addKeyframeWithRelativeStartTime(0.3, relativeDuration: 0.4, animations: {
                self.joviAnchor.constant = 0
                self.view.layoutIfNeeded()
            })
            
        }) { (true) in
            self.joviAnchor.constant = 0
            self.view.layoutIfNeeded()
        }
    }
    
    func isJoviBig() -> Bool {
        switch self.joviAnchor.constant {
        case 520:
            return true
        default:
            return false
        }
    }
}