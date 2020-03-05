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
    var values: [String] = ["0","1","2","3","4","5","6","7","8","9"]
    
    @IBOutlet weak var rateInput: UITextField!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var picker: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextBtn.layer.cornerRadius = 10
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn, animations: {
            self.nextBtn.center.x += self.view.bounds.width
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        self.getData()
        self.getMovie()
        
        self.picker.dataSource = self
        self.picker.delegate = self
        
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

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.values.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(self.values[row])"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        rateInput.text = self.values[row]
    }
}
