//
//  thirdVC.swift
//  prography_6th_iOS
//
//  Created by apple on 2020/03/02.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class thirdVC: UIViewController {

    @IBOutlet weak var movieName: UILabel?
    @IBOutlet weak var movieRating: UILabel?
    @IBOutlet weak var moiveImage: UIImageView!
    
    var tempMovieTitle: String?
    var tempMovieRating: String?
    var tempMovieImage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.movieName?.text = self.tempMovieTitle
        self.movieRating?.text = self.tempMovieRating
        
        
        
        let imageUrl = URL(string: self.tempMovieImage!)
        do {
            let data = try Data(contentsOf: imageUrl!)
            self.moiveImage.image = UIImage(data: data)
        } catch {
            print("get image url failed")
            self.moiveImage.image = UIImage(named: "user_male")
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
