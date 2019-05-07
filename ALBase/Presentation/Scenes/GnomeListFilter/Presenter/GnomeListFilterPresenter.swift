//
//  Created by Albert Oriol
//  Copyright © 2019 Albert. All rights reserved.
//

import Foundation

protocol GnomeListFilterPresenterOutput: BasePresenterOutput {
}

protocol GnomeListFilterPresenterInteractor {
    func getProfessionsFrom(gnomes: [Gnome]) -> [String]
}

class GnomeListFilterPresenter: BasePresenter {

    public let output: GnomeListFilterPresenterOutput
    public let interactor: GnomeListFilterPresenterInteractor
    private var gnomes: [Gnome]
    private var professions: [String] = []
    private var activeFilters: [String] = []

    init(gnomes: [Gnome], interactor: GnomeListFilterPresenterInteractor, output: GnomeListFilterPresenterOutput) {
        self.gnomes = gnomes
        self.interactor = interactor
        self.output = output
    }

    // MARK: - Lifecycle

    override func viewHasLoaded() {
        super.viewHasLoaded()

        output.showLoading()

        DispatchQueue.global(qos: .userInitiated).async {
            self.professions = self.interactor.getProfessionsFrom(gnomes: self.gnomes)
            self.activeFilters = UserDefaults.gnomeListFilters
            
            DispatchQueue.main.async {
                self.output.setupView()
                self.output.hideLoading()
            }
        }
    }

    // MARK: - Methods
    
    func navigationBarTitle() -> String {
        return "gnome_list_filter_title".localized()
    }

    func numberOfProfessions() -> Int {
        return professions.count
    }

    func professionAt(_ position: Int) -> String {
        return professions[position]
    }

    func isProfessionFilterActiveFor(_ profession: String) -> Bool {
        return activeFilters.contains(profession)
    }

    func saveFilters() {
        UserDefaults.set(gnomeListFilters: activeFilters)
    }

    func changeFilter(atRow row: Int) {
        let filter = professionAt(row)
        if activeFilters.contains(filter) {
            activeFilters = activeFilters.filter{ $0 != filter }
        } else {
            activeFilters.append(filter)
        }
    }
}
