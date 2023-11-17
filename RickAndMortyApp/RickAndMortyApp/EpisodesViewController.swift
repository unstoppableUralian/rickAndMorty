//
//  EpisodesViewController.swift
//  RickAndMortyApp
//
//  Created by Русинов Евгений on 16.11.2023.
//

import UIKit

/**
   Класс для  списка эпизодов с появлением  выбранного персонажа
 */

final class EpisodesViewController: UIViewController {
    
    private var tableView = UITableView()
    
    var episodes: [String] = []
    var name: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupLayout()
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        navigationItem.title = name
    }
    
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

extension EpisodesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        episodes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        let episode = episodes[indexPath.row]
        cell.textLabel?.text = episode
        cell.textLabel?.numberOfLines = 2
        return cell
    }
}
