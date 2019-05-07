//
//  Created by Albert Oriol
//  Copyright © 2019 Albert. All rights reserved.
//

import UIKit

extension UIView {
    
    func contentCompression(_ axis: NSLayoutConstraint.Axis) {
        self.setContentCompressionResistancePriority(.required, for: axis)
        self.setContentHuggingPriority(.required, for: axis)
    }
}
