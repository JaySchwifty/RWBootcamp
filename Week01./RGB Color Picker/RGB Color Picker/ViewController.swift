//
//  ViewController.swift
//  RGB Color Picker
//
//  Created by Jaron Christopher Grigsby on 5/29/20.
//  Copyright © 2020 JcCorp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var colorName: UILabel!
    @IBOutlet weak var redValue: UILabel!
    @IBOutlet weak var greenValue: UILabel!
    @IBOutlet weak var blueValue: UILabel!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    var rValue = 1
    var gValue = 1
    var bValue = 1
    var newColor: String!
    var colorNameLbl = "Find your new favorite color! 🤩"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        redValue.text = "0"
        greenValue.text = "0"
        blueValue.text = "0"
        colorName.text = colorNameLbl
    }
    
    @IBAction func redSlider(_ sender: UISlider) {
        let redsColor = sender.value.rounded()
        rValue = Int(redsColor)
        redValue.text = String(rValue)
        cChanges()
    }
    
    @IBAction func greenSlider(_ sender: UISlider) {
        
        let greenColor = sender.value.rounded()
        gValue = Int(greenColor)
        greenValue.text = String(gValue)
        cChanges()
    }
    
    @IBAction func blueValue(_ sender: UISlider) {
        let blueColor = sender.value.rounded()
        bValue = Int(blueColor)
        blueValue.text = String(bValue)
        cChanges()
    }
    

    @IBAction func setColorHit(_ sender: UIButton) {
        
     let alertController = UIAlertController(title: "Name your AWESOME color", message: "Cant wait!!", preferredStyle: .alert)

        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = ""
        }

        let alertAction = UIAlertAction(title: "Set it", style: .default, handler: { alert -> Void in
            let firstTextField = alertController.textFields![0] as UITextField
            
            self.newColor = firstTextField.text
            self.colorName.text = self.newColor
        })

        alertController.addAction(alertAction)
        

        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func reset(_ sender: UIButton) {
         
        colorName.text = colorNameLbl
        blueValue.text = String(0)
        redValue.text = String(0)
        greenValue.text = String(0)
        redSlider.value = 0
        greenSlider.value = 0
        blueSlider.value = 0
        self.view.backgroundColor = UIColor.white
        
    }
    
    
    func cChanges() {
        
        self.view.backgroundColor = UIColor.init(red: CGFloat(rValue)/255, green: CGFloat(gValue)/255, blue: CGFloat(bValue)/255, alpha: 1)
    }
}

