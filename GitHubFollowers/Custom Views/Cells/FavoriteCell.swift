//
//  FavoriteCell.swift
//  GitHubFollowers
//
//  Created by Taha Özmen on 21.05.2024.
//

import UIKit
import SnapKit

class FavoriteCell: UITableViewCell {

    static let reuseID  = "FavoriteCell"
    let avatarImageView = GFAvatarImageView(frame: .zero)
    let usernameLabel   = GFTitleLabel(textAlignment: .left, fontSize: 26)
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func set(favorite: Follower) {
        usernameLabel.text = favorite.login
        avatarImageView.downloadImage(from: favorite.avatarUrl)
    }
    
    
    private func configure() {
        addSubview(avatarImageView)
        addSubview(usernameLabel)
        
        accessoryType           = .disclosureIndicator
        let padding: CGFloat    = 12
        
        avatarImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(padding)
            make.width.height.equalTo(60)
        }
        
        usernameLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(avatarImageView.snp.trailing).offset(padding * 2)
            make.trailing.equalToSuperview().offset(-padding)
            make.height.equalTo(40)
        }
    }
    
}
