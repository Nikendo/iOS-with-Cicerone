//
//  CommonRouter.swift
//  iOS-with-Cicerone
//
//  Created by Nikita Shmatov on 14/04/2019.
//  Copyright © 2019 Intec. All rights reserved.
//

import Foundation
import UIKit

class CommonRouter: RoutingLayer {
    
    
    
    override func routeToScreen(with key: ScreenKey, data: Any?) {
        var destinationVC: UIViewController? = nil
        
        switch key {
        case .second:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            destinationVC = storyboard.instantiateViewController(withIdentifier: ScreenKey.second.rawValue)
        default:
            break
        }
        
        guard let destination = destinationVC
            else { return }
        guard let source = viewController
            else { return }
        
        source.navigationController?.pushViewController(destination, animated: false)
    }
    
    override func presentScreen(with key: ScreenKey, data: Any?) {
        switch key {
        case .second:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let keyAddVC = storyboard.instantiateViewController(withIdentifier: ScreenKey.second.rawValue) as! SecondVC
            viewController?.present(keyAddVC, animated: true, completion: nil)
        default:
            break
        }
    }
    
}
