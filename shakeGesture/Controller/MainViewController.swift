//
//  MainViewController.swift
//  shakeGesture
//
//  Created by Zhora Babkahanyan on 30.01.22.


import UIKit
import AVFoundation

class MainViewController: UIViewController{
 
    @IBOutlet weak var Myimage: UIImageView!
    @IBOutlet weak var titleLabal: UILabel!
    @IBOutlet var starsImages: [UIImageView]!
    @IBOutlet weak var myTextField: UITextView!
    
    var audioPlayer = AVAudioPlayer()
    
    var filmManager = getFilmsManager()
    var voteCalculatingManager = VoteCalculation()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Myimage.layer.cornerRadius = 12
        Myimage.clipsToBounds = true
        filmManager.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        shaked(answer: true)
   }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?){
        if motion == .motionShake {
            soundPlay()
            shaked(answer: true)
             viewDidLoad()
        }
    }
    
    func shaked(answer :Bool){
        if answer {
            filmManager.fetchMovies()
        }
    }
    
    //  Playing Sound Shake Time
    
    func soundPlay(){
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "shakeSound", ofType: "mp3")!))
            audioPlayer.play()
        }catch{
            
        }
    }
}

// MARK: -  GetFilmsDelegate

extension MainViewController: getFilmsDelegate {
    func didUpdateFilm(_filmManager: getFilmsManager, film: [FilmsModel]) {
        let randomInt = Int.random(in: 0..<film.count - 1)
             DispatchQueue.main.async { [self] in
            starsPainting(vote: film[randomInt].vote)
           
            let url = URL(string: "https://image.tmdb.org/t/p/w300\(film[randomInt].imageURl)")
            let data = try? Data(contentsOf: url!)
           
            titleLabal.text = film[randomInt].title
            Myimage.image = UIImage(data: data!)
            titleLabal.textColor = .black
            myTextField.text = film[randomInt].overview
        }
    }

    func didFailError(error: Error) {
        print(error)
    }
    
    func starsPainting( vote : Double){
        let starsArr = voteCalculatingManager.calcuatingvote(vote: vote)
        for i in 0...starsImages.count - 1 {
            starsImages[i].image = UIImage(systemName: starsArr[i])
            starsImages[i].tintColor = .systemYellow
        }
    }
    

}


