//
//  NetworkManager.swift
//  CocktailRecipes
//
//  Created by Vlad Ryabtsev on 09.01.2022.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchData(from url: String?, with completion: @escaping (Drink) -> Void) {
        guard let url = URL(string: url ?? "") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            do {
                let drink = try JSONDecoder().decode(Drink.self, from: data)
                DispatchQueue.main.async {
                    completion(drink)
                }
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()  
    }
}

class ImageManager {
    static let shared = ImageManager()
    
    private init () {}
    
    func fetchImage(from url: String?) -> Data? {
        guard let stringURL = url else { return nil }
        guard let imageURL = URL(string: stringURL) else { return nil }
        return try? Data(contentsOf: imageURL)
    }
    
}



