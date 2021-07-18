//
//  ViewController.swift
//  FindMyFarmersMarket
//
//  Created by Mike Griffin on 7/17/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        _ = FMFMDataManager.shared.fetchFarmersMarkets()
    }
}
