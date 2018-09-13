//
//  ViewController.swift
//  My First App
//
//  Created by Sebastian Vogel on 02.09.18.
//  Copyright © 2018 Sebastian Vogel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    
    var seconds = 0
    var running = false
    var timer = Timer()
    
    let formatter = DateComponentsFormatter()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.zeroFormattingBehavior = .pad
        updateTimeLabel()
    }

    func updateTimeLabel(){
        if let formattedString = formatter.string(from: TimeInterval(seconds)){
            timeLabel.text = formattedString
        }
    }
    
    @objc func countUp(){
        seconds += 1
        updateTimeLabel()
    }
    
    func startTimer(){
        if running {return}
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countUp), userInfo: nil, repeats: true)
        running = true
    }
    
    func stopTimer(){
        timer.invalidate()
        running = false
    }
    
    func resetTimer(){
        stopTimer()
        seconds = 0
        updateTimeLabel()
    }
    
    
    @IBAction func buttonHandler(_ sender: UIButton) {
        if let title = sender.titleLabel?.text{
            switch title{
            case "Start":
                    startTimer()
            case "Stop":
                    stopTimer()
            case "Reset":
                    resetTimer()
            default: break
                
            }
        }
        
        
    }
    
    
    
}

