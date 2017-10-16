//
//  Scene2ViewController.swift
//  favorites
//
//  Created by Phil McKenzie on 10/15/17.
//  Copyright © 2017 Phil McKenzie. All rights reserved.
//

import UIKit

class Scene2ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var userAlbum: UITextField!
    @IBOutlet weak var userArtist: UITextField!
    @IBOutlet weak var userYear: UITextField!

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "doneFavs"{
            let scene1ViewController = segue.destination as! ViewController
            //check to see that text was entered in the textfields
            if userAlbum.text!.isEmpty == false{
                scene1ViewController.user.favAlbum=userAlbum.text
            }
            if userArtist.text!.isEmpty == false{
                scene1ViewController.user.favArtist=userArtist.text
            }
            if userYear.text!.isEmpty == false{
                scene1ViewController.user.favYear=userYear.text
            }
        }
    }
    
    override func viewDidLoad() {
        userAlbum.delegate=self
        userArtist.delegate=self
        userYear.delegate=self
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
