//
//  Created by Albert Oriol
//  Copyright © 2019 Albert. All rights reserved.
//

import Foundation

public class Gnome: Codable {
    var id: Int = -1
    var name: String = ""
    var thumbnail: String = ""
    var age: Int = -1
    var weight: Double = -1
    var height: Double = -1
    var hair_color: String = ""
    var professions: [String] = []
    var friends: [String] = []
    
    // MARK: - Public
    
    public func firstName() -> String {
        return name.components(separatedBy: " ").first ?? ""
    }
    
    public func thumbnailURL() -> URL? {
        return URL(string: thumbnail)
    }
}
