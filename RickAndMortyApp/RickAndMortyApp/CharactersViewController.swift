//
//  CharactersViewController.swift
//  RickAndMortyApp
//
//  Created by Русинов Евгений on 16.11.2023.
//

import UIKit
import SnapKit


/**
   Класс для  отображения списка всех персонажей Rick and Morty (имя, гендер, изображение, статус (жив или мертв))
 */

final class CharactersViewController: UIViewController {
    
    //MARK: - Private properties
    
    private var tableView = UITableView()
    private var charactersData: [Result] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupLayout()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 60
        tableView.register(CharacterCustomTableViewCell.self, forCellReuseIdentifier: CharacterCustomTableViewCell.identifier)
        NetworkManager.shared.getData { [weak self] values in
            DispatchQueue.main.async {
                guard let self else { return }
                self.charactersData = values
                self.tableView.reloadData()
            }
            
        }
    }
    
    //MARK: - Private methods
    
    ///Настраивает UI элементы на экране
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(tableView)
    }
    
    /// Настраивает констрейнты элементов на экране
    private func setupLayout() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension CharactersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return charactersData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CharacterCustomTableViewCell.identifier) as! CharacterCustomTableViewCell
        let character = charactersData[indexPath.row]
        cell.nameOfCharacter.text = character.name
        cell.gengerOfCharacter.text = character.gender.rawValue
        cell.statusOfCharacter.text = character.status.rawValue
        switch cell.statusOfCharacter.text {
            case "Alive": cell.statusOfCharacter.textColor = .green
            case "Dead":  cell.statusOfCharacter.textColor = .red
            default: cell.statusOfCharacter.textColor = .blue
        }
        
        
        if let imageURL = URL(string: character.image) {
                NetworkManager.shared.downloadImage(from: imageURL) { image in
                    DispatchQueue.main.async {
                        if let image = image {
                            cell.characterImage.image = image
                        } else {
                            print("Error loading image from URL.")
                        }
                    }
                }
        }
        return cell
    }    
}

extension CharactersViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let episodesViewController = EpisodesViewController()
        episodesViewController.episodes = charactersData[indexPath.row].episode
        episodesViewController.name = charactersData[indexPath.row].name
        
        navigationController?.pushViewController(episodesViewController, animated: true)
    }
}
