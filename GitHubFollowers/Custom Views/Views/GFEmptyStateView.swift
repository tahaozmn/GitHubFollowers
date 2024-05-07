//
//  GFEmptyStateView.swift
//  GitHubFollowers
//
//  Created by Taha Özmen on 3.05.2024.
//

import UIKit
import SnapKit

class GFEmptyStateView: UIView {
    
    let messageLabel = GFTitleLabel(textAlignment: .center, fontSize: 28)
    let logoImageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(message: String) {
        super.init(frame: .zero)
        messageLabel.text = message
        configure()
    }
    
    private func configure() {
        addSubview(messageLabel)
        addSubview(logoImageView)
        
        messageLabel.numberOfLines  = 3
        messageLabel.textColor      = .secondaryLabel
        
        logoImageView.image = UIImage(named: "emptyStateLogo")
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        messageLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview().offset(-150)
            make.leading.equalToSuperview().offset(40)
            make.trailing.equalToSuperview().offset(-40)
            make.height.equalTo(200)
        }
        
        logoImageView.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(1.3)
            make.height.equalTo(self.snp.width).multipliedBy(1.3)
            make.trailing.equalToSuperview().offset(170)
            make.bottom.equalToSuperview().offset(40)
        }
    }
    
}
