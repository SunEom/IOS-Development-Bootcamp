//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var player : AVAudioPlayer?
    var remainTime = 0
    var totalTime = 0
    
    let eggTimes = ["Soft": 3, "Medium": 4, "Hard": 7]
    
    var timer = Timer()

    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        
        let hardness = sender.currentTitle!
        
        remainTime = eggTimes[hardness]!
        totalTime = eggTimes[hardness]!
        
        progressBar.progress = 0.0
        titleLabel.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        
    }
    
    @objc func updateCounter() {
        if remainTime > 0 {
            remainTime -= 1
            progressBar.progress = Float(totalTime-remainTime)/Float(totalTime)
        } else {
            timer.invalidate()
            
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player?.play()
        
            
            titleLabel.text = "Done!"
        }
        
        
    }
}
