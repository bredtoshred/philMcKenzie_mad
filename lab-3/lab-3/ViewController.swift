//
//  ViewController.swift
//  lab-3
//
//  Created by Phil McKenzie on 9/26/17.
//  Copyright © 2017 Phil McKenzie. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var checkAmount: UITextField!
    @IBOutlet weak var tipPercent: UISegmentedControl!
    @IBOutlet weak var people: UITextField!
    @IBOutlet weak var tipDue: UILabel!
    @IBOutlet weak var totalDue: UILabel!
    @IBOutlet weak var totalDuePerPerson: UILabel!
    var pct:Float = 0.0 //tip percentage
    
    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        switch tipPercent.selectedSegmentIndex
        {
        case 0:
            pct = 0.1
            updateTipTotals()
        case 1:
            pct = 0.15
            updateTipTotals()
        case 2:
            pct = 0.2
            updateTipTotals()
        default:
            pct = 0
            updateTipTotals()
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        updateTipTotals()
    }
    
    override func viewDidLoad() {
        checkAmount.delegate=self
//        tipPercent.delegate=self
        people.delegate=self
        super.viewDidLoad()
    }
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateTipTotals() {
        var amount:Float //check amount
        
        if checkAmount.text!.isEmpty {
            amount = 0.0
        } else {
            amount = Float(checkAmount.text!)!
        }
        let numberOfPeople=Int(people.text!) //returns an optional
        let tip=amount*pct
        let total=amount+tip
        var personTotal : Float = 0.0 //specify Float so it's not a Double
        if numberOfPeople != nil {
            if numberOfPeople! > 0 {
                personTotal = total / Float(numberOfPeople!)
            }else {
                //create a UIAlertController object
                let alert = UIAlertController(title: "Warning", message : "The number of people must be greater than 0", preferredStyle : UIAlertControllerStyle.alert)
                //create a UIAlertAction object for the button
                let cancelAction = UIAlertAction(title: "Cancel",
                                                 style:UIAlertActionStyle.cancel, handler: nil)
                //add the alert action to the alert object
                alert.addAction(cancelAction)
                let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { action in
                    self.people.text="1"
                    self.updateTipTotals()
                })
                alert.addAction(okAction)
                //present alert
                present(alert, animated: true, completion: nil)
            } //end else
        }
        
        
        //format results as currency
        let currencyFormatter = NumberFormatter()
        //set the number style
        currencyFormatter.numberStyle=NumberFormatter.Style.currency
        //returns a formatted string
        tipDue.text=currencyFormatter.string(from: NSNumber(value: tip))
        totalDue.text=currencyFormatter.string(from: NSNumber(value: total))
        totalDuePerPerson.text=currencyFormatter.string(from: NSNumber(value: personTotal))
    }

}

