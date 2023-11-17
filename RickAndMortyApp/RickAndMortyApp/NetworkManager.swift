//
//  NetworkManager.swift
//  RickAndMortyApp
//
//  Created by Русинов Евгений on 17.11.2023.
//

import UIKit

/**
   Класс для  работы с API
 */

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private let urlString = "https://rickandmortyapi.com/api/character"
    
    ///Метод для получения данных API
    func getData(completionHandler: @escaping ([Result]) -> Void) {
        let url = URL(string: urlString)!
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) {data, response, error in
            guard let data, error == nil else { return }
            if let charactersData = try? JSONDecoder().decode(Character.self, from: data) {
                completionHandler(charactersData.results)
            }
        }
        task.resume()
    }
    
    ///Метод для загрузки изображений с сервера
    func downloadImage(from url: URL, completion: @escaping (UIImage?) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error downloading image: \(error)")
                completion(nil)
                return
            }
            
            guard let data = data, let image = UIImage(data: data) else {
                print("Invalid data or unable to create UIImage from downloaded data.")
                completion(nil)
                return
            }
            
            completion(image)
        }.resume()
    }
}


