//
//  Created by Albert Oriol
//  Copyright © 2019 Albert. All rights reserved.
//

import Foundation
import UIKit

extension UIApplication {
    
    public func topMostViewController() -> UIViewController? {
        return keyWindow?.rootViewController?.topMostViewController()
    }
}
