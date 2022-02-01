//
//  FirstPageViewController.swift
//  shakeGesture
//
//  Created by Zhora Babkahanyan on 30.01.22.
//

import UIKit

class FirstPageViewController: UIViewController {
    
    
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.navigationController?.navigationBar.isHidden = true
        
        let gifImage = UIImage.gifImageWithName("shakeImage")
            myImage.image = gifImage
        
        myLabel.text = "Shake to get the film"
        myLabel.textColor = .systemOrange


    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?){
        if motion == .motionShake {
           shacked()
        }
    }
    
    func shacked(){
        let vc = storyboard?.instantiateViewController(identifier: "MainViewController") as! MainViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
