//
//  MainViewController.swift
//  ios_core_swift
//
//  Created by Aleksey on 07.03.2024.
//

import UIKit
import Combine

final class MainViewController: BaseViewController {
  
  // MARK: - Fields
  
  let viewModel: MainViewModel
  
  // MARK: - UI
  
  private let textLabel = UILabel()
  
  // MARK: - Lifecycle
  
  init(viewModel: MainViewModel) {
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("Not implemented")
  }
  
  // MARK: - Functions
  
  @objc
  private func increaseCount() {
    self.viewModel.count += 1
  }
  
  @objc
  private func nextScreen() {
    self.viewModel.onClickNext?()
  }
  
  // MARK: - Overrides
  
  override func bind() {
    super.bind()
    
    viewModel.$count
      .receive(on: DispatchQueue.main)
      .sink(receiveValue: { _ in
        self.updateUI()
      })
      .store(in: &cancellables)
  }
  
  override func updateUI() {
    self.textLabel.text = String(self.viewModel.count)
  }
  
  override func setupUI() {
    super.setupUI()
    
    textLabel.textAlignment = .center
    textLabel.textColor = .black
    
    textLabel.translatesAutoresizingMaskIntoConstraints = false
    self.view.addSubview(textLabel)
    NSLayoutConstraint.activate([
      textLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      textLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      textLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor)
    ])
    
    let button = UIButton()
    button.setTitle("Increase Count", for: .normal)
    button.setTitleColor(.blue, for: .normal)
    button.addTarget(self, action: #selector(increaseCount), for: .touchUpInside)
    
    button.translatesAutoresizingMaskIntoConstraints = false
    self.view.addSubview(button)
    NSLayoutConstraint.activate([
      button.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 15),
      button.centerXAnchor.constraint(equalTo: view.centerXAnchor)
    ])
    
    let nextScreenButton = UIButton()
    nextScreenButton.setTitle("Next Screen", for: .normal)
    nextScreenButton.setTitleColor(.black, for: .normal)
    nextScreenButton.addTarget(self, action: #selector(nextScreen), for: .touchUpInside)
    
    nextScreenButton.translatesAutoresizingMaskIntoConstraints = false
    self.view.addSubview(nextScreenButton)
    NSLayoutConstraint.activate([
      nextScreenButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -15),
      nextScreenButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
    ])
  }
  
}
