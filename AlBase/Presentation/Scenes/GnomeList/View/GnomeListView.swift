//
//  Created by Albert Oriol
//  Copyright © 2019 Albert. All rights reserved.
//

import EasyPeasy
import Foundation

class GnomeListView: View {

    public var delegate: GnomeListPresenter?

    // MARK: - Subviews

    public lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let width = UIScreen.main.bounds.width / 2.2
        layout.itemSize = CGSize(width: width, height: width + 20 )
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        view.backgroundColor = .clear
        view.register(GnomeCell.self, forCellWithReuseIdentifier: String(describing: GnomeCell.self))
        return view
    }()

    // MARK: - View

    override open func initView() {
    }

    override open func addSubviews() {
        addSubview(collectionView)
    }

    override open func setupConstraints() {
        collectionView.easy.layout(
            Edges()
        )
    }
}
