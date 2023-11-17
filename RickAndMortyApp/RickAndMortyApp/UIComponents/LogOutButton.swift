//
//  LogOutButton.swift
//  RickAndMortyApp
//
//  Created by Русинов Евгений on 17.11.2023.
//

import UIKit
import SnapKit

/**
   Кнопка логаута из приложения
 */

final class LogOutButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// Настройка кастомной кнопки логаута
    private func setupButton() {
        backgroundColor = .purple
        setTitle("LogOut", for: .normal)
        titleLabel?.font = UIFont(name: "Helvetica-Bold", size: 16)
        setTitleColor(.white, for: .normal)
        layer.cornerRadius = 30
    }
}
