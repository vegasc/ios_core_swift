//
//  AppDelegate.swift
//  ios_core_swift
//
//  Created by Aleksey on 07.03.2024.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  var applicationCoordinator: ApplicationCoordinator!

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    let mainNavigationController = UINavigationController()
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.rootViewController = mainNavigationController
    window?.makeKeyAndVisible()
    
    let apiClient = ApiClient(
      profileRepository: ProfileRepositoryClient()
    )
    
    applicationCoordinator = ApplicationCoordinator(navigationController: mainNavigationController, apiClient: apiClient)
    applicationCoordinator.start()
    
    return true
  }

}

