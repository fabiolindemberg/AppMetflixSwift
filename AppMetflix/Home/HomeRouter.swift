//
//  HomeRouter.swift
//  Bíblia Fiel
//
//  Created by Alberto Lourenço on 1/31/20.
//  Copyright © 2020 Madeinweb. All rights reserved.
//
    
import UIKit

class HomeRouter: BaseRouter {
    
    static var shared = HomeRouter()
    
    let storyboard = UIStoryboard(name: "Home", bundle: nil)
    
    override init() {
        super.init()
        
        let vc = storyboard.instantiateViewController(withIdentifier: "HomeView")
        
        if let controller = vc as? HomeTableViewController {
            
            let presenter = HomePresenter(delegate: controller)
            controller.presenter = presenter
            controller.presenter.view = viewController
            controller.presenter.router = self
            
            viewController = controller
        }
    }
}
