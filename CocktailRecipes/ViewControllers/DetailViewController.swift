//
//  DetailViewController.swift
//  CocktailRecipes
//
//  Created by Vlad Ryabtsev on 12.01.2022.
//

import UIKit

class DetailViewController: UIViewController {
     
    // MARK: - IBOutlets
    @IBOutlet var imageOutlet: UIImageView! {
        didSet {
            imageOutlet.layer.cornerRadius = 10
        }
    }
    
    @IBOutlet var descriptionLabel: UILabel! 
    @IBOutlet var ingredientsLabel: UILabel!
    
    // MARK: - Public properties
   var drinks: Recipes!
    
    // MARK: - UIViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()
                
        setupLabels(for: descriptionLabel, ingredientsLabel)
        
        DispatchQueue.global().async {
            guard let imageData = ImageManager.shared.fetchImage(from: self.drinks.strDrinkThumb) else { return }
            DispatchQueue.main.async {
                self.imageOutlet.image = UIImage(data: imageData)
            }
        }
    }
    
    // MARK: - Private methods
    private func setupLabels(for labels: UILabel...) {
        labels.forEach { label in
            switch label {
            case descriptionLabel:
                descriptionLabel.text = drinks.description
                descriptionLabel.layer.masksToBounds = true
                descriptionLabel.layer.cornerRadius = 10
            default:
                ingredientsLabel.text = drinks.ingredients
                ingredientsLabel.layer.masksToBounds = true
                ingredientsLabel.layer.cornerRadius = 10
            }
        }
    }
}
