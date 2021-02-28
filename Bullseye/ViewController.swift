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
    @IBOutlet weak var slider : UISlider!
    @IBOutlet weak var targetValueLb: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let roundedValue = slider.value.rounded();
        currentValue = Int(roundedValue);
        startNewRound();
        
    }
    
    @IBAction func showAlert(){
        let alert = UIAlertController(title: "Hello there!", message: "This is the current value of the slider \(currentValue)" + "\n The target value is: \(targetValue)", preferredStyle: .alert);
        
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
    }
}



