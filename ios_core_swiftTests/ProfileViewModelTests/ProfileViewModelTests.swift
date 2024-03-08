//
//  ProfileViewModelTests.swift
//  ios_core_swiftTests
//
//  Created by Aleksey on 07.03.2024.
//

import Foundation
import XCTest

@testable import ios_core_swift

final class ProfileViewModelTests: XCTestCase {
  
  // MARK: - Fields
  
  var viewModel: ProfileViewModel!
  
  // MARK: - Overrides
  
  override func setUp() {
    super.setUp()
    
    self.viewModel =  ProfileViewModel(apiClient: apiTestClient)
  }
  
  override func tearDown() {
    super.tearDown()
    
    viewModel = nil
    isPositiveTest = true
  }
  
  // MARK: - Tests
  
  func testFetchProfilePositive() async {
    isPositiveTest = true
    
    let expectation = XCTestExpectation(description: "fetch_positive")
    
    await self.viewModel.fetch()
    
    expectation.fulfill()
    
    XCTAssertNil(self.viewModel.error)
    XCTAssertNotNil(self.viewModel.profile)
  }
  
  func testFetchProfileNegative() async {
    isPositiveTest = false
    
    let expectation = XCTestExpectation(description: "fetch_negative")
    
    await self.viewModel.fetch()
    
    expectation.fulfill()
    
    XCTAssertNotNil(self.viewModel.error)
    XCTAssertNil(self.viewModel.profile)
  }
  
}
