//
//  BaseViewController.swift
//  Madeinweb
//
//  Created by Alberto Lourenço on 03/01/19.
//  Copyright © 2019 Madeinweb. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
	
    var baseRouter = BaseRouter()
    var basePresenter = BasePresenter()
        
    @IBOutlet var constraintHeightNavbar: NSLayoutConstraint?
    
	//-----------------------------------------------------------------------
	//	MARK: - UIViewController
	//-----------------------------------------------------------------------
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
        self.navigationController?.navigationBar.isHidden = true
        
//        if UIDevice.shared.screenModel() == .iPhone_X ||
//            UIDevice.shared.screenModel() == .iPhone_X_Max {
//            self.constraintHeightNavbar?.constant = 100
//        }else{
//            self.constraintHeightNavbar?.constant = 80
//        }
        
//        NotificationCenter.default.addObserver(self,
//                                               selector: #selector(themeChanged),
//                                               name: Constants.Notification.ThemeUpdated,
//                                               object: nil)
//
//        if Preferences.themeMode == .dark {
//            self.configDarkMode()
//        }
	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		
	}
	
	override func viewDidDisappear(_ animated: Bool) {
		super.viewDidDisappear(animated)
        
        NotificationCenter.default.removeObserver(self)
	}
    
    //-----------------------------------------------------------------------
    //  MARK: - AppNavbar Delegate
    //-----------------------------------------------------------------------
    
    func navbarLeftButtonTapped() {}
    
    func navbarRightButtonTapped() {}
    
    //-----------------------------------------------------------------------
    //  MARK: Custom methods
    //-----------------------------------------------------------------------
    
    func configDarkMode() {
        
//        self.vwNavbar?.tintTitle = .white
//        self.vwNavbar?.backgroundColor = Preferences.defaultBackgroundColor.lighter(by: 15)
//        
//        self.view.backgroundColor = Preferences.defaultBackgroundColor
    }
    
    @objc func themeChanged() {
        
//        self.view.backgroundColor = Preferences.defaultBackgroundColor
//        
//        self.configDarkMode()
    }
}
