//
//  Created by Albert Oriol
//  Copyright © 2019 Albert. All rights reserved.
//

import Foundation
import UIKit

class GnomeDetailRouter: Router {

    var viewController: UIViewController?

    init(gnome: Gnome) {
        let vc = GnomeDetailViewController()
        let presenter = GnomeDetailPresenter(gnome: gnome, output: vc)
        vc.presenter = presenter
        
        viewController = vc
    }
}
