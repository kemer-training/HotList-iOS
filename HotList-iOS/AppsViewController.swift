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
        
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if !data.isEmpty{
            return
        }
        
        dataLoader.loadData(
            mediaType: "apps/top-free",
            type: "apps",
            on: tableView
        ){
            self.data = self.dataLoader.apiData?.feed?.results ?? []
            
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        dataLoader.cancelRequest()
        super.viewDidDisappear(animated)
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailView") as! DetailViewController
        vc.cellData = data[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
        
    }
}
