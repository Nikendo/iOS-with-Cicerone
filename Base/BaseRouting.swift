//
//  BaseRouting.swift
//  iOS-with-Cicerone
//
//  Created by Nikita Shmatov on 11/04/2019.
//  Copyright © 2019 Intec. All rights reserved.
//

import Foundation
import UIKit

protocol BaseRouting {
    func setViewController(viewController: UIViewController)
    func routeToScreen(with key: ScreenKey, data: Any?)
    func presentScreen(with key: ScreenKey, data: Any?)
    func exit()
}

class RoutingLayer: NSObject, BaseRouting {
    weak var viewController: UIViewController?
    
    func setViewController(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func routeToScreen(with key: ScreenKey, data: Any?) {
        
    }
    
    func presentScreen(with key: ScreenKey, data: Any?) {
        
    }
    
    func exit() {
        if (isModal()) {
            viewController?.dismiss(animated: true, completion: nil)
        } else {
            viewController?.navigationController?.popViewController(animated: true)
        }
    }
    
    func isModal() -> Bool {
        guard let strongVC = viewController else { return true }
        
        if let navigationController = strongVC.navigationController {
            if navigationController.viewControllers.first != strongVC {
                return false
            }
        }
        
        if strongVC.presentingViewController != nil {
            return true
        }
        
        if strongVC.navigationController?.presentingViewController?.presentedViewController == strongVC.navigationController {
            return true
        }
        
        if strongVC.tabBarController?.presentingViewController is UITabBarController {
            return true
        }
        
        return false
    }
    
}
