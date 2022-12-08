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

    private lazy var button: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = .clear
        return btn
    }()
    
    var action: () -> Void = { /* Intentionally unimplemented */ }
    
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
    
    @objc func buttonPressed() {
        action()
    }
    
    func buildHierarchy() {
        addSubview(titleLabel)
        addSubview(iconImage)
        addSubview(button)
        setupConstraints()
    }
    
    func setupConstraints() {
        button.snp.makeConstraints {
            $0.edges.width.equalToSuperview()
        }
        
        iconImage.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalToSuperview().offset(10)
        }

        titleLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(iconImage.snp.trailing).offset(7)
        }
    }
    
    func configureView() {
      
        backgroundColor = .white
        layer.cornerRadius = 15
        layer.shadowColor = UIColor(hexaRGBA: K.Colors.black)?.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 6.0)
        layer.shadowOpacity = 0.18
        layer.shadowRadius = 2.0
        layer.masksToBounds = false
    }
}
