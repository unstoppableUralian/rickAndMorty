//
//  ViewController.swift
//  RickAndMortyApp
//
//  Created by Русинов Евгений on 14.11.2023.
//

import UIKit
import SnapKit

/**
   Класс для  авторизации (ввода логина и пароля) и в случае необходимости перехода на экран регистрации
 */

final class LoginViewController: UIViewController {
    
    //MARK: - Private properties
    
    private let stackView = UIStackView()
    
    private let loginTextField = LoginTextField(placeholder: "Enter your login")
    private let passwordTextField = LoginTextField(placeholder: "Enter your password")
    
    private let authButton = AuthButton()
    
    private let registrationButton = RegistrationButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupLayout()
        self.navigationItem.hidesBackButton = true
    }
    
    //MARK: - Private methods
    
    /// Метод проверяет хранится ли такой логин и пароль в UserDefault и если хранится перенаправляет на главный экран и сохраняет состояние авторизации в UserDefaults
    @objc private func authButtonTapped() {
        
        let login = loginTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        
        guard login != "" && password != "" else { return }
        guard UserDefaults.standard.string(forKey: "Login") == login && UserDefaults.standard.string(forKey: "Password") == password else { return }
        let mainTabBarController = MainTabBarController()
        UserDefaults.standard.set(true, forKey: "Auth")
        navigationController?.pushViewController(mainTabBarController, animated: true)
    }
    
    /// Метод перенаправляет на экран регистрации
    @objc private func registrationButtonTapped() {
          let registrationViewController = RegistrationViewController()
          navigationController?.pushViewController(registrationViewController, animated: true)
      }
        
    ///Настраивает UI элементы на экране
    private func setupViews() {
        view.backgroundColor = #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)
        view.addSubview(stackView)
        stackView.axis = .vertical
        stackView.spacing = 10
        
        stackView.addArrangedSubview(loginTextField)
        stackView.addArrangedSubview(passwordTextField)
        stackView.addArrangedSubview(authButton)
        stackView.addArrangedSubview(registrationButton)
        
        authButton.addTarget(self, action: #selector(authButtonTapped), for: .touchUpInside)
        registrationButton.addTarget(self, action: #selector(registrationButtonTapped), for: .touchUpInside)
        
    }
    
    /// Настраивает констрейнты элементов на экране
    private func setupLayout() {
        stackView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin).offset(270)
            make.left.right.equalToSuperview()
        }
        
        loginTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailingMargin).offset(-30)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
        }
        
        authButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.leading.equalToSuperview().offset(70)
            make.trailing.equalToSuperview().offset(-70)
        }
        
        registrationButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
        }
    }
}

