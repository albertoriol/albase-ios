//
//  Created by Albert Oriol
//  Copyright © 2019 Albert. All rights reserved.
//

import UIKit
import EasyPeasy

class View: UIView {

    override class public var requiresConstraintBasedLayout: Bool { return true }

    // MARK: - UIView

    override init(frame: CGRect) {
        super.init(frame:frame)
        initView()
        addSubviews()
        setupConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - To override by subclasses

    func initView() {
    }

    func addSubviews() {
    }

    func setupConstraints() {
    }
}
