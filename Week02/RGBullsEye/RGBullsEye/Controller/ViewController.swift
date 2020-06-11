

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
    var guessRgb = RGB()
    var targetRgb = RGB()
    var currentVal = 0
    
    var quickDiff: Int {
        print("test")
        return currentVal
    }
    

    
    @IBAction func aSliderMoved(sender: UISlider) {
        
//        currentVal = Int(guessRgb.difference(target: targetRgb) * 255.0)
        
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
        
        sliderOpacity()
    }
    
    @IBAction func showAlert(sender: AnyObject) {
        
        // Tells how far off user is from targetLbl color
        let userScore = Int(guessRgb.difference(target: targetRgb) * 255.0)
        currentVal = Int(guessRgb.difference(target: targetRgb) * 255.0)
        
        // Sets up the alert screen text and describes how far away user was from targt lbl
        
        //  show alert that tells how close you were to target lbl
        
        let title = game.updateTheView(currentValue: currentVal )
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
    
    
    @IBAction func startOver(sender: AnyObject) {
        
        game.newRoundStarted()
        
        // Randomize target color
        targetRgb.randomizeColors()
        
        //  Have targetLabel set to random color
        targetLabel.backgroundColor = UIColor.init(rgbStruct: targetRgb)
        
        // setting roundlbl back to 0
        roundLabel.text = "Round: \(game.round)"
        
        // setting scorelbl back to 0
        scoreLabel.text = "Score: \(game.points)"
        
        sliderSettings()
        
        //Guess lbl back to white
        guessLabel.backgroundColor = UIColor.white
        
        sliderOpacity()
        
    }
    
    
    func updateView() {
        
        // Increment the round
        
        game.roundIncrease()
        
        // update the round lbl text
        roundLabel.text = "Round: \(game.round)"
        
        // TODO: change score to users score
        
        scoreLabel.text = "Score: \(game.score)"
        
        // Randomize target color
        targetRgb.randomizeColors()
        
        //  Have targetLabel set to random color
        targetLabel.backgroundColor = UIColor.init(rgbStruct: targetRgb)
        
        //Guess lbl back to white
        guessLabel.backgroundColor = UIColor.white
        
        sliderSettings()
        sliderOpacity()
    }
    
    func sliderSettings() {
        
        // set sliders back to starting point
        redSlider.value = Float(Int(127))
        greenSlider.value = Float(Int(127))
        blueSlider.value = Float(Int(127))
        
        // color labels set to each current slider value
        redLabel.text = String(Int(redSlider.value))
        greenLabel.text = String(Int(greenSlider.value))
        blueLabel.text = String(Int(blueSlider.value))
    }
    
    func sliderOpacity() {
        currentVal = Int(guessRgb.difference(target: targetRgb) * 255.0)
        
        redSlider.minimumTrackTintColor = UIColor.blue.withAlphaComponent(CGFloat(quickDiff)/100.0)
        greenSlider.minimumTrackTintColor = UIColor.blue.withAlphaComponent(CGFloat(quickDiff)/100.0)
        blueSlider.minimumTrackTintColor = UIColor.blue.withAlphaComponent(CGFloat(quickDiff)/100.0)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Display starting round
        roundLabel.text = "Round: \(game.round)"
        
        // Display starting score
        scoreLabel.text = "Score: \(game.score)"
        
        sliderSettings()
        
        // Randomize target color
        targetRgb.randomizeColors()
        
        //  Have targetLabel set to random color
        targetLabel.backgroundColor = UIColor.init(rgbStruct: targetRgb)

        sliderOpacity()
        sliderSettings()
    }
}

