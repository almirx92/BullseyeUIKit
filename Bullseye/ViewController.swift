//
//  ViewController.swift
//  Bullseye
//
//  Created by Macbook on 24. 2. 2021..
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue = 0;
    var targetValue = 0;
    var score = 0;
    var round = 0;
    @IBOutlet weak var slider : UISlider!
    @IBOutlet weak var targetValueLb: UILabel!
    @IBOutlet weak var scoreLb: UILabel!
    @IBOutlet weak var roundLb: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let roundedValue = slider.value.rounded();
        currentValue = Int(roundedValue);
        startNewGame();
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14);
        
        //let thumbImage = UIImage(named: "SliderThumb-Normal")!
        let thumbImage = #imageLiteral(resourceName: "SliderThumb-Normal");
        slider.setThumbImage(thumbImage, for: .normal);
        let thumbImageHighlighted = #imageLiteral(resourceName: "SliderThumb-Highlighted");
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted);
        
        let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft");
        let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets);
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal);
        
        let trackRightImage = #imageLiteral(resourceName: "SliderTrackRight");
        let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets);
        slider.setMaximumTrackImage(trackRightResizable, for: .normal);
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
        
        let action = UIAlertAction(title: "Awesome", style: .default, handler:{
            action in
            self.startNewRound();
        });
        
        alert.addAction(action);
        
        present(alert, animated: true, completion: nil);
        
        targetValue = Int.random(in: 1...100);
        
    }
    @IBAction func SliderMoved(_ slider : UISlider){
        currentValue = Int(slider.value);
        print("This is the value of the slider \(slider.value)");
    }
    
    func startNewRound(){
        targetValue = Int.random(in: 1...100);
        currentValue = 50;
        slider.value = Float(currentValue);
        round += 1;
        updateLabels();
        
    }
    func updateLabels(){
        targetValueLb.text = String(targetValue);
        roundLb.text = String(round);
        scoreLb.text = String(score);
    }
    @IBAction func startNewGame(){
        score = 0;
        round = 0;
        startNewRound();
    }
}



