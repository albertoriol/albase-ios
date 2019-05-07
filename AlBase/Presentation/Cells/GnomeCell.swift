//
//  Created by Albert Oriol
//  Copyright © 2019 Albert. All rights reserved.
//

import EasyPeasy
import Kingfisher

class GnomeCell: CollectionViewCell {
    
    // MARK: - Subviews
    
    lazy var thumbnailImageView: UIImageView = {
        let view = UIImageView()
        view.tintColor = .background
        view.backgroundColor = .white
        return view
    }()
    
    lazy var nameLabel: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.font = .systemFont(ofSize: .mediumFontSize)
        view.textAlignment = .center
        return view
    }()
    
    // MARK: - ViewCell
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        thumbnailImageView.image = nil
        nameLabel.text = ""
    }
    
    override func initView() {
    }
    
    override func addSubviews() {
        addSubview(thumbnailImageView)
        addSubview(nameLabel)
    }
    
    override func setupConstraints() {
        thumbnailImageView.easy.layout(
            Size(self.frame.width - .smallMargin*2),
            Top(.smallMargin),
            Leading(.smallMargin),
            Trailing(.smallMargin)
        )
        nameLabel.easy.layout(
            Top(.smallMargin).to(thumbnailImageView),
            Bottom(),
            Leading(),
            Trailing()
        )
    }
    
    // MARK: - Public
    
    func populate(name: String? = "", thumbnailURL: URL?) {
        nameLabel.text = name
        
        let processor = CroppingImageProcessor(size: CGSize(width: 256, height: 256))
            >> BlackWhiteProcessor()
        thumbnailImageView.kf.setImage(with: thumbnailURL,
                                       placeholder: UIImage(named: "iconGnome"),
                                       options: [KingfisherOptionsInfoItem.processor(processor)])
        thumbnailImageView.layer.masksToBounds = true
        thumbnailImageView.layer.cornerRadius = (self.frame.width - .smallMargin*2) / 2
    }
}
