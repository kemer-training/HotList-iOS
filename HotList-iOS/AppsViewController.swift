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
    var dataLoader = DataLoader()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        navigationItem.title = "Apps"
        
        let cell = UINib(nibName: "HotListCell", bundle: nil)
        tableView.register(cell, forCellReuseIdentifier: "HotListCell")
        
        let loadingCell = UINib(nibName: "LoadingCell", bundle: nil)
        tableView.register(loadingCell, forCellReuseIdentifier: "LoadingCell")
        
        dataLoader.loadData(mediaType: "apps/top-free", type: "apps", on: tableView){
            self.data = self.dataLoader.apiData?.feed?.results ?? []
            
        }
    }
}

extension AppsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataLoader.isLoading ? 1 : data.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if dataLoader.isLoading{
            return dataLoader.displayLoading(on: tableView)
        }
        
        return dataLoader.displayData(data[indexPath.row], on: tableView)
    }
}
