//
//  voteCalculation.swift
//  shakeGesture
//
//  Created by Zhora Babkahanyan on 30.01.22.
//

import Foundation
import UIKit

struct starColoring {
    let color : String
    let image : String
    
}

struct VoteCalculation{
    
    var starImagesArr = ["","","","",""]
    
    

    
    mutating func calcuatingvote( vote : Double) -> [String]{
        
        
        switch vote {
        case 0.0...1.0:
           
            starImagesArr[0] = "star.leadinghalf.filled"
            starImagesArr[1] = "none"
            starImagesArr[2] = "none"
            starImagesArr[3] = "none"
            starImagesArr[4] = "none"


        case 1.1...2.0:
            starImagesArr[0] = "star.fill"
            starImagesArr[1] = "none"
            starImagesArr[2] = "none"
            starImagesArr[3] = "none"
            starImagesArr[4] = "none"

        case 2.1...3.0:
            starImagesArr[0] = "star.fill"
            starImagesArr[1] = "star.leadinghalf.filled"
            starImagesArr[2] = "none"
            starImagesArr[3] = "none"
            starImagesArr[4] = "none"

        case 3.1...4.0:
            starImagesArr[0] = "star.fill"
            starImagesArr[1] = "star.fill"
            starImagesArr[2] = "none"
            starImagesArr[3] = "none"
            starImagesArr[4] = "none"

        case 4.1...5.0:
            starImagesArr[0] = "star.fill"
            starImagesArr[1] = "star.fill"
            starImagesArr[2] = "star.leadinghalf.filled"
            starImagesArr[3] = "none"
            starImagesArr[4] = "none"

        case 5.1...6.0:
            starImagesArr[0] = "star.fill"
            starImagesArr[1] = "star.fill"
            starImagesArr[2] = "star.fill"
            starImagesArr[3] = "none"
            starImagesArr[4] = "none"

        case 6.1...7.0:
            starImagesArr[0] = "star.fill"
            starImagesArr[1] = "star.fill"
            starImagesArr[2] = "star.fill"
            starImagesArr[3] = "star.leadinghalf.filled"
            starImagesArr[4] = "none"
  
        case 7.1...8.0:
            starImagesArr[0] = "star.fill"
            starImagesArr[1] = "star.fill"
            starImagesArr[2] = "star.fill"
            starImagesArr[3] = "star.fill"

        case 8.1...9.0:
            starImagesArr[0] = "star.fill"
            starImagesArr[1] = "star.fill"
            starImagesArr[2] = "star.fill"
            starImagesArr[3] = "star.fill"
            starImagesArr[4] = "star.leadinghalf.filled"
        case 9.1...10.0:
            starImagesArr[0] = "star.fill"
            starImagesArr[1] = "star.fill"
            starImagesArr[2] = "star.fill"
            starImagesArr[3] = "star.fill"
            starImagesArr[4] = "star.fill"
        default:
            print ("Error")
        }
        return starImagesArr
    }
    
}
