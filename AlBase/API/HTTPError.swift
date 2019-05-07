//
//  Created by Albert Oriol
//  Copyright © 2019 Albert. All rights reserved.
//

import Foundation

public enum HTTPError: Int, Error {
    // CFNetwork
    case requestTimeOut         = -1001
    case cannotFindHost         = -1003
    case offline                = -1009
    case cancelled              = -999

    // HTTP protocol
    case badRequest             = 400
    case internalServerError    = 500
    case unauthorized           = 401
    case noPermission           = 403
    case noEnpointFound         = 404
    case requestNotAccepted     = 406
    case unknown                = -500

    var code: Int {
        return rawValue
    }
}
