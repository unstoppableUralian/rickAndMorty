//
//  RegistrationViewController.swift
//  RickAndMortyApp
//
//  Created by Русинов Евгений on 16.11.2023.
//

import UIKit
import SnapKit


/**
   Класс для  регистрации в приложении
 */

final class RegistrationViewController: UIViewController {
    
    //MARK: - Private properties
    
    private let stackView = UIStackView()

    private let loginTextField = LoginTextField(placeholder: "Create your login")
    private let passwordTextField = LoginTextField(placeholder: "Create your password")
    
    private let saveButton = SaveButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupLayout()
    }
    
    //MARK: - Private methods
    
    /// Метод для регистрации пользователя (сохраняет логин и пароль в UserDefaults)
    @objc private func saveButtonTapped() {
        
        let login = loginTextField.text ?? ""
        let password = passwordTextField.text ?? ""
       
        guard login != "" && password != "" else { return }
        UserDefaults.standard.set(login, forKey: "Login")
        UserDefaults.standard.set(password, forKey: "Password")
        navigationController?.popViewController(animated: true)
      }
    
    ///Настраивает UI элементы на экране
    private func setupViews() {
        view.backgroundColor = #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)
        view.addSubview(stackView)
        stackView.axis = .vertical
        stackView.spacing = 10
        
        stackView.addArrangedSubview(loginTextField)
        stackView.addArrangedSubview(passwordTextField)
        stackView.addArrangedSubview(saveButton)
        
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
    }
    
    /// Настраивает констрейнты элементов на экране
    private func setupLayout() {
        stackView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin).offset(270)
            make.left.right.equalToSuperview()
        }
        
        loginTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.leading.equalToSuperview().offset(50)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailingMargin).offset(-50)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.leading.equalToSuperview().offset(50)
            make.trailing.equalToSuperview().offset(-50)
        }
        
        saveButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.leading.equalToSuperview().offset(80)
            make.trailing.equalToSuperview().offset(-80)
        }
    }
}
