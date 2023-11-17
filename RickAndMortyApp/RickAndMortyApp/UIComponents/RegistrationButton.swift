//
//  RegistrationButton.swift
//  RickAndMortyApp
//
//  Created by Русинов Евгений on 16.11.2023.
//

import UIKit
import SnapKit

/**
   Кнопка для перехода на экран регистрации 
 */

final class RegistrationButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// Настройка кастомной кнопки для перехода на экран регистрации
    private func setupButton() {
        setTitle("Don't have an account yet?", for: .normal)
        titleLabel?.font = UIFont(name: "Helvetica-Bold", size: 16)
        setTitleColor(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1), for: .normal)
        snp.makeConstraints { make in
            make.height.equalTo(60)
        }
    }
    
}
