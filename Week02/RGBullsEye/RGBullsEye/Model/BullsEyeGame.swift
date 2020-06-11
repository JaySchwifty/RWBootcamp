

import Foundation

class BullsEyeGame {  // might be class?
    var round = 0
    var score = 0
    var points = 0
    
    init() {
        newRoundStarted()
    }
    
    func roundIncrease() {
        round += 1
    }
    
    func newRoundStarted() {
        round = 0
        score = 0
        points = 0
        roundIncrease()
    }
    
    func updateTheView(currentValue: Int) -> String {
        
        
        var title: String
        if currentValue == 0 {
            title = "Perfect"
            points += 100
        } else if currentValue <= 20 {
            title = "Almost had it"
            points += 50
        } else {
            title = "Gotta get closer next time"
            points += 15
        }
        score = points
        return title
    }
    
}
