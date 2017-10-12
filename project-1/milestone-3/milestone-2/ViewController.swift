//
//  ViewController.swift
//  milestone-2
//
//  Created by Phil McKenzie on 10/3/17.
//  Copyright © 2017 Phil McKenzie. All rights reserved.
//

import UIKit
import AVFoundation

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
    @IBOutlet weak var userScoreLabel: UILabel!
    @IBOutlet weak var cpuScoreLabel: UILabel!
    @IBOutlet weak var rockImage: UIButton!
    @IBOutlet weak var paperImage: UIButton!
    @IBOutlet weak var scissorsImage: UIButton!
    var whichSound : String = ""
    var audioPlayer = AVAudioPlayer()
    var cpuScore : Int = 0
    var userScore : Int = 0
    
    func play(userChoice : Int) {
        let cpuChoice: Int = Int(arc4random_uniform(4))
        let userChoiceFunc : Int = userChoice
        setUserImage(userImg : userChoice)
        setCPUImg(cpuImg : cpuChoice)
        winner(u : userChoiceFunc , c : cpuChoice)
    }
    
    func setUserImage(userImg : Int){
        let userImgFunc: Int = userImg
        if userImgFunc == 1 {
                        UIView.transition(with: self.rockImage,
                              duration:0.5,
                              options: .transitionCrossDissolve,
                              animations: { self.paperImage.setImage(UIImage(named:"paperDark")!, for: UIControlState.normal) ; self.scissorsImage.setImage(UIImage(named:"scissorsDark")!, for: UIControlState.normal)  },
                              completion: nil)
        }
        else if userImgFunc == 2 {
            UIView.transition(with: self.paperImage,
                              duration:0.5,
                              options: .transitionCrossDissolve,
                              animations: { self.rockImage.setImage(UIImage(named:"rockDark")!, for: UIControlState.normal) ; self.scissorsImage.setImage(UIImage(named:"scissorsDark")!, for: UIControlState.normal)  },
                              completion: nil)
        }
        else if userImgFunc == 3 {
            UIView.transition(with: self.scissorsImage,
                              duration:0.5,
                              options: .transitionCrossDissolve,
                              animations: { self.rockImage.setImage(UIImage(named:"rockDark")!, for: UIControlState.normal) ; self.paperImage.setImage(UIImage(named:"paperDark")!, for: UIControlState.normal)  },
                              completion: nil)
        }
    }
    
    func setCPUImg(cpuImg : Int){
        let cpuImgFunc: Int = cpuImg
        if cpuImgFunc == 1 {
//            cpuChoiceImage.image=UIImage(named: "rock")
            UIView.transition(with: self.cpuChoiceImage,
                              duration:1.0,
                              options: .transitionCrossDissolve,
                              animations: { self.cpuChoiceImage.image = UIImage(named: "rock"); self.playSound() },
                              completion: nil)
        }
        else if cpuImgFunc == 2 {
//            cpuChoiceImage.image=UIImage(named: "paper")
            UIView.transition(with: self.cpuChoiceImage,
                              duration:1.0,
                              options: .transitionCrossDissolve,
                              animations: { self.cpuChoiceImage.image = UIImage(named: "paper"); self.playSound() },
                              completion: nil)
        }
        else if cpuImgFunc == 3 {
//            cpuChoiceImage.image=UIImage(named: "scissors")
            UIView.transition(with: self.cpuChoiceImage,
                              duration:1.0,
                              options: .transitionCrossDissolve,
                              animations: { self.cpuChoiceImage.image = UIImage(named: "scissors"); self.playSound() },
                              completion: nil)
        }
    }
    
    func resetCPUImg(){
        cpuChoiceImage.image=UIImage(named: "question")
    }
    
    func resetUserImg(){
        UIView.transition(with: self.rockImage,
                          duration:0,
                          options: .transitionCrossDissolve,
                          animations: { self.rockImage.setImage(UIImage(named:"rock")!, for: UIControlState.normal) ; self.paperImage.setImage(UIImage(named:"paper")!, for: UIControlState.normal) ; self.scissorsImage.setImage(UIImage(named:"scissors")!, for: UIControlState.normal)  },
                          completion: nil)
    }
    
    func winner(u : Int, c : Int){
        let user :Int = u
        let cpu :Int = c
        var message : String = ""
        
        if user == 1 && cpu == 2 {
            message = "you lose, paper covers rock"
            whichSound = "paperWin"
            cpuScore += 1
        }
            
        else if user == 1 && cpu == 3 {
            message = "you win, rock breaks scissors"
            whichSound = "rockWin"
            userScore += 1
        }
            
        else if user == 2 && cpu == 1 {
            message = "you win, paper covers rock"
            whichSound = "paperWin"
            cpuScore += 1
        }
            
        else if user == 2 && cpu == 3 {
            message = "you lose, scissors cut paper"
            whichSound = "scissorsWin"
            cpuScore += 1
        }
            
        else if user == 3 && cpu == 1 {
            message = "you lose, rock breaks scissors"
            whichSound = "rockWin"
            cpuScore += 1
        }
            
        else if user == 3 && cpu == 2 {
            message = "you win, scissors cut paper"
            whichSound = "scissorsWin"
            userScore += 1
        }
            
        else{
            message = "you tied!"
        }
        updateScores(userScoreFunc: userScore, cpuScoreFunc: cpuScore)
        
        print("cpu score = \(cpuScore)")
        print("user score = \(userScore)")
        
        
        
        let when = DispatchTime.now() + 1.5
        DispatchQueue.main.asyncAfter(deadline: when) {
            let alert = UIAlertController(title: "Alert", message: message, preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Play Again", style: UIAlertActionStyle.default, handler: { action in
                //run your function here
                self.resetCPUImg()
                self.resetUserImg()
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func updateScores(userScoreFunc : Int, cpuScoreFunc : Int){
        let us : Int = userScoreFunc
        let cs : Int = cpuScoreFunc
        
        userScoreLabel.text = String(us)
        cpuScoreLabel.text = String(cs)
        
    }
    
    
    func playSound(){
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: whichSound, ofType: "mp3")!))
            audioPlayer.prepareToPlay()
            audioPlayer.play()
        }
        catch{
            print("error")
        }
    }
   
override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
}

}

