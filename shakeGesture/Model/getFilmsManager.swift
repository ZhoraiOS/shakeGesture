//
//  getFilmsManager.swift
//  shakeGesture
//
//  Created by Zhora Babkahanyan on 30.01.22.
//

import Foundation

protocol getFilmsDelegate{
    func didUpdateFilm( _filmManager: getFilmsManager, film : [FilmsModel])
    func didFailError(error : Error)
    
}

struct getFilmsManager{
    
    let apiURL = "https://api.themoviedb.org/3/movie/popular?api_key="
    let apikey = "21b817ab3ca22074322f2cf1b74d04f3"
    
    var delegate : getFilmsDelegate?

    func fetchMovies(){
        let urlString = "\(apiURL)\(apikey)"
        performeRequest(urlString: urlString)
    }
    
    func performeRequest(urlString : String){
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print("error")
                }
                if let safeData = data {
                    if let film = self.parseJSON(safeData){
                        self.delegate?.didUpdateFilm(_filmManager: self, film: film)
                    }
                }
            }
            task.resume()
        }
        
    }
    
    func parseJSON(_ filmsData : Data) -> [FilmsModel]?{
        let decoder = JSONDecoder()
        var filmsArray = [FilmsModel]()
        do {
            let decodedData = try decoder.decode(FilmsData.self, from: filmsData)
            let result = decodedData.results
            for i in 0...result.count - 1 {
                let adult = decodedData.results[i].adult
                let title = decodedData.results[i].title
                let vote = decodedData.results[i].vote_average
                let imageUrl = decodedData.results[i].poster_path
                let overview = decodedData.results[i].overview
                let film = FilmsModel (adult: adult, title: title, vote: vote, imageURl: imageUrl, overview: overview)
                filmsArray.append(film)
            }
            return filmsArray
        }catch{
            self.delegate?.didFailError(error: error)
            return nil
        }
    }
    
}
