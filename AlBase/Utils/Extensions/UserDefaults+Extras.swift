//
//  Created by Albert Oriol
//  Copyright © 2019 Albert. All rights reserved.
//

import UIKit

extension UserDefaults {
    
    private struct Keys {
        static let gnomeListFilters = "gnomeListFilters"
    }
    
    // MARK: - Getting and setting User Defaults
    
    class var gnomeListFilters: [String] {
        return UserDefaults.standard.stringArray(forKey: UserDefaults.Keys.gnomeListFilters) ?? []
    }
    class func set(gnomeListFilters: [String]) {
        UserDefaults.standard.set(gnomeListFilters, forKey: UserDefaults.Keys.gnomeListFilters)
    }
}
