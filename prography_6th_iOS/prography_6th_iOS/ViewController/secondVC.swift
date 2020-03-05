//
//  secondVC.swift
//  prography_6th_iOS
//
//  Created by apple on 2020/03/02.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class secondVC: UIViewController {

    @IBOutlet weak var myTableView: UITableView!

    var myMovie: [Movie] = []
    var allMovie: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.myTableView.delegate = self
        self.myTableView.dataSource = self
        self.myTableView.reloadData()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let nextViewController: thirdVC = segue.destination as! thirdVC else {
            return
        }
        
        guard let cell: secondTVC = sender as? secondTVC else {
            return
        }
        
        nextViewController.tempMovieTitle = cell.movieName.text
        nextViewController.tempMovieRating = cell.movieRating.text
        nextViewController.tempMovieImage = cell.movieImage
    }
}

extension secondVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.myMovie.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = myTableView.dequeueReusableCell(withIdentifier: "secondTVC", for: indexPath) as! secondTVC
        //let cell = memoTableView.dequeueReusableCell(withIdentifier: "firstTVC", for: indexPath) as! firstTVC
        
        cell.setMeMo(memo: self.myMovie[indexPath.row])
        
        return cell
    }
    
}
