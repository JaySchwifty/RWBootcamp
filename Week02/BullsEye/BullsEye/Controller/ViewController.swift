//
//  ViewController.swift
//  BullsEye
//
//  Created by Ray Wenderlich on 6/13/18.
//  Copyright © 2018 Ray Wenderlich. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var bullseye = BullsEyeGame()
    var currentValue = 0
    var quickDiff: Int {
      return abs(bullseye.targetValue - currentValue)
    }

    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
        startNewGame()
        slider.minimumTrackTintColor =
        UIColor.blue.withAlphaComponent(CGFloat(quickDiff)/100.0)

    }
    
    @IBAction func showAlert() {
        
        let alertmessage = bullseye.processAlert(currentValue: currentValue)
        
        let message = "You scored \(bullseye.points) points"
//        let title = "\()"
        
        let alert = UIAlertController(title: alertmessage, message:message , preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: {
            action in
            self.startNewRound()
        })
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
        slider.minimumTrackTintColor =
        UIColor.blue.withAlphaComponent(CGFloat(quickDiff)/100.0)

    }
    
    func startNewRound() {
        bullseye.startNewRound()
        slider.value = 50.0
        targetLabel.text = String(bullseye.targetValue)
        scoreLabel.text = String(bullseye.score)
        roundLabel.text = String(bullseye.round)
        slider.minimumTrackTintColor =
        UIColor.blue.withAlphaComponent(CGFloat(quickDiff)/100.0)

    }
    
    
    @IBAction func startNewGame() {
         bullseye.startNewGame()
        startNewRound()
       
    }
    
}



