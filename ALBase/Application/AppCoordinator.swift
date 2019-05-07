//
//  Created by Albert Oriol
//  Copyright © 2019 Albert. All rights reserved.
//

import Foundation
import UIKit

class AppCoordinator {
    
    func loadInitialRootViewController() {
        AppDelegate.main().window?.rootViewController = UINavigationController(rootViewController: GnomeListRouter().viewController!)
    }
}
