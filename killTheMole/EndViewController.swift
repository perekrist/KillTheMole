//
//  EndViewController.swift
//  killTheMole
//
//  Created by Перегудова Кристина on 27.02.2019.
//  Copyright © 2019 Перегудова Кристина. All rights reserved.
//

import UIKit

class EndViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var bestScoreLabel: UILabel!
    
    var currentScore: Int = 0
    var bestScore: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = "Score: \(currentScore)"
        if currentScore > bestScore {
            bestScore = currentScore
        }
        bestScoreLabel.text = "Best score: \(bestScore)"
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC : ViewController = segue.destination as! ViewController
        destVC.bestScore1 = bestScore
    }

}
