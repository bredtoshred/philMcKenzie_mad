//
//  ViewController.swift
//  hello_world
//
//  Created by Phillip James Mckenzie on 8/31/17.
//  Copyright © 2017 Phil Mckenzie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var messageText: UILabel!
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        messageText.text="hello world!"
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

