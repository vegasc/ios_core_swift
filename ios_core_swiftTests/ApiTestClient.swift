//
//  ApiTestClient.swift
//  ios_core_swiftTests
//
//  Created by Aleksey on 07.03.2024.
//

import Foundation

var isPositiveTest = true

let apiTestClient = ApiClient(
  profileRepository: ProfileRepositoryTestClient()
)
