//
//  ViewController.swift
//  BullsEye
//
//  Created by Vincent Yang on 8/13/18.
//  Copyright © 2018 AeonNeo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  var currentValue: Int = 0
  var targetValue: Int = 0
  var score = 0
  var roundNumber = 0
  
  @IBOutlet weak var slider: UISlider!
  @IBOutlet weak var targetLabel: UILabel!
  @IBOutlet weak var scoreLabel: UILabel!
  @IBOutlet weak var roundLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    startOver()
  }
  
  @IBAction func startOver() {
    score = 0
    roundNumber = 0
    
    let roundedValue = slider.value.rounded()
    currentValue = Int(roundedValue)
    startNewRound()
  }

  @IBAction func showAlert() {
    
    let difference = abs(targetValue - currentValue)
    var points = 100 - difference
    
    score = score + points
    
    let title: String
    if difference == 0 {
      title = "Perfect!"
      points += 100
    } else if difference < 5 {
      if difference == 1 {
        points += 50
      }
      title = "You almost had it!"
    } else if difference < 10 {
      title = "That's still pretty good"
    } else {
      title = "Not even close :("
    }
    
    let message = "You scored \(points) points!"
    
    // create an alert
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    
    // create the action button that you can take when the alert comes up
    let action = UIAlertAction(title: "Awesome", style: .default, handler: {
      action in
      self.startNewRound()
    })
    
    // tell the alert to add the button to itself
    alert.addAction(action)
    
    present(alert, animated: true, completion: nil)
  }
  
  @IBAction func sliderMoved(_ slider: UISlider) {
    let roundedValue = slider.value.rounded()
    currentValue = Int(roundedValue)
  }
  
  func startNewRound() {
    // set new random target
    targetValue = Int.random(in: 1...100) // this is inclusive range
    currentValue = 50
    slider.value = Float(currentValue)
    roundNumber += 1
    updateLabels()
  }
  
  func updateLabels() {
    targetLabel.text = String(targetValue)
    scoreLabel.text = String(score)
    roundLabel.text = String(roundNumber)
  }

}

