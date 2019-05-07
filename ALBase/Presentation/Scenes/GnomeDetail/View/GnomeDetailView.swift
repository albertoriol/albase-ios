//
//  Created by Albert Oriol
//  Copyright © 2019 Albert. All rights reserved.
//

import EasyPeasy
import Kingfisher

class GnomeDetailView: View {

    static let thumbnailHeight: CGFloat = UIScreen.main.bounds.height * 0.4
    public var delegate: GnomeDetailPresenter?

    // MARK: - Subviews

    lazy var thumbnailImageView: UIImageView = {
        let view = UIImageView()
        view.tintColor = .primary
        view.backgroundColor = .white
        return view
    }()
    
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.contentSize = CGSize(width: UIScreen.main.bounds.width, height: 1.0)
        return view
    }()
    
    lazy var containerGnomeView: GnomeDetailInfoView = {
        let view = GnomeDetailInfoView()
        return view
    }()
    
    // MARK: - View

    override open func initView() {
    }

    override open func addSubviews() {
        addSubview(thumbnailImageView)
        addSubview(scrollView)
        scrollView.addSubview(containerGnomeView)
    }

    override open func setupConstraints() {
        thumbnailImageView.easy.layout(
            Top(),
            Leading(),
            Trailing(),
            Height(GnomeDetailView.thumbnailHeight)
        )
        scrollView.easy.layout(
            Top().to(thumbnailImageView),
            Leading(),
            Trailing(),
            Bottom()
        )
        containerGnomeView.easy.layout(
            Edges()
        )
        containerGnomeView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        containerGnomeView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        containerGnomeView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        containerGnomeView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        containerGnomeView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
    }
    
    // MARK: - Public
    
    func populate(gnome: Gnome) {
        let processor = CroppingImageProcessor(size:
            CGSize(width: UIScreen.main.bounds.width, height: GnomeDetailView.thumbnailHeight))
        thumbnailImageView.kf.setImage(
            with: gnome.thumbnailURL(),
            placeholder: nil,
            options: [KingfisherOptionsInfoItem.processor(processor), .transition(ImageTransition.fade(1))]
        )
        
        containerGnomeView.populate(gnome: gnome)
    }
}
