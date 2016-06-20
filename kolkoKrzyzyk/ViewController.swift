//
//  ViewController.swift
//  kolkoKrzyzyk
//
//  Created by Kamil Wójcik on 18.06.2016.
//  Copyright © 2016 Kamil Wójcik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var znakOutlet: UIButton!

    @IBOutlet weak var ktoWygrał: UILabel!
    
    @IBOutlet weak var zagrajPonownie: UIButton!
    @IBAction func zagrajPonownie(sender: AnyObject) {
        aktywnyGracz = 1
        graSięToczy = true
        pustePola = [0,0,0,0,0,0,0,0,0]
        
        var znak: UIButton
        //uważaj jak będziesz coś zmieniał to wywali ci tu, bo tag 0 jest do pierwszego krzyzyka, ponazywałem wszystkie inne rzeczy tagami >9
        for x in 0 ..< 9 {
        znak = view.viewWithTag(x) as! UIButton
        znak.setImage(nil, forState: .Normal)
        }
        
        
        ktoWygrał.center = CGPointMake(ktoWygrał.center.x - 400, ktoWygrał.center.y)
        
        zagrajPonownie.center = CGPointMake(zagrajPonownie.center.x - 400, zagrajPonownie.center.y)
        
        ktoWygrał.hidden = true
        zagrajPonownie.hidden = true
        
    }
    
    
    var aktywnyGracz = 1
    var pustePola = [0,0,0,0,0,0,0,0,0]
    var kombinacjeWygrania = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    var graSięToczy = true
    
    
    @IBAction func znakBtn(sender: AnyObject) {
        
        
        if pustePola[sender.tag] == 0 && graSięToczy == true {
        pustePola[sender.tag] = aktywnyGracz
        
        var image = UIImage()
        
        if aktywnyGracz == 1 {
            
            let x = arc4random_uniform(UInt32(2))+1
            
            image = UIImage(named: "krzyzyk\(x).png")!
            
            sender.setImage(image, forState: .Normal)
            aktywnyGracz = 2
            
        }else{
            let x = arc4random_uniform(UInt32(2))+1
            
            image = UIImage(named: "kolko\(x).png")!
            
            sender.setImage(image, forState: .Normal)
            aktywnyGracz = 1
        }
            for kombinacje in kombinacjeWygrania{
            if pustePola[kombinacje[0]] != 0 && pustePola[kombinacje[1]] == pustePola[kombinacje[0]] && pustePola[kombinacje[2]] == pustePola[kombinacje[1]]{
                
                if pustePola[kombinacje[0]] == 1{
                    ktoWygrał.text = "Krzyżyk wygrał"
                }else{
                    ktoWygrał.text = "Kółko wygrało"
                }
                ktoWygrał.hidden = false
                zagrajPonownie.hidden = false
                
                UIView.animateWithDuration(0.5, animations: {
                    self.ktoWygrał.center = CGPointMake(self.ktoWygrał.center.x + 400, self.ktoWygrał.center.y)
                    
                    self.zagrajPonownie.center = CGPointMake(self.zagrajPonownie.center.x + 400, self.zagrajPonownie.center.y)
                })
                
                graSięToczy = false
                }
            }
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ktoWygrał.hidden = true
        zagrajPonownie.hidden = true
        
        ktoWygrał.center = CGPointMake(ktoWygrał.center.x - 400, ktoWygrał.center.y)
        
        zagrajPonownie.center = CGPointMake(zagrajPonownie.center.x - 400, zagrajPonownie.center.y)    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        
    }
    
    
}

