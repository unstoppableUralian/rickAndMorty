//
//  SaveButton.swift
//  RickAndMortyApp
//
//  Created by Русинов Евгений on 16.11.2023.
//

import UIKit
import SnapKit

/**
   Кнопка для регистрации пользователя 
 */

final class SaveButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// Настройка кастомной кнопки для сохранения логина и пароля (регистрации пользователя)
    private func setupButton() {
        backgroundColor = .purple
        setTitle("Save", for: .normal)
        titleLabel?.font = UIFont(name: "Helvetica-Bold", size: 16)
        setTitleColor(.white, for: .normal)
        layer.cornerRadius = 30
        snp.makeConstraints { make in
            make.height.equalTo(60)
        }
    }
}
