//
//  Created by Albert Oriol
//  Copyright © 2019 Albert. All rights reserved.
//

import EasyPeasy

class SeparatorView: View {
    
    // MARK: - Subviews
    
    lazy var lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .primary
        return view
    }()
    
    override func initView() {
    }
    
    override func addSubviews() {
        addSubview(lineView)
    }
    
    override func setupConstraints() {
        lineView.easy.layout(
            Edges(),
            Height(1)
        )
    }    
}
