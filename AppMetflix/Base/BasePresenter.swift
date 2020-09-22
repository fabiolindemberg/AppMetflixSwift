//
//  BasePresenter.swift
//  Madeinweb
//
//  Created by Alberto Lourenço on 03/01/19.
//  Copyright © 2019 Madeinweb. All rights reserved.
//

import UIKit

//-----------------------------------------------------------------------
//  MARK: - Presenter Delegate
//-----------------------------------------------------------------------

protocol BasePresenterDelegate {
    func message(message: String?, type: MessageType)
    func loading(_ loading: Bool)
}

//  Making methods optionals

extension BasePresenterDelegate {
    func message(message: String?, type: MessageType) {}
    func loading(_ loading: Bool) {}
}

//-----------------------------------------------------------------------
//  MARK: - Presenter
//-----------------------------------------------------------------------

class BasePresenter {
    
    var view: UIViewController!
    var router: BaseRouter!
    
    func closeView() {
        self.router.dismiss()
    }
}
