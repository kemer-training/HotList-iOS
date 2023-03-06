//
//  LoadData.swift
//  HotList-iOS
//
//  Created by NAHØM on 06/03/2023.
//

import UIKit

class DataLoader{
    func putDummyCells(on tableView: UITableView) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "HotListCell") as! HotListTableViewCell
        let data = Result()
        cell.name.text = data.name
        cell.artistName.text = data.artistName
        return cell
    }
}

var data = DataLoader()
