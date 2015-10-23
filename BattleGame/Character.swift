//
//  Character.swift
//  BattleGame
//
//  Created by Mike Pitre on 10/23/15.
//  Copyright © 2015 Mike Pitre. All rights reserved.
//

import Foundation

class Character {
    var name: String = "Player"
    private var _hp: Int = 100
    private var _attackPower = 25
    
    init(name: String) {
        self.name = name
    }
    
    var hp: Int {
        get {
            return _hp
        }
    }
    
    var attackPower: Int {
        get {
            return _attackPower
        }
    }
    
    var isAlive: Bool {
        get {
            if _hp <= 0 {
                return false
            } else {
                return true
            }
        }
    }
    
    func gotAttacked(attackPower: Int) -> Int {
        self._hp -= attackPower
        return attackPower
    }
}