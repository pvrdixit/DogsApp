//
//  DogsAppTests.swift
//  DogsAppTests
//
//  Created by pvrdixit on 20/02/23.
//

import XCTest
@testable import DogsApp

final class DogsAppTests: XCTestCase {
    
    func test_getBreedsImages_Success() {
        let breedName = "hound"
        let source = DogImagesResource()
        let expectation = self.expectation(description: "ValidRequest_ReturnsImageUrls")
        
        source.getBreedsImages(breed: breedName) { result in
            XCTAssertNotNil(result)
            XCTAssertEqual(result?.status, "success")
            XCTAssertNotEqual(result?.message.count, 0)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func test_GetBreedList_Success() {
        let source = BreedsListResource()
        let expectation = self.expectation(description: "ValidRequest_BreedList")
        
        source.getBreedsList() { result in
            XCTAssertNotNil(result)
            XCTAssertEqual(result?.status, "success")
            XCTAssertNotEqual(result?.message.count, 0)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
    
}
