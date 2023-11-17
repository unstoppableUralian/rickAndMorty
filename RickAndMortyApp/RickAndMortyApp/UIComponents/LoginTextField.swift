//
//  LoginTextField.swift
//  RickAndMortyApp
//
//  Created by Русинов Евгений on 16.11.2023.
//


import UIKit
import SnapKit

/**
    TextField для ввода логина и пароля
 */

final class LoginTextField: UITextField {
    
    private let padding = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 40)
    
    init(placeholder: String) {
        super.init(frame: .zero)
        setupTextField(placeholder: placeholder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }
    
    /// Настройка кастомного TextField для ввода логина и пароля
    private func setupTextField(placeholder: String) {
        textColor = .white
        layer.cornerRadius = 30
        layer.backgroundColor = #colorLiteral(red: 0.8446564078, green: 0.5145705342, blue: 1, alpha: 1)
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 7
        layer.shadowOpacity = 0.4
        layer.shadowOffset = CGSize(width: 15, height: 15)
        
        attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        font = .boldSystemFont(ofSize: 18)
        
        snp.makeConstraints { make in
            make.height.equalTo(60)
        }
    }
}

