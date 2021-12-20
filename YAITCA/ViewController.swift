
import UIKit

class ViewController: UIViewController {
    
    var timer = 10
    let eggTimes = ["Soft": 300, "Medium": 480, "Hard": 720]
    var secondsRemaining = 60
    @IBAction func hardnessSelected(_ sender: UIButton) {
        let hardness = sender.currentTitle
        
        secondsRemaining = eggTimes[hardness!]!
       
         Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(update), userInfo: nil, repeats: true)
    }
    
    @objc func update() {
        if(secondsRemaining > 0) {
            print("\(secondsRemaining) seconds is remaining")
            secondsRemaining -= 1
        }
    }
}
