//
//  Created by Albert Oriol
//  Copyright © 2019 Albert. All rights reserved.
//

import EasyPeasy

class GnomeListFilterView: View {

    public var delegate: GnomeListFilterPresenter?

    // MARK: - Subviews

    public lazy var tableView: UITableView = {
        let view = UITableView()
        view.backgroundColor = .clear
        view.register(FilterCell.self)
        return view
    }()

    // MARK: - View

    override open func initView() {
    }

    override open func addSubviews() {
        addSubview(tableView)
    }

    override open func setupConstraints() {
        tableView.easy.layout(
            Edges()
        )
    }
}
