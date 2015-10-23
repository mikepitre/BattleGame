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
    var player1 = Character(name: "Player 1")
    var player2 = Character(name: "Player 2")
    
    //Outlets
    @IBOutlet weak var player1Image: UIImageView!
    @IBOutlet weak var player2Image: UIImageView!
    @IBOutlet weak var textLabel: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func player1AttackBtn(sender: AnyObject) {
    }
    
    @IBAction func player2AttackBtn(sender: AnyObject) {
    }
    


}

