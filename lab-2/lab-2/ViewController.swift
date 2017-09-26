//
//  ViewController.swift
//  lab-2
//
//  Created by Phillip James Mckenzie on 9/20/17.
//  Copyright © 2017 Phillip James Mckenzie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBOutlet weak var skateImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var imageControl: UISegmentedControl!
    @IBAction func changeInfo(_ sender: UISegmentedControl) {
        updateImage()
        updateCaps()
    }

    @IBOutlet weak var capitalSwitch: UISwitch!
    @IBAction func updateFont(_ sender: UISwitch) {
        updateCaps()
    }
    
    @IBOutlet weak var fontSizeLabel: UILabel!
    @IBAction func changeFontSize(_ sender: UISlider) {
        let fontSize=sender.value
        fontSizeLabel.text=String(format: "%.0f", fontSize)
        let fontSizeCGFloat=CGFloat(fontSize)
        titleLabel.font=UIFont.systemFont(ofSize: fontSizeCGFloat)
    }
    
    func updateImage() {
        if imageControl.selectedSegmentIndex==0 {
            titleLabel.text="Ollie"
            skateImage.image=UIImage(named: "ollie")
        }
        else if imageControl.selectedSegmentIndex==1 {
            titleLabel.text="Ollie North"
            skateImage.image=UIImage(named: "onefoot")
        }
    }
    
    func updateCaps() {
        if capitalSwitch.isOn {
            titleLabel.text=titleLabel.text?.uppercased()
        } else {
            titleLabel.text=titleLabel.text?.lowercased()
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

