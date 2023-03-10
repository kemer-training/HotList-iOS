//
//  AppViewController.swift
//  HotList-iOS
//
//  Created by NAHØM on 20/02/2023.
//

import UIKit

class AppsViewController: UIViewController{
    @IBOutlet weak var tableView: UITableView!
    
    var data: [Result] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        navigationItem.title = "Apps"
        
        let cellNib = UINib(nibName: "HotListCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: "HotListCell")
        
        DataLoader.loadData(on: tableView){
            self.data = DataLoader.myData?.feed?.results ?? []
            
        }
    }
}

extension AppsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "HotListCell") as! HotListTableViewCell
        cell.name.text = data[indexPath.row].name
        cell.artistName.text = data[indexPath.row].artistName
        return cell
    }
}
