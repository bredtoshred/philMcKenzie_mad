//
//  ViewController.swift
//  lab1
//
//  Created by Phillip James Mckenzie on 9/13/17.
//  Copyright © 2017 Phillip James Mckenzie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var landPhoto: UIImageView!
    @IBOutlet weak var photoLabel: UILabel!
    
    @IBAction func choseArt(_ sender: UIButton) {
        if sender.tag == 1{
            landPhoto.image = UIImage(named:"Image-2")
            photoLabel.text = ("Far Western Colorado")
        }
        else if sender.tag == 2{
            landPhoto.image = UIImage(named:"Image-1")
            photoLabel.text = ("Loveland Pass")
        }
    }
    
    @IBOutlet weak var selectpicture: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

