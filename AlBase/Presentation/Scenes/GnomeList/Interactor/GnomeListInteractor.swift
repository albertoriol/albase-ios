//
//  Created by Albert Oriol
//  Copyright © 2019 Albert. All rights reserved.
//

import Foundation

protocol GnomeListInteractorOutput: class {
    func gnomeGnomeListSuccess(result: [Gnome])
    func gnomeGnomeListFailure(error: Error)
}

class GnomeListInteractor: GnomeListPresenterInteractor {
    
    weak var presenter: GnomeListInteractorOutput?

    func retrieveGnomeGnomeList() {
        func success(gnomes: [Gnome]) {
            DispatchQueue.main.async(execute: {
                self.presenter?.gnomeGnomeListSuccess(result: gnomes)
            })
        }
        func failure(error: Error) {
            DispatchQueue.main.async(execute: {
                self.presenter?.gnomeGnomeListFailure(error: error)
            })
        }
        DispatchQueue.global(qos: .userInitiated).async {
            APIManager.requestGnomeList(completion: { result in
                if let error = result.error {
                    failure(error: error)
                    return
                }
                success(gnomes: result.value ?? [])
            })
        }
    }
    
    func processGnomesToShow(gnomes: [Gnome]) -> [Gnome] {
        var gnomesToShow = gnomes
        
        let gnomeListFilters = UserDefaults.gnomeListFilters
        if gnomeListFilters.count > 0 {
            gnomesToShow = gnomes.filter {
                for profession in $0.professions {
                    if gnomeListFilters.contains(profession) {
                        return true
                    }
                }
                return false
            }
        }
        return gnomesToShow
    }
}
