//
//  Created by Albert Oriol
//  Copyright © 2019 Albert. All rights reserved.
//

import Foundation
import UIKit

class GnomeDetailViewController: BaseViewController {

    public var presenter: GnomeDetailPresenter! {
        didSet {
            customView.delegate = presenter
        }
    }
    
    lazy var customView: GnomeDetailView = {
        let view = GnomeDetailView()
        return view
    }()
    
    // MARK: - Life cycle
    
    override open func loadView() {
        view = customView
    }

    override func viewDidLoad() {
        super.viewDidLoad(presenter: presenter)

        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        navigationItem.title = presenter.navigationBarTitle()
    }
}

// MARK: - Presenter Output

extension GnomeDetailViewController: GnomeDetailPresenterOutput {
    
    func setupView() {
        let gnome = presenter.gnome
        customView.populate(gnome: gnome)
    }

    func showLoading() { }
    func hideLoading() { }
    func showError(errorMessage: ErrorMessage) { }
}
