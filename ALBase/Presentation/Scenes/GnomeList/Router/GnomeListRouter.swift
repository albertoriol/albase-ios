//
//  Created by Albert Oriol
//  Copyright © 2019 Albert. All rights reserved.
//

import Foundation
import UIKit

class GnomeListRouter: Router, GnomeListPresenterRouter {

    var viewController: UIViewController?

    init() {
        let vc = GnomeListViewController()
        let interactor = GnomeListInteractor()
        let presenter = GnomeListPresenter(router: self, interactor: interactor, output: vc)
        vc.presenter = presenter
        interactor.presenter = presenter
        
        viewController = vc
    }

    func showGnomeListFilter(gnomes: [Gnome]) {
        GnomeListFilterRouter(gnomes: gnomes).present()
    }

    func showGnomeDetail(gnome: Gnome) {
        GnomeDetailRouter(gnome: gnome).show()
    }
}
