//
//  MarketCell.swift
//  FindMyFarmersMarket
//
//  Created by Mike Griffin on 7/21/21.
//

import UIKit

class MarketCell: UICollectionViewCell {
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .white
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        configureConstraints()
    }
    func addSubviews() {
        addSubview(nameLabel)
    }
    func configureConstraints() {
        nameLabel.anchorCenter(centerX: centerXAnchor, centerY: centerYAnchor)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
