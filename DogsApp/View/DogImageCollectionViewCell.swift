//
//  DogImageCollectionViewCell.swift
//  DogsApp
//
//  Created by pvrdixit on 20/02/23.
//

import UIKit
import Kingfisher

class DogImageCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var displayImage: UIImageView!
    @IBOutlet weak var breedName: UILabel!
    @IBOutlet weak var shareButton: UIButton!
    
    func configure(_ imageURL: String) {
        displayImage.image = UIImage(named: "imageNotAvailable")
        if let url = URL(string: imageURL) {
            displayImage.kf.setImage(with: url)
        }
    }
    
    override func prepareForReuse() {
        displayImage.image = UIImage(named: "imageNotAvailable")
    }
    
    
    @IBAction func shareButtonTapped(_ sender: UIButton) {
        // Get the image from the imageView of the cell
        guard let image = displayImage.image else {
            return
        }
               
        // Share the message and the image using UIActivityViewController on the main thread
        DispatchQueue.main.async {
            let activityViewController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
            
            // for iPad
            if let popoverController = activityViewController.popoverPresentationController {
                popoverController.sourceView = self.contentView
                popoverController.sourceRect = sender.frame
                popoverController.permittedArrowDirections = [.down, .up]
            }
            
            self.window?.rootViewController?.present(activityViewController, animated: true, completion: nil)
        }

    }


}
