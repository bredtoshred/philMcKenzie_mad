//
//  ViewController.swift
//  midterm
//
//  Created by Phil McKenzie on 10/18/17.
//  Copyright © 2017 Phil McKenzie. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var commuteDist: UITextField!

    @IBOutlet weak var transportImage: UIImageView!
    @IBOutlet weak var timeOutput: UILabel!
    @IBOutlet weak var gasOutput: UILabel!
    @IBOutlet weak var monthly: UISwitch!
    @IBOutlet weak var transportControl: UISegmentedControl!
    
    var isBus = false
    var needGas = true
    var monthlyIsOn = false
    
    var speed : Float = 20
    var gas : Float = 24
    
    var timeVal : Float = 0
    var gasVal : Float = 0
    var timeMonth : Float = 0
    var gasMonth : Float = 0
    
    var monthMultiplier : Float = 1
    var waitTime : Float = 0
    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var userEmail: UITextField!
    
    @IBOutlet weak var userNameOutput: UILabel!
    @IBOutlet weak var userEmailOutput: UILabel!
    
    @IBAction func addUserData(_ sender: Any) {
        userNameOutput.text = userName.text!
        userEmailOutput.text = userEmail.text!
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    @IBAction func calculate(_ sender: Any) {
        calculateValues()
        alertUser()
    }
    
    @IBAction func monthlyAction(_ sender: Any) {
        monthlyCalc()
    }
    @IBAction func changeTransport(_ sender: Any) {
        updateTransport()
    }
    
    func calculateValues(){
        if commuteDist.text!.isEmpty {
            timeVal = 0.0
            gasVal = 0.0
        } else {
            timeVal = (Float(commuteDist.text!)! / speed) * monthMultiplier
            gasVal = (Float(commuteDist.text!)! / gas) * monthMultiplier
            
            if (needGas == true){
                gasVal = gasVal * 1
            }
            else if (needGas == false){
                gasVal = 0
            }
            if (isBus == true){
                timeVal = timeVal + (1/6)
            }
            
            if(isBus == true && monthlyIsOn == true){
                timeVal = timeVal + (20 * (1/6))
            }
        }
        
        timeOutput.text = "\(timeVal)"
        gasOutput.text = "\(gasVal)"
    }
    
    func monthlyCalc(){
        if monthly.isOn {
            monthMultiplier = 20
            monthlyIsOn = true
            calculateValues()
        } else {
            monthMultiplier = 1
            monthlyIsOn = false
            calculateValues()
        }
    }
    
    func updateTransport() {
        if transportControl.selectedSegmentIndex==0 {
            speed = 20.0
            gas = 24.0
            isBus = false
            needGas = true
            transportImage.image=UIImage(named: "car")
            calculateValues()
        }
        else if transportControl.selectedSegmentIndex==1 {
            speed = 12 // plus 5 min wait per stop
            needGas = false
            isBus = true
            transportImage.image=UIImage(named: "bus")
            calculateValues()
        }
        else if transportControl.selectedSegmentIndex==2 {
            speed = 10.0
            needGas = false
            isBus = false
            transportImage.image=UIImage(named: "bike")
            calculateValues()
        }
    }
    
    func alertUser(){
        if(Float(commuteDist.text!)! >= 50){
                let alert = UIAlertController(title: "Long commute", message: "wow, that's a long commute", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "continue", style: UIAlertActionStyle.default, handler: { action in

                }))
                self.present(alert, animated: true, completion: nil)
            
        }
    
    }

    
    override func viewDidLoad() {
        commuteDist.delegate=self
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

