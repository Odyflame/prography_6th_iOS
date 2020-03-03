//
//  secondTVC.swift
//  prography_6th_iOS
//
//  Created by apple on 2020/03/02.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class secondTVC: UITableViewCell {
    
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var movieRating: UILabel!
    
    var vc: secondVC? = nil
    var movieImage: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setMeMo(memo: Movie) {
    
        self.movieName.text = memo.title
        self.movieRating.text = "\(Double(memo.rating!))"
        self.movieImage = memo.image
    }
 
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
