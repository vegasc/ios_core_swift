//
//  NavigationStack.swift
//  ios_core_swift
//
//  Created by Aleksey on 07.03.2024.
//

import UIKit

final class NavigationStack: Navigator {
  
  var navigationController: UINavigationController
  
  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }
  
  func present(controller: UIViewController, animated: Bool = true, completion: (() -> Void)? = nil) {
    navigationController.present(controller, animated: animated, completion: completion)
  }
  
  func push(controller: UIViewController, animated: Bool = true, isNavBarHidden: Bool = false, isTabBarHidden: Bool = false) {
    controller.hidesBottomBarWhenPushed = isTabBarHidden
    navigationController.isNavigationBarHidden = isNavBarHidden
    navigationController.pushViewController(controller, animated: animated)
  }
  
  func pop(animated: Bool = true) {
    navigationController.popViewController(animated: animated)
  }
  
  func popToRoot(animated: Bool = true) {
    navigationController.popToRootViewController(animated: animated)
  }
  
  func set(controller: UIViewController, isTabBarHidden: Bool = false, transition: CATransition? = nil) {
    controller.hidesBottomBarWhenPushed = isTabBarHidden
    if let transition = transition, let window = navigationController.navigationBar.window {
      window.layer.add(transition, forKey: kCATransition)
    }
    navigationController.setViewControllers([controller], animated: false)
  }
  
  func set(controllers: [UIViewController], animated: Bool = true, isNavBarHidden: Bool = false, isTabBarHidden: Bool = false) {
    guard controllers.count >= 1 else { return }
    guard let last = controllers.last else { return }
    last.hidesBottomBarWhenPushed = isTabBarHidden
    navigationController.setViewControllers(controllers, animated: animated)
    last.navigationController?.isNavigationBarHidden = isNavBarHidden
  }
  
  func set(controllers: [UIViewController], isNavBarHidden: Bool = false, isTabBarHidden: Bool = false, transition: CATransition) {
    guard controllers.count >= 1 else { return }
    if let window = navigationController.navigationBar.window {
      window.layer.add(transition, forKey: kCATransition)
    }
    set(controllers: controllers, animated: false, isNavBarHidden: isNavBarHidden, isTabBarHidden: isTabBarHidden)
  }
  
  func dismissController(animated: Bool = true, completion: (() -> Void)? = nil) {
    navigationController.dismiss(animated: animated, completion: completion)
  }
  
}
