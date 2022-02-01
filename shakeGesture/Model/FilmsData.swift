//
//  FilmsModel.swift
//  shakeGesture
//
//  Created by Zhora Babkahanyan on 30.01.22.
//

import Foundation


struct FilmsData : Decodable{
    let results : [Results]
}
struct Results : Decodable {
    let adult : Bool
    let poster_path : String
    let title : String
    let vote_average : Double
    let overview : String
}
