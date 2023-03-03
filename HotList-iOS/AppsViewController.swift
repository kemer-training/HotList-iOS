//
//  AppViewController.swift
//  HotList-iOS
//
//  Created by NAHØM on 20/02/2023.
//

import UIKit

class AppsViewController: UIViewController{
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        navigationItem.title = "Apps"
        
        let cellNib = UINib(nibName: "HotListCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: "HotListCell")
    }
}

extension AppsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return data.putDummyCells(on: tableView)
    }
}
