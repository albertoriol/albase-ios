//
//  Created by Albert Oriol
//  Copyright © 2019 Albert. All rights reserved.
//

import UIKit
import EasyPeasy

class FilterCell: ViewCell {
    
    // MARK: - Subviews
    
    lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.font = .systemFont(ofSize: .mediumFontSize)
        view.numberOfLines = 1
        return view
    }()
    
    lazy var tickImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "iconCheck")?.withRenderingMode(.alwaysTemplate)
        view.tintColor = .primary
        return view
    }()
    
    // MARK: - ViewCell
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = ""
        tickImageView.isHidden = true
    }
    
    override func initView() {
        selectionStyle = .none
    }
    
    override func addSubviews() {
        addSubview(titleLabel)
        addSubview(tickImageView)
    }
    
    override func setupConstraints() {
        titleLabel.easy.layout(
            CenterY(),
            Leading(.margin)
        )
        tickImageView.easy.layout(
            CenterY(),
            Trailing(.margin)
        )
    }
    
    // MARK: - Public
    
    func populate(title: String, tickEnabled: Bool) {
        titleLabel.text = title
        tickImageView.isHidden = !tickEnabled
    }
}
