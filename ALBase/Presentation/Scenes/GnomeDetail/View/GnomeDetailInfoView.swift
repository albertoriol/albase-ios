//
//  Created by Albert Oriol
//  Copyright © 2019 Albert. All rights reserved.
//

import EasyPeasy
import Kingfisher

class GnomeDetailInfoView: View {

    // MARK: - Subviews
    
    lazy var containerStackView: UIStackView = {
        let view = UIStackView()
        view.spacing = .smallMargin
        view.axis = .vertical
        return view
    }()
    
    lazy var nameAgeLabel: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.font = .boldSystemFont(ofSize: .bigFontSize)
        view.numberOfLines = 1
        return view
    }()
    
    lazy var weightLabel: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.font = .systemFont(ofSize: .mediumFontSize)
        view.numberOfLines = 1
        return view
    }()
    
    lazy var heightLabel: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.font = .systemFont(ofSize: .mediumFontSize)
        view.numberOfLines = 1
        return view
    }()
    
    lazy var hairColorLabel: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.font = .systemFont(ofSize: .mediumFontSize)
        view.numberOfLines = 1
        return view
    }()
    
    lazy var professionsTitleLabel: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.font = .boldSystemFont(ofSize: .bigFontSize)
        view.numberOfLines = 1
        return view
    }()
    
    lazy var professionsLabel: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.font = .systemFont(ofSize: .mediumFontSize)
        view.numberOfLines = 0
        return view
    }()
    
    lazy var friendsTitleLabel: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.font = .boldSystemFont(ofSize: .bigFontSize)
        view.numberOfLines = 1
        return view
    }()
    
    lazy var friendsLabel: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.font = .systemFont(ofSize: .mediumFontSize)
        view.numberOfLines = 0
        return view
    }()
    
    // MARK: - View

    override open func initView() {
    }

    override open func addSubviews() {
        addSubview(containerStackView)
        
        containerStackView.addArrangedSubview(nameAgeLabel)
        containerStackView.addArrangedSubview(weightLabel)
        containerStackView.addArrangedSubview(heightLabel)
        containerStackView.addArrangedSubview(hairColorLabel)
        
        containerStackView.addArrangedSubview(SeparatorView())
        
        containerStackView.addArrangedSubview(professionsTitleLabel)
        containerStackView.addArrangedSubview(professionsLabel)
        
        containerStackView.addArrangedSubview(SeparatorView())
        
        containerStackView.addArrangedSubview(friendsTitleLabel)
        containerStackView.addArrangedSubview(friendsLabel)
    }

    override open func setupConstraints() {
        containerStackView.easy.layout(
            Edges(.margin)
        )
        
        nameAgeLabel.contentCompression(.vertical)
        weightLabel.contentCompression(.vertical)
        heightLabel.contentCompression(.vertical)
        hairColorLabel.contentCompression(.vertical)
        professionsTitleLabel.contentCompression(.vertical)
        professionsLabel.contentCompression(.vertical)
        friendsTitleLabel.contentCompression(.vertical)
        friendsLabel.contentCompression(.vertical)
    }
    
    // MARK: - Public
    
    func populate(gnome: Gnome) {
        nameAgeLabel.text = "\(gnome.name), \(gnome.age)"
        
        weightLabel.text = "\("gnome_detail_weight_title".localized()): \(gnome.weight)"
        heightLabel.text = "\("gnome_detail_height_title".localized()): \(gnome.height)"
        
        hairColorLabel.text = "\("gnome_detail_hair_color_title".localized()): \(gnome.hair_color)"
        
        let paragraf = NSMutableParagraphStyle()
        paragraf.tabStops = [NSTextTab.init(textAlignment: .left, location: .margin, options: [:])]
        paragraf.minimumLineHeight = .largeMargin
        paragraf.maximumLineHeight = .largeMargin
        paragraf.firstLineHeadIndent = 0
        paragraf.headIndent = .margin
        
        professionsTitleLabel.text = "gnome_detail_professions_title".localized()
        if gnome.professions.isEmpty == false {
            let professions = "•\t\(gnome.professions.joined(separator: "\n•\t"))"
            
            let attributedProfessions = NSAttributedString(
                string: professions,
                attributes: [.paragraphStyle: paragraf]
            )
            
            professionsLabel.attributedText = attributedProfessions
        } else {
            professionsLabel.text = "gnome_detail_no_profession".localized()
        }
        
        friendsTitleLabel.text = "gnome_detail_friends_title".localized()
        if gnome.friends.isEmpty == false {
            let friends = "•\t\(gnome.friends.joined(separator: "\n•\t"))"
            let attributedFriends = NSAttributedString(
                string: friends,
                attributes: [.paragraphStyle: paragraf]
            )
            friendsLabel.attributedText = attributedFriends
        } else {
            friendsLabel.text = "gnome_detail_no_friends".localized()
        }
    }
}
