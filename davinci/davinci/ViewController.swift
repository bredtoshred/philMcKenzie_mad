//
//  ViewController.swift
//  davinci
//
//  Created by Phillip James Mckenzie on 9/5/17.
//  Copyright © 2017 Phillip James Mckenzie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var artImage: UIImageView!
    
    @IBAction func choseArt(_ sender: UIButton) {
        if sender.tag == 1{
            artImage.image = UIImage(named:"monalisa")
        }
        else if sender.tag == 2{
            artImage.image = UIImage(named:"vitruvian")
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

