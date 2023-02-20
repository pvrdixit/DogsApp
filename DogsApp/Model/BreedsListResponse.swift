//
//  BreedsListResponse.swift
//  DogsApp
//
//  Created by pvrdixit on 20/02/23.
//

import Foundation

struct BreedsListResponse: Decodable {
    let status: String
    let message: [String : [String]]
}
