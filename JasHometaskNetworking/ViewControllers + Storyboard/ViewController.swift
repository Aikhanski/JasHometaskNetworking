//
//  ViewController.swift
//  JasHometaskNetworking
//
//  Created by Mac on 07.11.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var heros = [HeroesStats]()
    var networkManager = NetworkManager()
    
    @IBOutlet private weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        settingUpTableViewDelegates()
        networkManager.downloadHeroesInfo { hero in
            self.heros = hero
            self.tableView.reloadData()
        }
        networkManager.delegate = self
    }
    
    func settingUpTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }

}

// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heros.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = heros[indexPath.row].localized_name
        cell.contentConfiguration = content
        return cell
    }
}

// MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetails", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? HeroesViewController {
            destination.hero = heros[tableView.indexPathForSelectedRow!.row]
        }
    }
    
}

extension ViewController: NetworkManagerDelegate {
    func onHeroesDidUpdate(with heros: [HeroesStats]) {
       // self.heros = heros
    }
}
