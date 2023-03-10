//
//  MusicViewController.swift
//  HotList-iOS
//
//  Created by NAHØM on 20/02/2023.
//

import UIKit

class MusicsViewController: UIViewController{
    
    @IBOutlet weak var tableView: UITableView!
    
    var data: [Result] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        navigationItem.title = "Music"
        tableView.contentInset = UIEdgeInsets(top: 44, left: 0, bottom: 0, right: 0)
        
        let cellNib = UINib(nibName: "HotListCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: "HotListCell")
        
        DataLoader.loadData(on: tableView){
            self.data = DataLoader.myData?.feed?.results ?? []
            
        }
    }
    
    
}

extension MusicsViewController: UITableViewDelegate, UITableViewDataSource{
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


