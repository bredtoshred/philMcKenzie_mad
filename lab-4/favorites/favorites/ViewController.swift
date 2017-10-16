//
//  ViewController.swift
//  favorites
//
//  Created by Phil McKenzie on 10/13/17.
//  Copyright © 2017 Phil McKenzie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    let filename = "favs.plist"
    
    @IBOutlet weak var albumLabel: UILabel!
    @IBOutlet weak var musicianLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    
    @IBAction func unwindSegue (_ segue:UIStoryboardSegue){
        albumLabel.text=user.favAlbum
        musicianLabel.text=user.favArtist
        yearLabel.text=user.favYear
    }
    
    var user=Favorite()
    
    func docFilePath(_ filename: String) -> String?{
        //locate the documents directory
        let path =
            NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.allDomainsMask, true)
        let dir = path[0] as NSString //document directory
        //creates the full path to our data file
        return dir.appendingPathComponent(filename)
    }
    
    
    override func viewDidLoad() {
        let filePath = docFilePath(filename) //path to data file
        
        //if the data file exists, use it
        if FileManager.default.fileExists(atPath: filePath!){
            let path = filePath
            //load the data of the plist file into a dictionary
            let dataDictionary = NSDictionary(contentsOfFile: path!) as!
                [String:String]
            if dataDictionary.keys.contains("album") {
                user.favAlbum = dataDictionary["album"]
                albumLabel.text=user.favAlbum
            }
            if dataDictionary.keys.contains("artist") {
                user.favArtist = dataDictionary["artist"]
                musicianLabel.text=user.favArtist
            }
            if dataDictionary.keys.contains("year") {
                user.favYear = dataDictionary["year"]
                yearLabel.text=user.favYear
            }
            //application instance
            let app = UIApplication.shared
            //subscribe to the UIApplicationWillResignActiveNotificationnotification
            NotificationCenter.default.addObserver(self, selector:
                #selector(UIApplicationDelegate.applicationWillResignActive(_:)), name:
                NSNotification.Name(rawValue: "UIApplicationWillResignActiveNotification"),
                                                                                  object: app)
        }
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from nib.
    }
    
    func applicationWillResignActive(_ notification: Notification){
        let filePath = docFilePath(filename)
        let data = NSMutableDictionary()
        //adds
        if user.favAlbum != nil{
            data.setValue(user.favAlbum, forKey: "album")
            
        }
        if user.favArtist != nil{
            data.setValue(user.favArtist, forKey: "artist")
        }
        
        if user.favYear != nil{
            data.setValue(user.favYear, forKey: "year")
        }
        //write the contents of the array to our plist file
        data.write(toFile: filePath!, atomically: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

