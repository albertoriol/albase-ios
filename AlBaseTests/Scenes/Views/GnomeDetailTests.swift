//
//  Created by Albert Oriol
//  Copyright © 2019 Albert. All rights reserved.
//

import FBSnapshotTestCase
@testable import ALBase

class GnomeDetailTests: FBSnapshotTestCase {
    
    override func setUp() {
        super.setUp()
    }

    func testGnomeDetail_allData() {
        verifyGnomeDetailView(index: 0)
    }
    
    func testGnomeDetail_noFriends() {
        verifyGnomeDetailView(index: 1)
    }
    
    func testGnomeDetail_noProfessions() {
        verifyGnomeDetailView(index: 2)
    }
    
    // MARK: - Private
    
    private func verifyGnomeDetailView(index: Int) {
        let view = GnomeDetailView(frame: UIScreen.main.bounds)
        let gnomes = Mock.getGnomesFromJson()
        view.populate(gnome: gnomes[index])
        
        FBSnapshotVerifyView(view)
    }
}
