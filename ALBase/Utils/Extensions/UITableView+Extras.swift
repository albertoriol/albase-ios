//
//  Created by Albert Oriol
//  Copyright © 2019 Albert. All rights reserved.
//

import UIKit

extension UITableView {

    public func dequeueReusableCell<T>() -> T {
        let identifier = String(describing: T.self)
        if let cell = dequeueReusableCell(withIdentifier: identifier) as? T {
            return cell
        }
        fatalError("Invalid cell '\(identifier)'")
    }

    public func register(_ cellClass: Swift.AnyClass) {
        let identifier = String(describing: cellClass.self)
        register(cellClass, forCellReuseIdentifier: identifier)
    }
}
