//
//  Created by Albert Oriol
//  Copyright © 2019 Albert. All rights reserved.
//

import UIKit

class ViewCell: UITableViewCell {

    override class public var requiresConstraintBasedLayout: Bool { return true }

    // MARK: - UIView

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        initView()
        addSubviews()
        setupConstraints()

        selectedBackgroundView = UIView()
        selectedBackgroundView?.backgroundColor = UIColor.black.withAlphaComponent(0.07)
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

class CollectionViewCell: UICollectionViewCell {
    
    override open class var requiresConstraintBasedLayout: Bool { return true }
    
    override open var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut, animations: {
                    self.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
                }, completion: nil)
            } else {
                UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut, animations: {
                    self.transform = CGAffineTransform(scaleX: 1, y: 1)
                }, completion: nil)
            }
        }
    }
    
    // MARK: - UIView
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.autoresizingMask = .flexibleHeight
        
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
