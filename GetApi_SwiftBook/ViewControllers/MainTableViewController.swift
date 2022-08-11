//
//  MainTableViewController.swift
//  GetApi_SwiftBook
//
//  Created by Сергей Бабич on 11.08.2022.
//

import UIKit

class MainTableViewController: UITableViewController {
    // MARK: - Outlets
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - Private properties
    
    private let link = "https://www.fruityvice.com/api/fruit/all"
    private var fruits: [Fruit] = []

    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
        getData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruits.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "fruit", for: indexPath)
        var content = cell.defaultContentConfiguration()
        let fruit = fruits[indexPath.row]
        
        content.attributedText?.size()
        content.attributedText = NSAttributedString(string: fruit.name)
        content.secondaryAttributedText = NSAttributedString(string: fruit.family)
        cell.contentConfiguration = content

        return cell
    }

    // MARK: - Navigation
     
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        guard let detailVC = segue.destination as? DetailViewController else { return }
        detailVC.title = fruits[indexPath.row].name
        detailVC.fruit = fruits[indexPath.row]
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

}

// MARK: - Networking
extension MainTableViewController {
    private func getData() {
        NetworkManager.shared.getAllFruits([Fruit].self, from: link) { [weak self] result in
            switch result {
            case .success(let fruitsData):
                self?.fruits.append(contentsOf: fruitsData)
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                    self?.activityIndicator.stopAnimating()
                }
            case .failure(let error):
                print(error)
                self?.failedAlert()
            }
        }
    }
}
