//
//  BaseRouter.swift
//  Madeinweb
//
//  Created by Alberto Lourenço on 03/01/19.
//  Copyright © 2019 Madeinweb. All rights reserved.
//

import UIKit
//import MZFormSheetPresentationController

class BaseRouter {
    
    static var homeBaseViewController: HomeTableViewController?
    var viewController: UIViewController!
    var presentationStyles: Array<PresentationStyle> = []
    
    //-----------------------------------------------------------------------
    //  MARK: - Mount root view
    //-----------------------------------------------------------------------
    
    func getRootView() -> UIViewController {

//        var controller: UIViewController!
        
        
        
        return HomeRouter.shared.getRootView()
    }
    
    //-----------------------------------------------------------------------
    //  MARK: - Present views
    //-----------------------------------------------------------------------
    
    func show() {
        
        presentationStyles.append(.push)
        
        UIApplication.topViewController()?.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func present(transition: UIModalTransitionStyle = .coverVertical) {
        
        presentationStyles.append(.modal)
        
        viewController.modalTransitionStyle = transition
        
        if transition == .crossDissolve {
            
            viewController.modalPresentationStyle = .overFullScreen
            
            UIApplication.topViewController()?.present(viewController, animated: true, completion: nil)
        }else{
            
            let navigationVC = UINavigationController(rootViewController: viewController)
            navigationVC.isNavigationBarHidden = false
            navigationVC.modalPresentationStyle = .fullScreen
            
            UIApplication.topViewController()?.present(navigationVC, animated: true, completion: nil)
        }
    }
    
    func popup(controller: UIViewController, size: CGSize = .zero) {
        
//        presentationStyles.append(.modal)
//
//        var popupSize: CGSize!
//
//        if size == .zero {
            
//            if UIDevice().screenModel() == .iPad {
//                popupSize = CGSize(width: 460, height: 680)
//            }else{
//                let screenSize = UIScreen.main.bounds.size
//                popupSize = CGSize(width: (screenSize.width - 20), height: (screenSize.height - 40))
//            }
//        }else{
//            popupSize = size
//        }
        
//        let formSheetController = MZFormSheetPresentationViewController(contentViewController: controller)
//
//        formSheetController.contentViewControllerTransitionStyle = .bounce
//        formSheetController.presentationController?.contentViewSize = popupSize
//        formSheetController.presentationController?.movementActionWhenKeyboardAppears = .moveToTop
//        formSheetController.presentationController?.shouldCenterVertically = true
//        formSheetController.presentationController?.blurEffectStyle = .dark
//        formSheetController.presentationController?.shouldApplyBackgroundBlurEffect = true
//        formSheetController.presentationController?.shouldDismissOnBackgroundViewTap = true
//
//        UIApplication.topViewController()?.present(formSheetController, animated: true, completion: nil)
    }
    
    //-----------------------------------------------------------------------
    //  MARK: - Dismiss views
    //-----------------------------------------------------------------------
    
    func dismiss() {
        
        if let lastTransition = presentationStyles.last {
            
            if lastTransition == .push {
                viewController.navigationController?.popViewController(animated: true)
            }else{
                viewController.dismiss(animated: true, completion: nil)
            }
            
            presentationStyles.removeLast()
        }
    }
}
