//
//  DogImagesViewModel.swift
//  DogsApp
//
//  Created by pvrdixit on 20/02/23.
//


import Foundation

struct DogImagesViewModel
{
    func getBreedImagesList(breed: String, completion: @escaping(_ result: [String], _ message: String?)-> Void)
    {
        let dogImagesResource = DogImagesResource()
        
        dogImagesResource.getBreedsImages(breed: breed) { (dogImages) in
            guard let images = dogImages?.message
            else {
                let status = dogImages?.status ?? "Failed"
                return completion([], "Status: \(status)")
            }
            
            completion(images, nil)
        }
    }
}
