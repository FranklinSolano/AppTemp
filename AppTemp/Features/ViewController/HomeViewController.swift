//
//  ViewController.swift
//  AppTemp
//
//  Created by Franklin  Stilhano Solano on 16/04/25.
//

import UIKit

class HomeViewController: UIViewController {

    var screen: HomeScreen?
    
    override func loadView() {
        screen = HomeScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}

