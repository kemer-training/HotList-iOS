//
//  DataModel.swift
//  HotList-iOS
//
//  Created by NAHØM on 20/02/2023.
//

import UIKit
class DataModel{
    func putDummyCells(on tableView: UITableView) -> UITableViewCell{
        var id = "HotListCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: id)
//        cell?.textLabel?.text = "Dummy Cell"
        
        return cell!
    }
    
}

var data = DataModel()
