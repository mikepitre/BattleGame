//
//  ViewController.swift
//  BattleGame
//
//  Created by Mike Pitre on 10/23/15.
//  Copyright © 2015 Mike Pitre. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //variables
    var player1: Character!
    var player2: Character!
    
    //Outlets
    @IBOutlet weak var player1Image: UIImageView!
    @IBOutlet weak var player2Image: UIImageView!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var player1Btn: UIButton!
    @IBOutlet weak var player2Btn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        player1 = Character(name: "Player 1")
        player2 = Character(name: "Player 2")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func player1AttackBtnPressed(sender: AnyObject) {
        player2.gotAttacked(player1.attackPower)
        textLabel.text = "Player1 did \(player1.attackPower) damage to Player2"
        player1Btn.enabled = false
        player1Btn.hidden = true
        NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: "enablePlayer1Btn", userInfo: nil, repeats: false)
        
        if player2.isAlive == false {
            player2Image.hidden = true
            textLabel.text = "Player1 Wins!"
        }
    }
    
    @IBAction func player2AttackBtnPressed(sender: AnyObject) {
        player1.gotAttacked(player2.attackPower)
        textLabel.text = "Player2 did \(player2.attackPower) damage to Player1"
        player2Btn.enabled = false
        player2Btn.hidden = true
        NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: "enablePlayer2Btn", userInfo: nil, repeats: false)
        
        if player1.isAlive == false {
            player1Image.hidden = true
            textLabel.text = "Player2 Wins!"
        }
    }
    
    //enable button functions
    func enablePlayer1Btn() {
        player1Btn.enabled = true
        player1Btn.hidden = false
    }
    
    func enablePlayer2Btn() {
        player2Btn.enabled = true
        player2Btn.hidden = false
    }


}

