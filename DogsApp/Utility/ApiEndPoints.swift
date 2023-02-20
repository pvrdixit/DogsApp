//
//  ApiEndPoints.swift
//  DogsApp
//
//  Created by pvrdixit on 20/02/23.
//

import Foundation

struct ApiEndpoints
{
    static let listAllBreeds = "https://dog.ceo/api/breeds/list/all"
   
    static func getAllImagesforBreed(_ breed: String) -> String {
        return "https://dog.ceo/api/breed/\(breed)/images"
    }
}
