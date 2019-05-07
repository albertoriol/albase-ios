//
//  Created by Albert Oriol
//  Copyright © 2019 Albert. All rights reserved.
//

import Foundation
import UIKit

struct AppStyle {
    
    static func apply() {
        UINavigationBar.appearance().barStyle            = UIBarStyle.black
        UINavigationBar.appearance().barTintColor        = .primary
        UINavigationBar.appearance().tintColor           = .neutralWhite
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.neutralWhite]

        UITabBar.appearance().tintColor = .primary
    }
}
