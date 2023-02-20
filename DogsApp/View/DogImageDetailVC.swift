//
//  DogImageDetailVC.swift
//  DogsApp
//
//  Created by pvrdixit on 20/02/23.
//

import Foundation
import UIKit

class DogImageDetailVC: UIViewController {
    
    @IBOutlet weak var displayImage: UIImageView!
    var imageUrl: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayImage.image = UIImage(named: "imageNotAvailable")
        if let url = URL(string: imageUrl) {
            displayImage.kf.setImage(with: url)
        }
    }
}
