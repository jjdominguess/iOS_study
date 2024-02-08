//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    
    @IBAction func madeChoice(_ sender: UIButton) {
        let madedChoice = sender.currentTitle!
        
        storyBrain.changeDestiny(madedChoice)
        storyBrain.changeText(madedChoice)
        updateUI()
        
    }
    
    var storyBrain = StoryBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        
    }
    
    func updateUI() {
        storyLabel.text = storyBrain.sendTextDestination().text
        choice1Button.setTitle(storyBrain.sendTextChoice1().choice1, for: UIControl.State.normal)
        choice2Button.setTitle(storyBrain.sendTextChoice2().choice2, for: UIControl.State.normal)
        
        
    }

}

