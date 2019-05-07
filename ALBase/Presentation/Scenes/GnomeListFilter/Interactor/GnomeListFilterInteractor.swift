//
//  Created by Albert Oriol
//  Copyright © 2019 Albert. All rights reserved.
//

import Foundation

protocol GnomeListFilterInteractorOutput: class {
}

class GnomeListFilterInteractor: GnomeListFilterPresenterInteractor {
    
    weak var presenter: GnomeListFilterInteractorOutput?

    func getProfessionsFrom(gnomes: [Gnome]) -> [String] {
        return Array(Set(gnomes.flatMap{ $0.professions })
            .map{ $0.trimmingCharacters(in: .whitespacesAndNewlines) })
            .sorted()
    }
}
