//
//  MusicViewController.swift
//  HotList-iOS
//
//  Created by NAHØM on 20/02/2023.
//

import UIKit

class MusicsViewController: UIViewController{
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        navigationItem.title = "Music"
        tableView.contentInset = UIEdgeInsets(top: 44, left: 0, bottom: 0, right: 0)
        
        let cellNib = UINib(nibName: "HotListCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: "HotListCell")
        
    }
    
    
}

extension MusicsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return DataLoader.loadData(on: tableView)
    }
    
}


