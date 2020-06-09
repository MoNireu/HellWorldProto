//
//  ViewController.swift
//  ICN_Info
//
//  Created by MoNireu on 2020/06/09.
//  Copyright © 2020 monireu. All rights reserved.
//
import UIKit

class ParkingLotInfoViewController: UIViewController {

    
    @IBOutlet var airportSegmentCtrl: UISegmentedControl!
    @IBOutlet var parkingLotImgView: UIImageView!
    @IBOutlet var navigationBarTopVIew: UIView!
    @IBOutlet var navigationBar: UINavigationBar!
    @IBOutlet var navigationBarBottomView: UIView!
    @IBOutlet var tableView: UITableView!
    
    var dummyData: [DummyData] {
        var dataList = [DummyData]()
        let dummyData1 = DummyData(_name: "지상 1층", _carAvailable: 2000, _parkingLotCapacity: 2000)
        dataList.append(dummyData1)
        let dummyData2 = DummyData(_name: "지하 1층", _carAvailable: 100, _parkingLotCapacity: 2000)
        dataList.append(dummyData2)
        let dummyData3 = DummyData(_name: "지하 2층", _carAvailable: 500, _parkingLotCapacity: 2000)
        dataList.append(dummyData3)
        
        return dataList
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let navigationBarBackgroundColor        = UIColor.systemGray6
        navigationBar.barTintColor              = navigationBarBackgroundColor
        navigationBar.backgroundColor           = navigationBarBackgroundColor
        navigationBarTopVIew.backgroundColor    = navigationBarBackgroundColor
        navigationBarBottomView.backgroundColor = navigationBarBackgroundColor
        
        
        parkingLotImgView.image = UIImage(named: "ICN_parking.png")
        parkingLotImgView.contentMode = .scaleAspectFit
        
        tableView.delegate   = self
        tableView.dataSource = self
    }
    
    
//    func putDummyData() -> [DummyData] {
//
//    }

}


extension ParkingLotInfoViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummyData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "parkingLotInfoCell") as? ParkingLotInfoTableViewCell
        let row = indexPath.row
        
        cell?.name.text = dummyData[row].name
        cell?.carAvailableLbl.text = "\(dummyData[row].carAvailable)대 가능"
        let carParked = Double(dummyData[row].parkingLotCapacity - dummyData[row].carAvailable)
        let capacity = Double(dummyData[row].parkingLotCapacity)
        
        guard carParked != 0 else {cell?.setRingProgressValue(value: 0.0); return cell!}
        let progressVal = carParked / capacity
        print(carParked)
        print(capacity)
        print(progressVal)
        print("-----------")
        cell?.setRingProgressValue(value: progressVal)
        
        return cell!
    }
    
    
}




class DummyData {
    let name: String
    let carAvailable: Int
    let parkingLotCapacity: Int
    
    init(_name: String, _carAvailable: Int, _parkingLotCapacity: Int) {
        name = _name
        carAvailable = _carAvailable
        parkingLotCapacity = _parkingLotCapacity
    }
}
