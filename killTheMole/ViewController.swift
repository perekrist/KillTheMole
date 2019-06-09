//
//  ViewController.swift
//  killTheMole
//
//  Created by Перегудова Кристина on 26.02.2019.
//  Copyright © 2019 Перегудова Кристина. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var gameScore: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var but: UIButton!
    @IBAction func mole(_ sender: UIButton) {
        score += 1
        gameScore.text = "Score: \(score)"
        self.but.isHidden = true
        
    }
    @IBOutlet weak var pauseButton: UIButton!
    @IBAction func pause(_ sender: UIButton) {
        if self.resumeTapped == false {
            timer.invalidate()
            self.resumeTapped = true
            self.but.isHidden = true
            but.setTitle("I>" , for: .normal)
        } else {
            runTimer()
            self.resumeTapped = false
            self.but.isHidden = false
            but.setTitle("II" , for: .normal)
        }
    }
    
    var score = 0
    var bestScore1: Int = 0
    var seconds = 10
    var timer = Timer()
    var isTimerRunning = false
    var resumeTapped = false

    override func viewDidLoad() {
        super.viewDidLoad()
        gameScore.text = "Score: \(score)"
        timeLabel.text = "Time: \(seconds)"
        runTimer()
        self.but.isHidden = true
    }
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        seconds -= 1
        timeLabel.text = "Time: \(seconds)"
        self.but.isHidden = false
        if seconds == 0 {
            timer.invalidate()
            performSegue(withIdentifier: "EndViewController", sender: self)
        }
        (but.center.x, but.center.y) = molePlace()
    }
    
    func  molePlace() -> (CGFloat, CGFloat) {
        var x: CGFloat
        var y: CGFloat
        let random: Int = Int(arc4random() % 9)
        if random == 1 {
            x = 190
            y = 85
        } else if random == 2 {
            x = 450
            y = 85
        } else if random == 3 {
            x = 700
            y = 85
        } else if random == 4 {
            x = 190
            y = 200
        } else if random == 5 {
            x = 450
            y = 200
        } else if random == 6 {
            x = 700
            y = 200
        } else if random == 7 {
            x = 190
            y = 320
        } else if random == 8 {
            x = 450
            y = 320
        } else {
            x = 700
            y = 320
        }
        return (x, y)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC : EndViewController = segue.destination as! EndViewController
        destVC.currentScore = score
        destVC.bestScore = bestScore1
    }

}
