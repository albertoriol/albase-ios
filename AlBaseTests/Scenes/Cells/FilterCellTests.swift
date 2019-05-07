//
//  Created by Albert Oriol
//  Copyright © 2019 Albert. All rights reserved.
//

import FBSnapshotTestCase
@testable import ALBase

class FilterCellTests: FBSnapshotTestCase {
    
    override func setUp() {
        super.setUp()
    }

    func testFilterCell_tickDisabled() {
        let cell = FilterCell(frame: CGRect(x: 0, y: 0, width: 375, height: 44))
        cell.populate(title: "Title tickDisabled", tickEnabled: false)
        FBSnapshotVerifyView(cell)
    }
    
    func testFilterCell_tickEnabled() {
        let cell = FilterCell(frame: CGRect(x: 0, y: 0, width: 375, height: 44))
        cell.populate(title: "Title tickEnabled", tickEnabled: true)
        FBSnapshotVerifyView(cell)
    }
}
