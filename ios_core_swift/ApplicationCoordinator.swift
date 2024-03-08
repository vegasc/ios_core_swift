//
//  ApplicationCoordinator.swift
//  ios_core_swift
//
//  Created by Aleksey on 07.03.2024.
//

import UIKit

final class ApplicationCoordinator: Coordinator {
  
  var navigationNavigator: NavigationStack
  
  var children: [Coordinator] = []
  
  let apiClient: ApiClient
  
  init(navigationController: UINavigationController, apiClient: ApiClient) {
    self.navigationNavigator = NavigationStack(navigationController: navigationController)
    self.apiClient = apiClient
  }
  
  func start() {
    self.startMainFlow()
  }
  
  private func startMainFlow() {
    let mainCoordinator = MainFlowCoordinator(navigationNavigator: navigationNavigator, apiClient: apiClient)
    mainCoordinator.start()
    
    self.addDependency(coordinator: mainCoordinator)
  }
  
}
