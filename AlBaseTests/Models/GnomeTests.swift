//
//  Created by Albert Oriol
//  Copyright © 2019 Albert. All rights reserved.
//

import XCTest
@testable import ALBase

class GnomeTests: XCTestCase {
    
    var gnomes: [Gnome] = []
    
    override func setUp() {
        super.setUp()
        
        gnomes = Mock.getGnomesFromJson()
    }
    
    func testGnome_empty() {
        let gnome = Gnome()
        
        XCTAssert(gnome.id == -1)
        XCTAssert(gnome.name == "")
        XCTAssert(gnome.thumbnail == "")
        XCTAssert(gnome.age == -1)
        XCTAssert(gnome.weight == -1)
        XCTAssert(gnome.height == -1)
        XCTAssert(gnome.hair_color == "")
        XCTAssert(gnome.professions == [])
        XCTAssert(gnome.friends == [])
    }
    
    func testGnome_list() {
        XCTAssert(gnomes.count == 3)
    }
    
    func testGnome_basicData() {
        let gnome = gnomes[0]
        
        XCTAssert(gnome.id == 0)
        XCTAssert(gnome.name == "Tobus Quickwhistle")
        XCTAssert(gnome.thumbnail == "invalidURL")
        XCTAssert(gnome.age == 306)
        XCTAssert(gnome.weight == 39.06)
        XCTAssert(gnome.height == 107.75)
        XCTAssert(gnome.professions.count == 6)
        XCTAssert(gnome.friends.count == 2)
    }
    
    func testGnome_noFriends() {
        let gnome = gnomes[1]
        
        XCTAssert(gnome.friends.count == 0)
    }
    
    func testGnome_noProfessions() {
        let gnome = gnomes[2]
        
        XCTAssert(gnome.professions.count == 0)
    }
    
    func testGnome_firstName() {
        let gnome = gnomes[2]
        
        XCTAssert(gnome.firstName() == "Ecki")
    }
    
    func testGnome_thumbnailURL() {
        let gnome = gnomes[0]
        
        XCTAssert(gnome.thumbnailURL()?.absoluteString == "invalidURL")
    }
    
    func testGnome_thumbnailURL_empty() {
        let gnome = gnomes[1]
        
        XCTAssert(gnome.thumbnailURL()?.absoluteString == nil)
    }
    
    func testGnome_thumbnailURL_missing() {
        let gnome = gnomes[2]
        
        XCTAssert(gnome.thumbnailURL()?.absoluteString == nil)
    }
}
