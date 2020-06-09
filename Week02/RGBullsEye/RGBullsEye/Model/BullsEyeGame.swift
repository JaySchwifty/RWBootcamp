

import Foundation

class BullsEyeGame {  // might be class?
    var round = 0
    var score = 0
    var points = 0
    
    
    
    
    func updateTheView(targetVal: Int) -> String {
       
                   var title: String
                   if targetVal == 0 {
                       title = "Perfect"
                       points += 100
                   } else if targetVal <= 20 {
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
