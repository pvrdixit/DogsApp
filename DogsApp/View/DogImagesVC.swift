//
//  DogImagesVC.swift
//  DogsApp
//
//  Created by pvrdixit on 20/02/23.
//

import UIKit

class DogImagesVC: UIViewController {
    
    @IBOutlet weak var listView: UICollectionView!
    
    let dogImagesViewModel : DogImagesViewModel = DogImagesViewModel()
    var dogImagesUrlList : [String] = []
    var breedName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = breedName.firstCapitalized
        getDogImagesList()
        listView.register(UINib(nibName: "DogImageCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "DogImageCollectionViewCell")
    }
    
    
    private func getDogImagesList()
    {
        showSpinner()
        
        dogImagesViewModel.getBreedImagesList(breed: breedName) { [weak self] (result, message) in
            guard let self = self else { return }
            self.dogImagesUrlList = result
            self.removeSpinner()
            
            if message != nil {
                DispatchQueue.main.async {
                    self.displayAlert(alertMessage: message!)
                    self.listView.reloadData()
                }
            }
            else {
                DispatchQueue.main.async {
                    self.listView.reloadData()
                }
            }
            
        }
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


extension DogImagesVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dogImagesUrlList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DogImageCollectionViewCell", for: indexPath) as! DogImageCollectionViewCell
        let imageURL = dogImagesUrlList[indexPath.item]
        cell.configure(imageURL)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DogImageDetailVC") as! DogImageDetailVC
        vc.imageUrl = dogImagesUrlList[indexPath.item]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionWidth = ((collectionView.bounds.width)/2.0)
        let width = collectionWidth
        let height = collectionWidth + 50
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 5, right: 0)
    }
}
