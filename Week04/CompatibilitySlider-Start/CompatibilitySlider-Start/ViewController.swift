//
//  ViewController.swift
//  CompatibilitySlider-Start
//
//  Created by Jay Strawn on 6/16/20.
//  Copyright © 2020 Jay Strawn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var compatibilityItemLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var questionLabel: UILabel!
    
    
    var compatibilityItems = [
        "Cats",
        "Dogs",
        "Video Games",
        "Rick & Morty",
        "Anime",
        "Hiking",
        "Photography",
        "Painting",
        "Java",
        "GO",
        "Swift"
    ]
    
    
    var currentItemIndex = 0
    
    var person1 = Person(id: 1, items: [:])
    var person2 = Person(id: 2, items: [:])
    var currentPerson: Person?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        compatibilityItemLabel.text = "\(compatibilityItems[0])"
        currentPerson = person1
        nextQ()
        slider.value = 0.0
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        slider.maximumValue = 5.0
        print(slider.value)
    }
    
    func nextQ(){
        if currentPerson == person1 {
            questionLabel.text = "Person1, what do you think about .."
        } else if currentPerson == person2 {
            questionLabel.text = "Person2, what do you think about .."
        }
    }
    
    func printArray(){
        print("currentPerson")
        for (key, personRating) in currentPerson!.items{
            print("\(key): \(personRating)")
        }
        
    }
    
    @IBAction func didPressNextItemButton(_ sender: Any) {
        
        let currentItem = compatibilityItems[currentItemIndex]
        currentPerson?.items.updateValue(slider.value, forKey: currentItem)
        
        if currentItemIndex < compatibilityItems.count - 1 {
            currentItemIndex += 1
            nextQ()
        } else {
            printArray()
        }
        compatibilityItemLabel.text = compatibilityItems[currentItemIndex]
        
        if currentItem == compatibilityItems[10] && currentPerson == person1 {
            
            currentItemIndex = 0
            compatibilityItemLabel.text = "\(compatibilityItems[0])"
            currentPerson = person2
            nextQ()
            
        } else if currentItem == compatibilityItems[10] && currentPerson == person2{
            
            let message = calculateCompatibility()
            
            let alert = UIAlertController(title: "Here are your results!", message:" Both of you are \(message) compatible", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func calculateCompatibility() -> String {
        // If diff 0.0 is 100% and 5.0 is 0%, calculate match percentage
        var percentagesForAllItems: [Double] = []
        
        for (key, person1Rating) in person1.items {
            let person2Rating = person2.items[key] ?? 0
            let difference = abs(person1Rating - person2Rating)/5.0
            percentagesForAllItems.append(Double(difference))
        }
        
        let sumOfAllPercentages = percentagesForAllItems.reduce(0, +)
        let matchPercentage = sumOfAllPercentages/Double(compatibilityItems.count)
        print(matchPercentage, "%")
        let matchString = 100 - (matchPercentage * 100).rounded()
        return "\(matchString)%"
    }
}
