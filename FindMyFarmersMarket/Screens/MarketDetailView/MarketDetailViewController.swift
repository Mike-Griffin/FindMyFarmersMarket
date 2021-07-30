//
//  MarketDetailViewController.swift
//  FindMyFarmersMarket
//
//  Created by Mike Griffin on 7/26/21.
//

import UIKit

class MarketDetailViewController: UIViewController {
    var market: FarmersMarket
    var vendors: [Vendor] = []
    let titleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    init(market: FarmersMarket) {
        self.market = market
        titleLabel.text = market.name
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        setupUI()
        addSubviews()
        configureConstraints()
        FMFMDataManager.shared.fetchVendors { result in
            switch(result) {
            
            case .success(_):
                self.vendors = FMFMDataManager.shared.fetchVendorsFromMarket(self.market)
                print(self.vendors.count)
            case .failure(_):
                print("error")
            }
        }
    }
    private func setupUI() {
        view.backgroundColor = .white
    }
    private func addSubviews() {
        view.addSubview(titleLabel)
    }
    private func configureConstraints() {
        titleLabel.anchorCenter(centerX: view.safeAreaLayoutGuide.centerXAnchor, centerY: nil)
        titleLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                          leading: nil,
                          bottom: nil,
                          trailing: nil)
    }
}
