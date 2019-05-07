//
//  Created by Albert Oriol
//  Copyright © 2019 Albert. All rights reserved.
//

import Foundation

extension String {
    
    public func localized() -> String {
        return NSLocalizedString(self, comment: "")
    }
}
