//
//  Created by Albert Oriol
//  Copyright © 2019 Albert. All rights reserved.
//

import Foundation

public protocol BasePresenterOutput: class {
    
    func setupView()
    func showLoading()
    func hideLoading()
    func showError(errorMessage: ErrorMessage)
}

public protocol LifeCycleDelegate: class {
    
    func viewHasLoaded()
    func viewIsAboutToAppear(_ animated: Bool)
    func viewHasAppeared(_ animated: Bool)
    func viewIsAboutToDisappear(_ animated: Bool)
    func viewHasDisappeared(_ animated: Bool)
}

public class BasePresenter: LifeCycleDelegate {

    open func viewHasLoaded() {}
    open func viewIsAboutToAppear(_ animated: Bool) {}
    open func viewHasAppeared(_ animated: Bool) {}
    open func viewIsAboutToDisappear(_ animated: Bool) {}
    open func viewHasDisappeared(_ animated: Bool) {}
}
