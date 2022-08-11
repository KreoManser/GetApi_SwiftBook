//
//  DetailViewController.swift
//  GetApi_SwiftBook
//
//  Created by Сергей Бабич on 11.08.2022.
//

import UIKit

class DetailViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var descriptionFruitLabel: UILabel!
    
    // MARK: - Properties
    
    var fruit: Fruit!
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionFruitLabel.text = """
        Family: \(fruit.family)
        Genus: \(fruit.genus)
        
        Nutritions:
        carbohydrates: \(fruit.nutritions.carbohydrates)
        protein: \(fruit.nutritions.protein)
        fat: \(fruit.nutritions.fat)
        calories: \(fruit.nutritions.calories)
        sugar: \(fruit.nutritions.sugar)
        """
    }
}
