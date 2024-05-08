//
//  GFUserInfoHeaderVC.swift
//  GitHubFollowers
//
//  Created by Taha Özmen on 8.05.2024.
//

import UIKit
import SnapKit

class GFUserInfoHeaderVC: UIViewController {
    
    let avatarImageView     = GFAvatarImageView(frame: .zero)
    let usernameLabel       = GFTitleLabel(textAlignment: .left, fontSize: 34)
    let nameLabel           = GFSecondaryTitleLabel(fontSize: 18)
    let locationImageView   = UIImageView()
    let locationLabel       = GFSecondaryTitleLabel(fontSize: 18)
    let bioLabel            = GFBodyLabel(textAlignment: .left)
    
    var user: User!
    
    
    init(user: User) {
        super.init(nibName: nil, bundle: nil)
        self.user = user
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        layoutUI()
        configureUIElements()
    }
    
    func configureUIElements() {
        avatarImageView.downloadImage(from: user.avatarUrl)
        usernameLabel.text          = user.login
        nameLabel.text              = user.name ?? ""
        locationLabel.text          = user.location ?? "No Location"
        bioLabel.text               = user.bio ?? "No Information"
        bioLabel.numberOfLines      = 3
        
        locationImageView.image     = UIImage(systemName: SFSymbols.location)
        locationImageView.tintColor = .secondaryLabel
    }
    
    
    func addSubviews() {
        view.addSubview(avatarImageView)
        view.addSubview(usernameLabel)
        view.addSubview(nameLabel)
        view.addSubview(locationImageView)
        view.addSubview(locationLabel)
        view.addSubview(bioLabel)
    }
    
    func layoutUI() {
        let padding: CGFloat            = 20
        let textImagePadding: CGFloat   = 12
        locationImageView.translatesAutoresizingMaskIntoConstraints = false
        
        avatarImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(padding)
            make.leading.equalToSuperview().offset(padding)
            make.height.width.equalTo(90)
        }
        
        usernameLabel.snp.makeConstraints { make in
            make.top.equalTo(avatarImageView.snp.top)
            make.leading.equalTo(avatarImageView.snp.trailing).offset(textImagePadding)
            make.trailing.equalToSuperview().offset(-padding)
            make.height.equalTo(38)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.centerY.equalTo(avatarImageView.snp.centerY).offset(8)
            make.leading.equalTo(avatarImageView.snp.trailing).offset(textImagePadding)
            make.trailing.equalToSuperview().offset(-padding)
            make.height.equalTo(20)
        }
        
        locationImageView.snp.makeConstraints { make in
            make.bottom.equalTo(avatarImageView.snp.bottom)
            make.leading.equalTo(avatarImageView.snp.trailing).offset(textImagePadding)
            make.width.height.equalTo(20)
        }
        
        locationLabel.snp.makeConstraints { make in
            make.centerY.equalTo(locationImageView.snp.centerY)
            make.leading.equalTo(locationImageView.snp.trailing).offset(5)
            make.trailing.equalToSuperview().offset(-padding)
            make.height.equalTo(20)
        }
        
        bioLabel.snp.makeConstraints { make in
            make.top.equalTo(avatarImageView.snp.bottom).offset(textImagePadding)
            make.leading.equalTo(avatarImageView.snp.leading)
            make.trailing.equalToSuperview().offset(-padding)
            make.height.equalTo(60)
        }
        
    }

}
