//
//  ViewController.swift
//  ICN_Info
//
//  Created by MoNireu on 2020/06/09.
//  Copyright © 2020 monireu. All rights reserved.
//

import UIKit

class ParkingLotInfoViewController: UIViewController {

    @IBOutlet var parkingLotInfoCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        parkingLotInfoCollectionView.delegate = self
        parkingLotInfoCollectionView.dataSource = self
    }


}


extension ParkingLotInfoViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "parkingLotInfoCell", for: indexPath)

        cell.layer.cornerRadius = cell.frame.width / 3
        cell.backgroundColor = UIColor.systemGray.withAlphaComponent(0.5)
        cell.alpha = 0.5
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = self.view.frame.width / 4 - 20
        return CGSize(width: height, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        print(indexPath)
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "parkingLotInfoHeader", for: indexPath)
        
        header.layer.borderColor = UIColor.blue.cgColor
        header.layer.borderWidth = 1.0
        
        let headerLabel = UILabel(frame: CGRect(x: 50, y: 0, width: 0, height: header.frame.height))
        headerLabel.text = "text"
        headerLabel.sizeToFit()
        headerLabel.center.y = header.frame.height / 2
        headerLabel.layer.borderColor = UIColor.blue.cgColor
        headerLabel.layer.borderWidth = 1.0
        
        header.addSubview(headerLabel)
        
        return header
    }
}

