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
    var dataLoader = DataLoader()
    var MusicType = ["albums", "music-videos", "playlists", "songs"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        navigationItem.title = "Music"
        tableView.contentInset = UIEdgeInsets(top: 44, left: 0, bottom: 0, right: 0)
        
        let cell = UINib(nibName: "HotListCell", bundle: nil)
        tableView.register(cell, forCellReuseIdentifier: "HotListCell")
        
        let loadingCell = UINib(nibName: "LoadingCell", bundle: nil)
        tableView.register(loadingCell, forCellReuseIdentifier: "LoadingCell")
        
        dataLoader.loadData(
            mediaType: "music/most-played",
            type: MusicType[0],
            on: tableView
        ){
            self.data = self.dataLoader.apiData?.feed?.results ?? []
            
        }
    }
    
    @IBAction func segmentedControlClicked(_ sender: UISegmentedControl) {
        dataLoader.isLoading = true
        tableView.reloadData()
        
        dataLoader.loadData(
            mediaType: "music/most-played",
            type: MusicType[sender.selectedSegmentIndex],
            on: tableView
        ){
            self.data = self.dataLoader.apiData?.feed?.results ?? []
        }
    }
    
    
    
}

extension MusicsViewController: UITableViewDelegate, UITableViewDataSource{
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


