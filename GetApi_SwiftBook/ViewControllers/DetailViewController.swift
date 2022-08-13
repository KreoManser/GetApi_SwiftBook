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
        
        Nutritions per 100 g:
        carbohydrates: \(fruit.nutritions.carbohydrates)g
        protein: \(fruit.nutritions.protein)g
        fat: \(fruit.nutritions.fat)g
        calories: \(fruit.nutritions.calories)g
        sugar: \(fruit.nutritions.sugar)g
        """
    }
}
