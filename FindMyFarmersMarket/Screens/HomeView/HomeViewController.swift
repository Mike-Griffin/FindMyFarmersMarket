//
//  ViewController.swift
//  FindMyFarmersMarket
//
//  Created by Mike Griffin on 7/17/21.
//

import UIKit

class HomeViewController: UIViewController {
    let marketsVC: MarketsListViewController = {
        let layout = UICollectionViewFlowLayout()
        let marketVC = MarketsListViewController(collectionViewLayout: layout)
        return marketVC
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setViewUI()
        configureChildren()
        addSubviews()
        setupConstraints()
    }
    func setViewUI() {
        view.backgroundColor = .white
    }
    func configureChildren() {
        addChild(marketsVC)
        marketsVC.didMove(toParent: self)
    }
    func addSubviews() {
        view.addSubview(marketsVC.view)
    }
    func setupConstraints() {
        marketsVC.view.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                              leading: view.safeAreaLayoutGuide.leadingAnchor,
                              bottom: view.safeAreaLayoutGuide.bottomAnchor,
                              trailing: view.safeAreaLayoutGuide.trailingAnchor)
    }
}
