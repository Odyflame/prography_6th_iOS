//
//  ViewController.swift
//  prography_6th_iOS
//
//  Created by apple on 2020/03/01.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let cellIdentifier: String = "movieCell"
    var moiveRes: [MovieResponse] = []
    var movies: [Movie] = []
    var selected10Movies: [Movie] = []
    
    @IBOutlet weak var rateInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.getData()
        self.getMovie()
    }
    
    func getData() {
        
        guard let url = URL(string: "https://yts.mx/api/v2/list_movies.json") else { return }
        do {
            guard let jsonData = try String(contentsOf: url).data(using: .utf8) else {
                return
            }
            print(jsonData)
            do {
                self.moiveRes = [try JSONDecoder().decode(MovieResponse.self, from: jsonData)]
            } catch {
                print(error.localizedDescription)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func getMovie() {
        self.movies = self.moiveRes[0].data?.movies ?? []
        print(self.moiveRes.count)
    }
    
    func getSortMovie() -> [Movie] {
        var tempMovie: [Movie] = []
        
        for douc in self.movies {
            if tempMovie.count >= 10 {
                return tempMovie
            }
            
            let uu = Double(rateInput.text ?? "0.0")
            if uu! <= douc.rating! {
                tempMovie.append(douc)
            }
        }
        
        return tempMovie
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "firstToSecond" {
            
            guard let nextViewController: secondVC = segue.destination as? secondVC else {
                return
            }
            
            self.selected10Movies = getSortMovie()
            
            nextViewController.allMovie = self.movies
            nextViewController.myMovie = self.selected10Movies
        }
    }
}
