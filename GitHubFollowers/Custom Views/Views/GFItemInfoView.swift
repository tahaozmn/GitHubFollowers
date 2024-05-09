//
//  GFItemInfoView.swift
//  GitHubFollowers
//
//  Created by Taha Özmen on 9.05.2024.
//

import UIKit
import SnapKit

enum ItemInfoType {
    case repos, gists, followers, following
}


class GFItemInfoView: UIView {

    let symbolImageView = UIImageView()
    let titleLabel      = GFTitleLabel(textAlignment: .left, fontSize: 14)
    let countLabel      = GFTitleLabel(textAlignment: .center, fontSize: 14)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        addSubview(symbolImageView)
        addSubview(titleLabel)
        addSubview(countLabel)
        
        symbolImageView.translatesAutoresizingMaskIntoConstraints = false
        symbolImageView.contentMode = .scaleAspectFill
        symbolImageView.tintColor   = .label
        
        symbolImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.height.width.equalTo(20)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(symbolImageView.snp.centerY)
            make.leading.equalTo(symbolImageView.snp.trailing).offset(12)
            make.trailing.equalToSuperview()
            make.height.equalTo(18)
        }
        
        countLabel.snp.makeConstraints { make in
            make.top.equalTo(symbolImageView.snp.bottom).offset(4)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(18)
        }
        
    }
    
    
    func set(itemInfoType: ItemInfoType, withCount count: Int) {
        switch itemInfoType {
        case .repos:
            symbolImageView.image   = UIImage(systemName: SFSymbols.repos)
            titleLabel.text         = "Public Repos"
        case .gists:
            symbolImageView.image   = UIImage(systemName: SFSymbols.gists)
            titleLabel.text         = "Public Gists"
        case .followers:
            symbolImageView.image   = UIImage(systemName: SFSymbols.followers)
            titleLabel.text         = "Followers"
        case .following:
            symbolImageView.image   = UIImage(systemName: SFSymbols.following)
            titleLabel.text         = "Following"
        }
        
        countLabel.text             = String(count)
    }
    
}
