//
//  BullsEyeGame.swift
//  BullsEye
//
//  Created by Jaron Grigsby on 6/6/20.
//  Copyright © 2020 Ray Wenderlich. All rights reserved.
//

import Foundation

class BullsEyeGame {
    
    var score = 0
    var round = 0
    var points = 0
    var targetValue = 0
    
    init() {
        startNewGame()
    }
    
    func processAlert(currentValue: Int) -> String {
        
        
     let difference = abs(targetValue - currentValue)
        points = 100 - difference

        

        var title: String
        if difference == 0 {
            title = "Perfect!"
            points += 100
        } else if difference < 5 {
            title = "You almost had it!"
            if difference == 1 {
                points += 50
            }
        } else if difference < 10 {
            title = "Pretty good!"
        } else {
            title = "Not even close..."
        }
        score += points
        return title
    }
    
    func startNewRound() {
        round += 1
        targetValue = Int.random(in: 1...100)
    }
    
    func startNewGame() {
        startNewRound()
        score = 0
        round = 0
    }
}
