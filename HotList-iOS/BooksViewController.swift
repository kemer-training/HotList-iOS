//
//  BooksViewController.swift
//  HotList-iOS
//
//  Created by NAHØM on 20/02/2023.
//

import UIKit

class BooksViewController: UIViewController{
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        navigationItem.title = "Books"
        
        let cellNib = UINib(nibName: "HotListCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: "HotListCell")
    }
}

extension BooksViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return DataLoader.loadData(on: tableView)
    }
}
