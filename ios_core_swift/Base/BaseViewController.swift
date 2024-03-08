//
//  BaseViewController.swift
//  ios_core_swift
//
//  Created by Aleksey on 07.03.2024.
//

import UIKit
import Combine

class BaseViewController: UIViewController, UISetupable, UIUpdatable, Bindable {
  
  // MARK: - Fields
  
  var cancellables: Set<AnyCancellable> = []
  
  // MARK: - Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    bind()
    updateUI()
  }
  
  // MARK: - Functions
  
  func bind() {
    
  }
  
  func updateUI() {
    
  }
  
  func setupUI() {
    self.view.backgroundColor = .white
  }
  
}
