//
//  Created by Albert Oriol
//  Copyright © 2019 Albert. All rights reserved.
//

import Foundation
import UIKit

class GnomeListFilterViewController: BaseViewController {
    
    public var presenter: GnomeListFilterPresenter! {
        didSet {
            customView.delegate = presenter
        }
    }
    
    lazy var customView: GnomeListFilterView = {
        let view = GnomeListFilterView()
        return view
    }()
    
    // MARK: - Life cycle
    
    override open func loadView() {
        view = customView
    }

    override func viewDidLoad() {
        super.viewDidLoad(presenter: presenter)
        
        setupNavigationBar()
        setupTableView()
    }

    // MARK: - Methods
    
    private func setupNavigationBar() {
        navigationItem.title = presenter.navigationBarTitle()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title:"general_close".localized(),
                style: .plain, target: self, action: #selector(goBack))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title:"general_save".localized(),
                style: .plain, target: self, action: #selector(saveFilters))
    }

    @objc func goBack() {
        dismiss(animated: true, completion: nil)
    }

    @objc func saveFilters() {
        presenter.saveFilters()
        dismiss(animated: true, completion: nil)
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension GnomeListFilterViewController: UITableViewDelegate, UITableViewDataSource {

    private func setupTableView() {
        customView.tableView.delegate = self
        customView.tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfProfessions()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell() as FilterCell
        
        let title = presenter.professionAt(indexPath.row)
        let tickEnabled = presenter.isProfessionFilterActiveFor(title)
        cell.populate(title: title, tickEnabled: tickEnabled)

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.changeFilter(atRow: indexPath.row)
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}

// MARK: - Presenter Output

extension GnomeListFilterViewController: GnomeListFilterPresenterOutput {
    
    func setupView() {
        customView.tableView.reloadData()
    }
    
    func showLoading() { }
    func hideLoading() { }
    func showError(errorMessage: ErrorMessage) { }
}
