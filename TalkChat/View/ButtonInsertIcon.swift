//
//  ButtonInsertIcon.swift
//  TalkChat
//
//  Created by Italo on 06/12/22.
//

import UIKit
import SnapKit

class ButtonInsertIcon: UIView {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        return label
    }()
    
    private lazy var iconImage: UIImageView = {
        let image = UIImageView()
        return image
    }()

    init(title: String, icon: String) {
        super.init(frame: .zero)
        self.titleLabel.text = title
        self.iconImage.image = UIImage(named: icon)
        buildHierarchy()
        self.backgroundColor = .red
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildHierarchy() {
        addSubview(titleLabel)
        addSubview(iconImage)
        setupConstraints()
    }
    
    func setupConstraints() {
        
        iconImage.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(10)
        }
        
        titleLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(iconImage.snp.trailing).offset(7)
        }
    }
    
    func configureView() {
        backgroundColor = UIColor(named: K.Colors.mainColor)
        layer.cornerRadius = 20
        layer.shadowColor = UIColor(hexaRGBA: K.Colors.black)?.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 6.0)
        layer.shadowOpacity = 0.18
        layer.shadowRadius = 2.0
        layer.masksToBounds = false
    }
}
