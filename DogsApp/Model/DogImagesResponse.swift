//
//  DogImagesResponse.swift
//  DogsApp
//
//  Created by pvrdixit on 20/02/23.
//

import Foundation

struct DogImagesResponse: Decodable {
    let status: String
    let message: [String]
}
