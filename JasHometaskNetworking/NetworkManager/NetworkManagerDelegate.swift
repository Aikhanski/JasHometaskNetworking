//
//  NetworkManagerDelegate.swift
//  JasHometaskNetworking
//
//  Created by Mac on 08.11.2022.
//

import UIKit

protocol NetworkManagerDelegate {
    func onHeroesDidUpdate(with heroes: [HeroesStats])
}
