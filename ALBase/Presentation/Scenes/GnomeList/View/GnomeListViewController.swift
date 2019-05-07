//
//  Created by Albert Oriol
//  Copyright © 2019 Albert. All rights reserved.
//

import Foundation
import UIKit

class GnomeListViewController: BaseViewController {

    public var presenter: GnomeListPresenter! {
        didSet {
            customView.delegate = presenter
        }
    }
    
    lazy var customView: GnomeListView = {
        let view = GnomeListView()
        return view
    }()
    
    // MARK: - Life cycle
    
    override open func loadView() {
        view = customView
    }

    override func viewDidLoad() {
        super.viewDidLoad(presenter: presenter)
        
        setupNavigationBar()
        setupCollectionView()
    }
    
    private func setupNavigationBar() {
        navigationItem.title = presenter.navigationBarTitle()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named:"iconFilter"),
            style: .plain, target: self, action: #selector(filterGnomeList))
    }

    // MARK: - Methods

    @objc func filterGnomeList() {
        presenter.filterGnomeList()
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource

extension GnomeListViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    private func setupCollectionView() {
        customView.collectionView.delegate = self
        customView.collectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.numberOfGnomes()
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: GnomeCell.self), for: indexPath) as! GnomeCell
        let gnome = presenter.gnomeAt(position: indexPath.row)
        cell.populate(name: gnome.firstName(), thumbnailURL: gnome.thumbnailURL())

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.gnomeSelectedAt(position: indexPath.row)
    }
}

// MARK: - Presenter Output

extension GnomeListViewController: GnomeListPresenterOutput {
    
    func setupView() {
        customView.collectionView.reloadData()
    }

    func showLoading() {
        customView.collectionView.isHidden = true
        showLoadingHUD()
    }

    func hideLoading() {
        customView.collectionView.isHidden = false
        dismissLoadingHUD()
    }

    func showError(errorMessage: ErrorMessage) {
        showMessageAlert(title: errorMessage.title(), message: errorMessage.message(), action: UIAlertAction(title: "general_retry".localized(), style: .default) { UIAlertAction in
            self.showLoading()
            self.presenter.viewHasLoaded()
        })
    }
}
