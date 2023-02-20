//
//  BreedsViewModel.swift
//  DogsApp
//
//  Created by pvrdixit on 20/02/23.
//

import Foundation

struct BreedsViewModel
{
    func getBreedsList(completion: @escaping(_ result: [String], _ message: String?)-> Void)
    {
        let breedsListResource = BreedsListResource()
        
        breedsListResource.getBreedsList { (breedsListResponse) in
            guard let breeds = breedsListResponse?.message
            else {
                return completion([], breedsListResponse?.status ?? "Sorry, Unable to load data")
            }

            let breedList = Array(breeds.keys) as [String]
            completion(breedList, nil)
        }
    }
}
