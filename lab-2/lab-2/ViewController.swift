//
//  ViewController.swift
//  lab-2
//
//  Created by Phillip James Mckenzie on 9/14/17.
//  Copyright © 2017 Phillip James Mckenzie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageLocation: UIImageView!
    @IBOutlet weak var imageTitle: UILabel!
    @IBOutlet weak var fontColorSwitch: UISwitch!
    @IBOutlet weak var fontSizeSlider: UISlider!
    
    @IBOutlet weak var imageControl: UISegmentedControl!
    @IBAction func changeInfo(_ sender: UISegmentedControl) {
        if imageControl.selectedSegmentIndex==0 {
            imageTitle.text="Young Beatles"
            imageLocation.image=UIImage(named: "footOn")
        }
        else if imageControl.selectedSegmentIndex==1 {
            imageTitle.text="Not so young Beatles"
            imageLocation.image=UIImage(named: "footOff")
        }
        
    }


    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

