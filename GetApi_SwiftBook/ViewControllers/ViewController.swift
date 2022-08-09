//
//  ViewController.swift
//  GetApi_SwiftBook
//
//  Created by Сергей Бабич on 09.08.2022.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Outlets
    
    @IBOutlet weak var getDataButton: UIButton!
    
    // MARK: - Private properties
    
    private let link = "https://www.fruityvice.com/api/fruit/all"

    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Private methods
    
    private func successAlert() {
        DispatchQueue.main.async {
            let alert = UIAlertController(
                title: "Success",
                message: "You can see the data in the debug menu",
                preferredStyle: .alert
            )
            
            let okAction = UIAlertAction(title: "OK", style: .default)
            alert.addAction(okAction)
            self.present(alert, animated: true)
        }
    }
    
    private func failedAlert() {
        DispatchQueue.main.async {
            let alert = UIAlertController(
                title: "Failed",
                message: "You can see error in the debug menu",
                preferredStyle: .alert
            )
            
            let okAction = UIAlertAction(title: "OK", style: .default)
            alert.addAction(okAction)
            self.present(alert, animated: true)
        }
    }

    // MARK: - Actions
    
    @IBAction func getDataButtonDidTap(_ sender: Any) {
        getData()
    }
}

// MARK: - Networking
extension ViewController {
    private func getData() {
        guard let url = URL(string: link) else { return }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let fruits = try JSONDecoder().decode([Fruit].self, from: data)
                print(fruits)
                self?.successAlert()
            } catch {
                self?.failedAlert()
                print(error)
            }
            
        }.resume()
    }
}
