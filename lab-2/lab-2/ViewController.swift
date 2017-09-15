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
    @IBOutlet weak var imageSelector: UISegmentedControl!
    @IBOutlet weak var fontColorSwitch: UISwitch!
    @IBOutlet weak var fontSizeSlider: UISlider!
    

    @IBAction func imageControl(_ sender: UISegmentedControl) {
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

