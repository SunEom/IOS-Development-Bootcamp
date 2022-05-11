//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var firstChoiceButton: UIButton!
    @IBOutlet weak var secondChoiceButton: UIButton!
    @IBOutlet weak var thirdChoiceButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var quizer = Quizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    
    @IBAction func choiceButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.titleLabel?.text!
        let isUserRight = quizer.checkAnswer(userAnswer!)
        
        if isUserRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizer.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    
    @objc func updateUI() {
        updateTitle()
        updateChoiceButton()
        updateScore()
        resetButtonsBackground()
    }
    
    func updateTitle() {
        titleLabel.text = quizer.getQuestionText()
    }
    
    func updateChoiceButton() {
        firstChoiceButton.setTitle(quizer.getFirstChoice(), for: .normal)
        secondChoiceButton.setTitle(quizer.getSecondChoice(), for: .normal)
        thirdChoiceButton.setTitle(quizer.getThirdChoice(), for: .normal)
    }
    
    func updateScore() {
        scoreLabel.text = "Score : \(quizer.getScore())"
    }
    
    func resetButtonsBackground() {
        [firstChoiceButton, secondChoiceButton, thirdChoiceButton].forEach { button in
            button?.backgroundColor = UIColor.clear
        }
    }

}

