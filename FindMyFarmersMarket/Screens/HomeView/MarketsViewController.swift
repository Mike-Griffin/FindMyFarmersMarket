//
//  MarketsCollectionVC.swift
//  FindMyFarmersMarket
//
//  Created by Mike Griffin on 7/21/21.
//

import UIKit

class MarketsViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    var markets: [FarmersMarket] = []
    override func viewDidLoad() {
        collectionView.register(MarketCell.self, forCellWithReuseIdentifier: CellId.cellId)
        collectionView.backgroundColor = .green
        loadData()
    }
    private func loadData() {
        FMFMDataManager.shared.fetchFarmersMarkets { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let markets):
                    print("hello?")
                    self.markets = markets
                    print(markets)
                    self.collectionView.reloadData()
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("this even getting called?")
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellId.cellId,
                                                         for: indexPath) as? MarketCell {
            print("we got a cell here")
            cell.backgroundColor = .blue
            cell.nameLabel.text = markets[indexPath.item].name
            return cell
        } else {
            fatalError("Failed to dequeue as Market Cell")
        }

    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(markets.count)
        return markets.count
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 30)
    }
}
