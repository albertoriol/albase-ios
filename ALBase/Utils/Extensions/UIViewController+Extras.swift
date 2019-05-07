//
//  Created by Albert Oriol
//  Copyright © 2019 Albert. All rights reserved.
//

import UIKit
import KRProgressHUD

extension UIViewController {
    
    public func topMostViewController() -> UIViewController {
        guard let presentedViewController = presentedViewController else {
            return self
        }
        if let navigation = presentedViewController as? UINavigationController,
            let visibleViewController = navigation.visibleViewController {
            return visibleViewController.topMostViewController()
        }
        if let tab = presentedViewController as? UITabBarController {
            if let selectedTab = tab.selectedViewController {
                return selectedTab.topMostViewController()
            }
            return tab.topMostViewController()
        }
        return presentedViewController.topMostViewController()
    }

    public func findNavigationController() -> UINavigationController? {
        if self is UINavigationController {
            return self as? UINavigationController
        }
        if let navBar = navigationController {
            return navBar
        } else {
            for childController in children where childController is UINavigationController {
                return childController as? UINavigationController
            }
        }
        return nil
    }
    
    func showMessageAlert(title: String? = nil, message: String, action: UIAlertAction? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let actionAlert = action ?? UIAlertAction(title: "general_ok".localized(), style: .default) {
            (result: UIAlertAction) -> Void in
            alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(actionAlert)
        
        present(alert, animated: true, completion: nil)
    }
    
    func showMessage(message: String) {
        DispatchQueue.main.async {
            KRProgressHUD.show(withMessage: message)
        }
    }
    
    func showLoadingHUD() {
        DispatchQueue.main.async {
            KRProgressHUD.show()
        }
    }
    
    func dismissLoadingHUD() {
        DispatchQueue.main.async {
            KRProgressHUD.dismiss()
        }
    }
}
