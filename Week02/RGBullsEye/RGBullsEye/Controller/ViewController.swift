

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var targetTextLabel: UILabel!
    @IBOutlet weak var guessLabel: UILabel!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    let game = BullsEyeGame()
    let scoreIncrements = BullsEyeGame()
    var guessRgb = RGB()
    var targetRgb = RGB()
    
    var round = 0
    var score = 0
    var points = 0
    var currentVal = 0
    
    
    
    @IBAction func aSliderMoved(sender: UISlider) {
        // Setting slider values for sliders moved
        guessRgb.r = Int(redSlider.value)
        guessRgb.g = Int(greenSlider.value)
        guessRgb.b = Int(blueSlider.value)
        
        // setting guesslbl to slider values
        guessLabel.backgroundColor = UIColor.init(rgbStruct: guessRgb)
        
        // Set the rgb lbls to corresponding slider values
        redLabel.text = String(guessRgb.r)
        greenLabel.text = String(guessRgb.g)
        blueLabel.text = String(guessRgb.b)
    }
    
    @IBAction func showAlert(sender: AnyObject) {
        
        // Tells how far off user is from targetLbl color
        let userScore = Int(guessRgb.difference(target: targetRgb) * 255.0)
        currentVal = Int(guessRgb.difference(target: targetRgb) * 255.0)
        
//        // Sets up the alert screen text and describes how far away user was from targt lbl
//        func pointFunc() -> String {
//            var title: String
//            if userScore == 0 {
//                title = "Perfect"
//                points += 100
//            } else if userScore <= 5 {
//                title = "Almost had it"
//                points += 50
//            } else {
//                title = "Gotta get closer next time"
//                points += 15
//            }
//            return title
//        }
        
        //  show alert that tells how close you were to target lbl
        
        let title = game.updateTheView(targetVal:currentVal )
        let message = "\(userScore)"
        
        /*
         Take the RGB difference info and apply it to the UIAlert method
         */
        let alertController = UIAlertController(title: title, message: "\(message) ponints away", preferredStyle: .alert)
        
        //  display how many points you were given in alert
        let alertAction = UIAlertAction(title: "Set it", style: .default, handler: { alertController in
            self.updateView()
            
        })
        
        alertController.addAction(alertAction)
        
        
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    func startGameOver() {
        // Randomize target color
               targetRgb.randomizeColors()
               
               //  Have targetLabel set to random color
               targetLabel.backgroundColor = UIColor.init(rgbStruct: targetRgb)
               
              
               // setting roundlbl back to 0
               roundLabel.text = "Round: \(0)"
               
               // setting scorelbl back to 0
               scoreLabel.text = "Score: \(0)"
               
               // set sliders back to starting point
               redSlider.value = Float(Int(127))
               greenSlider.value = Float(Int(127))
               blueSlider.value = Float(Int(127))
               
               //Guess lbl back to white
               guessLabel.backgroundColor = UIColor.white
    }
    
    @IBAction func startOver(sender: AnyObject) {
        
       startGameOver()
        
    }
    
    
    func updateView() {
        
        // Increment the round
        round += 1
        
        
        // update the round lbl text
        roundLabel.text = "Round: \(round)"
        
        // TODO: change score to users score
       
        scoreLabel.text = "Score: \(game.score)"
        
        // Randomize target color
        targetRgb.randomizeColors()
        
        //  Have targetLabel set to random color
        targetLabel.backgroundColor = UIColor.init(rgbStruct: targetRgb)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Display starting round
        roundLabel.text = "Round: \(round)"
        
        // Display starting score
        scoreLabel.text = "Score: \(score)"
        
      
        
        // SliderValues set
        redSlider.value = Float(Int(127))
        greenSlider.value = Float(Int(127))
        blueSlider.value = Float(Int(127))
        
        // Randomize target color
        targetRgb.randomizeColors()
        
        //  Have targetLabel set to random color
        targetLabel.backgroundColor = UIColor.init(rgbStruct: targetRgb)
        
        // color labels set to each current slider value
        redLabel.text = String(redSlider.value)
        greenLabel.text = String(greenSlider.value)
        blueLabel.text = String(blueSlider.value)
        
    }
}

