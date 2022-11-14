//
//  NetworkManager.swift
//  JasHometaskNetworking
//
//  Created by Mac on 07.11.2022.
//

import UIKit

struct NetworkManager {
    
    var delegate : NetworkManagerDelegate?
    
    func downloadHeroesInfo(completionHandler: @escaping ([HeroesStats]) -> Void) {
        guard let url = URL(string: "https://api.opendota.com/api/heroStats") else { return }
        let urlRequest = URLRequest(url: url)
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            } else {
                guard let data = data else { return }
                do {
                    let decoder = JSONDecoder()
                    let heros = try decoder.decode([HeroesStats].self, from: data )
                    
                    DispatchQueue.main.async {
                        completionHandler(heros)
                        delegate?.onHeroesDidUpdate(with: heros)
                    }
                } catch {
                    print(error.localizedDescription)
                }
                
            }
        }
        task.resume()
    }
}
