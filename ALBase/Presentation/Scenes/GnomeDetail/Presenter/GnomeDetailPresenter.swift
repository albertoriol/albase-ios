//
//  Created by Albert Oriol
//  Copyright © 2019 Albert. All rights reserved.
//

import Foundation

protocol GnomeDetailPresenterOutput: BasePresenterOutput {    
}

class GnomeDetailPresenter: BasePresenter {

    public let output: GnomeDetailPresenterOutput
    var gnome: Gnome

    init(gnome: Gnome, output: GnomeDetailPresenterOutput) {
        self.gnome = gnome
        self.output = output
    }

    // MARK: - Lifecycle

    override func viewHasLoaded() {
        super.viewHasLoaded()

        output.setupView()
    }
    
    // MARK: - Methods
    
    func navigationBarTitle() -> String {
        return gnome.firstName()
    }
}
