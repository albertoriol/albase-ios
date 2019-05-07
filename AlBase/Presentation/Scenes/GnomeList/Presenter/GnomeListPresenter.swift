//
//  Created by Albert Oriol
//  Copyright © 2019 Albert. All rights reserved.
//

import Foundation

protocol GnomeListPresenterOutput: BasePresenterOutput {
}

protocol GnomeListPresenterInteractor {
    func retrieveGnomeGnomeList()
    func processGnomesToShow(gnomes: [Gnome]) -> [Gnome]
}

protocol GnomeListPresenterRouter {
    func showGnomeListFilter(gnomes: [Gnome])
    func showGnomeDetail(gnome: Gnome)
}

class GnomeListPresenter: BasePresenter {

    public let output: GnomeListPresenterOutput
    public let interactor: GnomeListPresenterInteractor
    public let router: GnomeListPresenterRouter
    private var gnomes: [Gnome] = []
    private var gnomesToShow: [Gnome] = []

    init(router: GnomeListPresenterRouter, interactor: GnomeListPresenterInteractor, output: GnomeListPresenterOutput) {
        self.router = router
        self.interactor = interactor
        self.output = output
    }
    
    // MARK: - Lifecycle

    override func viewHasLoaded() {
        super.viewHasLoaded()

        output.showLoading()
        interactor.retrieveGnomeGnomeList()
    }
    
    override func viewHasAppeared(_ animated: Bool) {
        super.viewHasAppeared(animated)
        
        gnomesToShow = interactor.processGnomesToShow(gnomes: gnomes)
        output.setupView()
    }

    // MARK: - Methods

    func navigationBarTitle() -> String {
        return "gnome_list_title".localized()
    }
    
    func numberOfGnomes() -> Int {
        return gnomesToShow.count
    }

    func gnomeAt(position: Int) -> Gnome {
        if gnomesToShow.indices.contains(position) {
            return gnomesToShow[position]
        } else {
            return Gnome()
        }
    }

    func filterGnomeList() {
        router.showGnomeListFilter(gnomes: gnomes)
    }

    func gnomeSelectedAt(position: Int) {
        if gnomesToShow.indices.contains(position) {
            router.showGnomeDetail(gnome: gnomesToShow[position])
        } else {
            router.showGnomeDetail(gnome: Gnome())
        }
    }
}

extension GnomeListPresenter: GnomeListInteractorOutput {

    func gnomeGnomeListSuccess(result: [Gnome]) {
        gnomes = result
        gnomesToShow = interactor.processGnomesToShow(gnomes: gnomes)

        output.hideLoading()
        output.setupView()
    }

    func gnomeGnomeListFailure(error: Error) {
        output.hideLoading()
        output.showError(errorMessage: ErrorMessage(error: error))
    }
}
