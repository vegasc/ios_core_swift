//
//  Coordinator+Dependency.swift
//  ios_core_swift
//
//  Created by Aleksey on 07.03.2024.
//

import Foundation

extension Coordinator {
  
  func addDependency(coordinator: Coordinator) {
    guard !children.contains(where: { $0 === coordinator }) else { return }
    children.append(coordinator)
  }
  
  func removeDependency(coordinator: Coordinator) {
    children = children.filter({$0 !== coordinator})
  }
  
}
