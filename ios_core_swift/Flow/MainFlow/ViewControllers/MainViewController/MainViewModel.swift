//
//  MainViewModel.swift
//  ios_core_swift
//
//  Created by Aleksey on 07.03.2024.
//

import Foundation

final class MainViewModel {
  
  // MARK: - Closures
  
  var onClickNext: (() -> Void)?
  
  // MARK: - Fields
  
  @Published
  var count: Int = 0
  
}
