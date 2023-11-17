//
//  LogOutViewController.swift
//  RickAndMortyApp
//
//  Created by Русинов Евгений on 16.11.2023.
//

import UIKit
import SnapKit

/**
   Класс для  обработки выхода пользователя из приложения
 */

final class LogOutViewController: UIViewController {
    
    private let logOutButton = LogOutButton()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupLayout()
    }
    
    ///Метод для удаления флага авторизации пользователя из UserDefault и перенаправление его на экран авторизации
    @objc private func logOutButtonTapped() {
        let toLogin = LoginViewController()
        navigationController?.pushViewController(toLogin, animated: true)
        UserDefaults.standard.removeObject(forKey: "Auth")
    }
    
    ///Настраивает UI элементы на экране
    private func setupViews() {
        view.backgroundColor = #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)
        view.addSubview(logOutButton)
        logOutButton.addTarget(self, action: #selector(logOutButtonTapped), for: .touchUpInside)
    }
    
    ///Настраивает констрейнты элементов на экране
    private func setupLayout() {
        logOutButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalTo(150)
            make.width.equalTo(150)
        }
    }
}
