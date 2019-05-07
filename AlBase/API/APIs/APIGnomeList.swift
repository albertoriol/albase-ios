//
//  Created by Albert Oriol
//  Copyright © 2019 Albert. All rights reserved.
//

import Foundation
import Alamofire

extension APIManager {

    static func requestGnomeList(completion: @escaping (_ apiresult: ApiManagerResult<([Gnome])>) -> Void) {
        Alamofire.request(URLGnomeList)
            .responseJSON { response in
                switch response.result {
                case .success:
                    guard let responseData = response.result.value,
                        let gnomesJSON = (responseData as? [String: Any])?["Brastlewark"],
                        let gnomesData = try? JSONSerialization.data(withJSONObject: gnomesJSON),
                        let gnomes = try? JSONDecoder().decode([Gnome].self, from: gnomesData) else {
                            completion(ApiManagerResult.failure(HTTPError.unknown))
                            return
                    }
                    completion(ApiManagerResult.success(gnomes))
                case .failure(let error as NSError):
                    print("\n Failure Request Gnome List: \(error)")
                    if error.code != HTTPError.cancelled.code {
                        completion(ApiManagerResult.failure(HTTPError(rawValue: error.code) ?? HTTPError.unknown))
                    }
                }
        }
    }
}
