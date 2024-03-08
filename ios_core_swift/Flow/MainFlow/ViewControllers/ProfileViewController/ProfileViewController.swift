//
//  ProfileViewController.swift
//  ios_core_swift
//
//  Created by Aleksey on 07.03.2024.
//

import UIKit
import Combine

final class ProfileViewController: BaseViewController {
  
  // MARK: - Fields
  
  let viewModel: ProfileViewModel
  
  // MARK: - UI
  
  private let stack = UIStackView()
  
  private let nameLabel = UILabel()
  
  private let surnameLabel = UILabel()
  
  private let bioLabel = UILabel()
  
  // MARK: - Lifecycle
  
  init(viewModel: ProfileViewModel) {
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("Not implemented")
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    Task {
      await self.viewModel.fetch()
    }
  }
  
  // MARK: - Functions
  
  private func showAlert(message: String) async {
    await withCheckedContinuation { continuation in
      let alert = UIAlertController(
        title: "",
        message: message,
        preferredStyle: .alert
      )
      let okAction = UIAlertAction(
        title: "Ok",
        style: .default) { _ in
          continuation.resume()
        }
      alert.addAction(okAction)
      
      DispatchQueue.main.async {
        self.present(alert, animated: true)
      }
    }
  }
  
  private func showErrorMessage() async {
    guard let error = self.viewModel.error else { return }
    await showAlert(message: error.localizedDescription)
    self.viewModel.error = nil
  }
  
  // MARK: - Overrides
  
  override func bind() {
    super.bind()
    
    self.viewModel.$profile
      .receive(on: DispatchQueue.main)
      .sink { _ in
        self.updateUI()
      }
      .store(in: &cancellables)
    
    self.viewModel.$error
      .receive(on: DispatchQueue.main)
      .compactMap({ $0 })
      .sink { _ in
        Task {
          await self.showErrorMessage()
        }
      }
      .store(in: &cancellables)
  }
  
  override func updateUI() {
    super.updateUI()
    
    self.nameLabel.text = String("name: \(self.viewModel.profile?.name ?? "")")
    self.surnameLabel.text = String("surname: \(self.viewModel.profile?.surname ?? "")")
    self.bioLabel.text = String("bio: \(self.viewModel.profile?.bio ?? "")")
  }
  
  override func setupUI() {
    super.setupUI()
    
    stack.distribution = .fill
    stack.alignment = .fill
    stack.axis = .vertical
    stack.spacing = 15
    
    stack.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(stack)
    NSLayoutConstraint.activate([
      stack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
      stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
      stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8)
    ])
    
    nameLabel.textColor = .black
    
    surnameLabel.textColor = .black
    
    bioLabel.textColor = .black
    
    stack.addArrangedSubview(nameLabel)
    stack.addArrangedSubview(surnameLabel)
    stack.addArrangedSubview(bioLabel)
    
  }
  
}
