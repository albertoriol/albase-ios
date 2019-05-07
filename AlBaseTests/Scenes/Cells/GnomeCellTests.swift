//
//  Created by Albert Oriol
//  Copyright © 2019 Albert. All rights reserved.
//

import FBSnapshotTestCase
@testable import ALBase

class GnomeCellTests: FBSnapshotTestCase {
    
    override func setUp() {
        super.setUp()
    }

    func testGnomeCell_noName() {
        let cell = GnomeCell(frame: CGRect(x: 0, y: 0, width: 100, height: 120))
        cell.populate(name: "", thumbnailURL: URL(string: ""))
        FBSnapshotVerifyView(cell)
    }
    
    func testGnomeCell_name() {
        let cell = GnomeCell(frame: CGRect(x: 0, y: 0, width: 100, height: 120))
        cell.populate(name: "Name", thumbnailURL: URL(string: ""))
        FBSnapshotVerifyView(cell)
    }
    
    func testGnomeCell_all() {
        let cell = GnomeCell(frame: CGRect(x: 0, y: 0, width: 100, height: 120))
        cell.populate(name: "Name", thumbnailURL: URL(string: "url"))
        FBSnapshotVerifyView(cell)
    }
}
