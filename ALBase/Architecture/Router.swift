//
//  Created by Albert Oriol
//  Copyright © 2019 Albert. All rights reserved.
//

import Foundation
import UIKit

public protocol Router {
    var viewController: UIViewController? { get set }
}

extension Router {

    public func show(animated: Bool = true) {
        if let viewController = viewController {
            if let controller = UIApplication.shared.topMostViewController() {
                controller.findNavigationController()?.pushViewController(viewController, animated: animated)
            }
        }
    }

    public func present(animated: Bool = true, style: UIModalPresentationStyle = .fullScreen) {
        if let viewController = viewController {
            if let controller = UIApplication.shared.topMostViewController() {
                let nav = UINavigationController(rootViewController: viewController)
                nav.modalPresentationStyle = style
                controller.present(nav, animated: animated)
            }
        }
    }

    public func assingAsRootViewController(window: inout UIWindow?, embededInUINavigationController: Bool = false) {
        if window == nil {
            window = UIWindow(frame: UIScreen.main.bounds)
        }
        if embededInUINavigationController {
            window?.rootViewController = UINavigationController.init(rootViewController: viewController!)
        } else {
            window?.rootViewController = viewController
        }
        window?.makeKeyAndVisible()
    }

    public func dismiss(animated: Bool = true, completion: (() -> ())? = nil) {
        UIApplication.shared.topMostViewController()?.navigationController?
            .dismiss(animated: animated, completion: {
            completion?()
        })
    }

    public func popViewController(animated: Bool = true) {
        viewController?.navigationController?.popViewController(animated: animated)
    }
}
