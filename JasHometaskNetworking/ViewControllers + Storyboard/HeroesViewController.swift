//
//  HeroesViewController.swift
//  JasHometaskNetworking
//
//  Created by Mac on 07.11.2022.
//

import UIKit

class HeroesViewController: UIViewController {
    
    var hero: HeroesStats?
    
    @IBOutlet private weak var heroImageView: UIImageView!
    @IBOutlet private weak var heroNameLbl: UILabel!
    @IBOutlet private weak var heroLegsLbl: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        heroNameLbl.text = hero?.localized_name
        heroLegsLbl.text = "\((hero?.legs)!)"
        
    }

}
