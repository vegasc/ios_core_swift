//
//  Navigator.swift
//  ios_core_swift
//
//  Created by Aleksey on 07.03.2024.
//

import UIKit

protocol Navigator {
  
  var navigationController: UINavigationController { get }
  
  init(navigationController: UINavigationController)
  
}
