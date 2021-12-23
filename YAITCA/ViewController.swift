
import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!
    
    var timer = Timer()
    
    var totalTime = 0
    
    var secondsPassed = 0
    
    let eggTimes = ["Soft": 3, "Medium": 4, "Hard": 7]
    
    @IBOutlet var mainTitle: UILabel!
    
    @IBOutlet var progressBar: UIProgressView!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        progressBar.isHidden = false
        secondsPassed = 0
        progressBar.progress = 0.0
        
        timer.invalidate()
        let hardness = sender.currentTitle!
        
        totalTime = eggTimes[hardness]!
        mainTitle.text = hardness
        
        mainTitle.font = UIFont.systemFont(ofSize: 30.0)
        mainTitle.textColor = UIColor.black
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(update), userInfo: nil, repeats: true)
    }
    
    @objc func update() {
        if secondsPassed < totalTime {
            
            secondsPassed += 1
            
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
            
            
        } else {
            timer.invalidate()
            mainTitle.font = UIFont.systemFont(ofSize: 50.0)
            mainTitle.textColor = UIColor.red
            mainTitle.text = "DONE"
           playSound()
            progressBar.isHidden = true
        }
    }
    
    func playSound() {
        let url = Bundle.main.url(forResource: "G", withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
        
    }
}
