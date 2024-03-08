//
//  MainFlowCoordinator.swift
//  ios_core_swift
//
//  Created by Aleksey on 07.03.2024.
//

import UIKit

final class MainFlowCoordinator: Coordinator {
  
  let navigationNavigator: NavigationStack
  
  let apiClient: ApiClient
  
  var children: [Coordinator] = []
  
  init(navigationNavigator: NavigationStack, apiClient: ApiClient) {
    self.navigationNavigator = navigationNavigator
    self.apiClient = apiClient
  }
  
  func start() {
    self.showMainViewController()
  }
  
  private func showMainViewController() {
    let mainViewModel = MainViewModel()
    mainViewModel.onClickNext = { [weak self] in
      guard let self = self else { return }
      self.showProfileViewController()
    }
    let vc = MainViewController(viewModel: mainViewModel)
    self.navigationNavigator.push(controller: vc)
  }
  
  private func showProfileViewController() {
    let profileViewModel = ProfileViewModel(apiClient: self.apiClient)
    let vc = ProfileViewController(viewModel: profileViewModel)
    self.navigationNavigator.push(controller: vc)
  }
  
}
