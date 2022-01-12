//
//  ViewController.swift
//  CocktailRecipes
//
//  Created by Vlad Ryabtsev on 09.01.2022.
//

import UIKit

class MainViewController: UICollectionViewController {
    
    // MARK: - Private Properties
    private var drinksArray: Drink?
    
    // MARK: - UIViewController Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData(from: Link.cocktailsApi.rawValue)
    }
    
    // MARK: - UICollectionViewDataSource  
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        drinksArray?.drinks.count ?? 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        
        cell.nameLabel.text = drinksArray?.drinks[indexPath.item].strDrink
        
        return cell
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = collectionView.indexPathsForSelectedItems?.first else { return }
        let drink = drinksArray?.drinks[indexPath.item]
        let detailVC = segue.destination as! DetailViewController
        detailVC.drinks = drink
    }
    
    // MARK: - Private methods
    private func fetchData(from url: String?) {
        NetworkManager.shared.fetchData(from: url) { drink in
            self.drinksArray = drink
            self.collectionView.reloadData()
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width - 48, height: 50)
    }
}
