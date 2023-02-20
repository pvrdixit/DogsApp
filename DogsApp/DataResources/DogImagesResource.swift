//
//  DogImagesResource.swift
//  DogsApp
//
//  Created by pvrdixit on 20/02/23.
//

import Foundation


struct DogImagesResource
{
    func getBreedsImages(breed: String, completion: @escaping(_ result : DogImagesResponse?) -> Void)
    {
        let requestURL = URL(string: ApiEndpoints.getAllImagesforBreed(breed))!
        let httpUtility = HttpUtility()
        
        httpUtility.getApiData(requestUrl: requestURL, resultType: DogImagesResponse.self) { (dogImagesResponse) in
            _ = completion(dogImagesResponse)
        }
    }
}
