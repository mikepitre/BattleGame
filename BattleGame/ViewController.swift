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
    @IBOutlet weak var player1HpLabel: UILabel!
    @IBOutlet weak var player2HpLabel: UILabel!
    @IBOutlet weak var restartFrame: UIImageView!
    @IBOutlet weak var restartBtn: UIButton!
    
    
    
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
        //attack, disable & hide button for 3 secs
        player2.gotAttacked(player1.attackPower)
        textLabel.text = "\(player1.name) did \(player1.attackPower) damage to \(player2.name)!"
        player2HpLabel.text = "\(player2.hp) HP"
        
        //check if player 2 is dead, if so disable attack btns, ask to restart
        if player2.isAlive == false {
            player2Image.hidden = true
            textLabel.text = "\(player1.name) Wins!"
            hideAllAttackButtons()
            restartBtn.hidden = false
            restartFrame.hidden = false
        } else {
            player1Btn.enabled = false
            player1Btn.hidden = true
            if player1.isAlive && player2.isAlive {
            NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: "enablePlayer1Btn", userInfo: nil, repeats: false)
            }
        }
    }
    
    @IBAction func player2AttackBtnPressed(sender: AnyObject) {
        //attack, disable & hide button for 3 secs
        player1.gotAttacked(player2.attackPower)
        textLabel.text = "\(player2.name) did \(player2.attackPower) damage to \(player1.name)!"
        player1HpLabel.text = "\(player1.hp) HP"
        
        //check if player1 is dead, if so disable attack btns, ask to restart
        if player1.isAlive == false {
            player1Image.hidden = true
            textLabel.text = "\(player2.name) Wins!"
            hideAllAttackButtons()
            restartBtn.hidden = false
            restartFrame.hidden = false
        } else {
            player2Btn.enabled = false
            player2Btn.hidden = true
            NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: "enablePlayer2Btn", userInfo: nil, repeats: false)
        }
    }
    
    @IBAction func restartBtnPressed(sender: AnyObject) {
        player1 = Character(name: "Player 1")
        player2 = Character(name: "Player 2")
        player1Image.hidden = false
        player2Image.hidden = false
        player1HpLabel.text = "\(player1.hp) HP"
        player2HpLabel.text = "\(player2.hp) HP"
        restartFrame.hidden = true
        restartBtn.hidden = true
        enablePlayer1Btn()
        enablePlayer2Btn()
        textLabel.text = "Let's Battle!"
    }
    
    func enablePlayer1Btn() {
        if player1.isAlive {
            player1Btn.enabled = true
            player1Btn.hidden = false
        }
    }
    
    func enablePlayer2Btn() {
        if player2.isAlive {
            player2Btn.enabled = true
            player2Btn.hidden = false
        }
    }
    
    func hideAllAttackButtons() {
        player1Btn.hidden = true
        player2Btn.hidden = true
        player1Btn.enabled = false
        player2Btn.enabled = false
    }


}

