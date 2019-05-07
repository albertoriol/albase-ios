//
//  Created by Albert Oriol
//  Copyright © 2019 Albert. All rights reserved.
//

import Foundation
import ALBase

class Mock {

    static func json(named name: String) -> Any? {
        guard
            let path = Bundle(for: self).path(forResource: name, ofType: "json"),
            let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped),
            let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)
        else {
            return nil
        }
        return json
    }
    
    // MARK: - Mock API requests
    
    static func getGnomesFromJson() -> [Gnome] {
        let json = Mock.json(named: "gnomes_mock")
        guard
            let gnomesJSON = (json as? [String: Any])?["Brastlewark"],
            let gnomesData = try? JSONSerialization.data(withJSONObject: gnomesJSON),
            let gnomes = try? JSONDecoder().decode([Gnome].self, from: gnomesData) else {
                return []
        }
        return gnomes
    }
}
