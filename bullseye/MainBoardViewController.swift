//
//  ViewController.swift
//  bullseye
//
//  Created by beehive-iOS on 3/17/22.
//

import UIKit

class MainBoardViewController: UIViewController {
//
    @IBOutlet var slider: UISlider!
    @IBOutlet var taskLabel: UILabel!
    @IBOutlet weak var tryAgain: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    
    var difference: Int = 0
    
    // score number
    var score: Int = 0
    
    // number that a gamer has to guess
    var guessingNumber: Int = 0
    
    var round = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let normalThumbImage = UIImage(named: "SliderThumb-Normal")
        
        slider.setThumbImage(normalThumbImage, for: .normal)
        slider.setThumbImage(UIImage(named: "SliderThumb-Highlighted"), for: .highlighted)
        
        slider.setMinimumTrackImage(UIImage(named: "SliderTrackLeft"), for: .normal)
        slider.setMaximumTrackImage(UIImage(named: "SliderTrackRight"), for: .normal)
        
        setUp()
    }

    @IBAction func sliderValueChanged(_ sender: UISlider) {
    }
    
    @IBAction func didTapOkButton(_ sender: UIButton) {
        setScore()
        round += 1
        roundLabel.text = "round: \(round)"
        updateGuessingNumber()
        if round == 11 {
//            UIAlertController
            let alert = UIAlertController(title: "Game Over", message: "Your score is \(score)", preferredStyle: .alert)
            let restartButton = UIAlertAction(title: "Restart Game", style: .cancel) { _ in
                self.setUp()
            }
            alert.addAction(restartButton)
            present(alert, animated: true)
        }
    }
    
    @IBAction func didTapTryAgainButton(_ sender: Any) {
        print("Did tap try again")
        setUp()
        updateGuessingNumber()
    }
        
    func setUp() {
        // setting game
        // 1. setting slider value
        slider.value = 50
        
        // 2. setting number to guess
        updateGuessingNumber()
        
        // 3. setting score number to 0
        score = 0
        scoreLabel.text = "Score: \(score)"
        
        round = 1
        roundLabel.text = "round: \(round)"
        
    }
        
    func setScore() {
        // добавляем очки в зависимости от того, насколько близко попали
        difference = abs(guessingNumber - Int(slider.value))
        if difference>=0 && difference <= 10 {
            score = score + (10 - difference)
        }
        scoreLabel.text = "Score: \(score)"
    }
    func updateGuessingNumber() {
        guessingNumber = Int.random(in: 1...100)
        taskLabel.text = "Find number: \(guessingNumber)"
    }
}



//        // задача
//        // 1. Прочитать число из слайдера
//        let sliderValue: Float = slider.value
//        // 2. Перевести это число в  Int(sliderValue)
//        let sliderValueInt: Int = Int(sliderValue)
//        // 3. Сравнить два числа, и если они совпадают, то вывести в консоль информацию об этом
//        let areValuesEqual = sliderValueInt == guessingNumber
//        if areValuesEqual {
//            print("You are right")
//        } else {
//            print("You chose number \(sliderValueInt)")
//        }
