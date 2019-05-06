//
//  ViewController.swift
//  iOS-with-Cicerone
//
//  Created by Nikita Shmatov on 11/04/2019.
//  Copyright © 2019 Intec. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let router = CommonRouter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        router.setViewController(viewController: self)
        // Do any additional setup after loading the view.
    }

    @IBAction func goToSecond(_ sender: Any) {
        router.routeToScreen(with: .second, data: nil)
    }
    
}

