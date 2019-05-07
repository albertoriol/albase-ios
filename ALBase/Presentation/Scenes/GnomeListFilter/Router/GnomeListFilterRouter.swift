//
//  Created by Albert Oriol
//  Copyright © 2019 Albert. All rights reserved.
//

import Foundation
import UIKit

class GnomeListFilterRouter: Router {

    var viewController: UIViewController?

    init(gnomes: [Gnome]) {
        let vc = GnomeListFilterViewController()
        let interactor = GnomeListFilterInteractor()
        let presenter = GnomeListFilterPresenter(gnomes: gnomes, interactor: interactor, output: vc)
        vc.presenter = presenter
        
        viewController = vc
    }
}
