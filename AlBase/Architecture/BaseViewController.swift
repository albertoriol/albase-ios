//
//  Created by Albert Oriol
//  Copyright © 2019 Albert. All rights reserved.
//

import Foundation
import UIKit

public class BaseViewController: UIViewController {

    private weak var basePresenter: LifeCycleDelegate?

    // MARK: - Life cycle

    override open func viewDidLoad() {
        assertionFailure("\(String(describing: type(of: self))) - Call viewDidLoad(presenter:) instead of super.viewDidLoad()")
    }

    public func viewDidLoad(presenter: LifeCycleDelegate) {
        super.viewDidLoad()

        basePresenter = presenter
        view.backgroundColor = .background

        basePresenter?.viewHasLoaded()
    }

    override open func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        basePresenter?.viewIsAboutToAppear(animated)
    }

    override open func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        basePresenter?.viewHasAppeared(animated)
    }

    override open func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        basePresenter?.viewIsAboutToDisappear(animated)
    }

    override open func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        basePresenter?.viewHasDisappeared(animated)
    }
}
