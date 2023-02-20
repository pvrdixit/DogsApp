//
//  StringExtension.swift
//  DogsApp
//
//  Created by pvrdixit on 20/02/23.
//

import Foundation

extension StringProtocol {
    var firstCapitalized: String { prefix(1).capitalized + dropFirst() }
}
