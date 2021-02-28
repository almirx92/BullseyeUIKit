//
//  ViewController.swift
//  Bullseye
//
//  Created by Macbook on 24. 2. 2021..
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue: Int = 0;
    var targetValue: Int = 0;
    var score = 0;
    @IBOutlet weak var slider : UISlider!
    @IBOutlet weak var targetValueLb: UILabel!
    @IBOutlet weak var scoreLb: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let roundedValue = slider.value.rounded();
        currentValue = Int(roundedValue);
        startNewRound();
        
    }
    
    @IBAction func showAlert(){
        
        var tittle: String = "Awesome";
        let difference = abs(targetValue - currentValue);
        let points = 100 - difference;
        
        
        score += points;
        
        if difference == 0 {
            tittle = "Perfect";
            score += 100;
        }
            else if (difference < 5) && (difference != 0) {
                tittle = "Good";
                score += 50;
            }
        
    let message = "You scored \(points) points ";
    let alert = UIAlertController(title: tittle, message: message , preferredStyle: .alert);
        
        let action = UIAlertAction(title: "Awesome", style: .default, handler: nil);
        
        alert.addAction(action);
        
        present(alert, animated: true, completion: nil);
        
        targetValue = Int.random(in: 1...100);
        startNewRound();
        
    }
    @IBAction func SliderMoved(_ slider : UISlider){
        currentValue = Int(slider.value);
        print("This is the value of the slider \(slider.value)");
    }
    
    func startNewRound(){
        targetValue = Int.random(in: 1...100);
        updateLabels();
    }
    func updateLabels(){
        targetValueLb.text = String(targetValue);
        scoreLb.text = String(score);
    }
}



