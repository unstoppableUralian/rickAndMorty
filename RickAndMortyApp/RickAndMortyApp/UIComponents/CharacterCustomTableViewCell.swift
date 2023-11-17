//
//  CustomTableViewCell.swift
//  RickAndMortyApp
//
//  Created by Русинов Евгений on 17.11.2023.
//

import UIKit
import SnapKit

/**
   Ячейка для таблицы со списком персонажей
 */

class CharacterCustomTableViewCell: UITableViewCell {
    
    static let identifier = "CustomTableViewCell"
    
    var nameOfCharacter: UILabel = {
        let label = UILabel()
        return label
    }()
    
    var statusOfCharacter: UILabel = {
        let label = UILabel()
        return label
    }()
    
    var gengerOfCharacter: UILabel = {
        let label = UILabel()
        return label
    }()
    
    var characterImage: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 35
        image.clipsToBounds = true
        return image
    }()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// Настройка UI  кастомной ячейки для списка персонажей
    private func setupViews() {
        contentView.addSubview(nameOfCharacter)
        contentView.addSubview(statusOfCharacter)
        contentView.addSubview(gengerOfCharacter)
        contentView.addSubview(characterImage)
        
    }
    
    /// Настраивает констрейнты элементов на экране
    private func setupLayout() {
        characterImage.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(10)
            make.bottom.equalToSuperview()
            make.height.equalTo(60)
            make.width.equalTo(60)
        }
        
        nameOfCharacter.snp.makeConstraints { make in
            make.leading.equalTo(characterImage.snp.trailing).offset(20)
        }
        
        gengerOfCharacter.snp.makeConstraints { make in
            make.left.equalTo(nameOfCharacter.snp.left)
            make.top.equalTo(nameOfCharacter.snp.bottom)
        }
        
        statusOfCharacter.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-10)
        }
    }
}
