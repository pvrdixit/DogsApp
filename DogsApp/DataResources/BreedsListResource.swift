//
//  BreedsListResource.swift
//  DogsApp
//
//  Created by pvrdixit on 20/02/23.
//

import Foundation

struct BreedsListResource
{
    func getBreedsList(completion: @escaping(_ result : BreedsListResponse?) -> Void)
    {
        let requestURL = URL(string: ApiEndpoints.listAllBreeds)!
        let httpUtility = HttpUtility()
        
        httpUtility.getApiData(requestUrl: requestURL, resultType: BreedsListResponse.self) { (breedsListResponse) in
            _ = completion(breedsListResponse)
        }
    }
}
