//
//  Coordinator.swift
//  ios_core_swift
//
//  Created by Aleksey on 07.03.2024.
//

import UIKit

protocol Coordinator: AnyObject {
  
  var children: [Coordinator] { get set }
  
  func start()
  
  func addDependency(coordinator: Coordinator)
  
  func removeDependency(coordinator: Coordinator)
  
}
