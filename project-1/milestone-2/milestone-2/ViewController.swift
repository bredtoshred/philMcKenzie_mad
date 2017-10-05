//
//  ViewController.swift
//  milestone-2
//
//  Created by Phil McKenzie on 10/3/17.
//  Copyright © 2017 Phil McKenzie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet weak var cpuChoiceImage: UIImageView!
    @IBAction func userRock(_ sender: UIButton) {
        play(userChoice : 1)
    }
    @IBAction func userPaper(_ sender: UIButton) {
        play(userChoice : 2)
    }
    @IBAction func userScissors(_ sender: UIButton) {
        play(userChoice : 3)
    }
    
    var cpuScore : Int = 0
    var userScore : Int = 0
    
    func play(userChoice : Int) {
        let cpuChoice: Int = Int(arc4random_uniform(4))
        let userChoiceFunc : Int = userChoice
        setCPUImg(cpuImg : cpuChoice)
        winner(u : userChoiceFunc , c : cpuChoice)
        //        print("user choice: \(userChoiceFunc)")
        //        print("random number: \(cpuChoice)")
        
    }
    
    func setCPUImg(cpuImg : Int){
        let cpuImgFunc: Int = cpuImg
        if cpuImgFunc == 1 {
            cpuChoiceImage.image=UIImage(named: "rock")
        }
        else if cpuImgFunc == 2 {
            cpuChoiceImage.image=UIImage(named: "paper")
        }
        else if cpuImgFunc == 3 {
            cpuChoiceImage.image=UIImage(named: "scissors")
        }
    }
    
    func winner(u : Int, c : Int){
        let user :Int = u
        let cpu :Int = c
        
        if user == 1 && cpu == 2 {
            print("you lose, paper covers rock")
            cpuScore += 1
        }
            
        else if user == 1 && cpu == 3 {
            print("you win, rock breaks scissors")
            userScore += 1
        }
            
        else if user == 2 && cpu == 1 {
            print("you win, paper covers rock")
            cpuScore += 1
        }
            
        else if user == 2 && cpu == 3 {
            print("you lose, scissors cut paper")
            cpuScore += 1
        }
            
        else if user == 3 && cpu == 1 {
            print("you lose, rock breaks scissors")
            cpuScore += 1
        }
            
        else if user == 3 && cpu == 2 {
            print("you win, scissors cut paper")
            userScore += 1
        }
            
        else{
            print("you tied!")
        }
        
        print("cpu score = \(cpuScore)")
        print("user score = \(userScore)")
        
    }
   
override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
}

}

