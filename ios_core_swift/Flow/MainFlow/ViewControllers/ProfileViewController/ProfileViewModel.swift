//
//  ProfileViewModel.swift
//  ios_core_swift
//
//  Created by Aleksey on 07.03.2024.
//

import Foundation

final class ProfileViewModel {
  
  // MARK: - Fields
  
  let apiClient: ApiClient
  
  @Published
  var profile: UserProfile?
  
  @Published
  var error: Error?
  
  // MARK: - Lifecycle
  
  init(apiClient: ApiClient) {
    self.apiClient = apiClient
  }
  
  func fetch() async {
    do {
      self.profile = try await self.apiClient.getProfile()
    } catch (let error) {
      self.error = error
    }
  }
  
}
