//
//  Created by Albert Oriol
//  Copyright © 2019 Albert. All rights reserved.
//

import Foundation

public struct ErrorMessage {
    
    private var error: Error?
    
    init(error: Error) {
        self.error = error
    }

    func title() -> String {
        return getErrorLabel(sufix: "_title")
    }

    func message() -> String {
        return getErrorLabel(sufix: "_message")
    }
    
    private func getErrorLabel(sufix: String) -> String {
        switch error {
        case HTTPError.offline?:
            return "error_offline_access\(sufix)".localized()
        case HTTPError.requestTimeOut?:
            return "error_server_timeout\(sufix)".localized()
        default:
            return "error_dialog_error\(sufix)".localized()
        }
    }
}
