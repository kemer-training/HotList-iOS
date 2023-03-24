//
//  DetailViewController.swift
//  HotList-iOS
//
//  Created by NAHØM on 24/03/2023.
//

import UIKit

class DetailViewController: UIViewController{
    
    var cellData: Result?
    var downloadTask: URLSessionDownloadTask?
    
    @IBOutlet weak var artworkView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var kindLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let cellData = cellData{
            downloadTask = artworkView.loadImage(from: cellData.artworkUrl100!)
            artworkView.layer.cornerRadius = 125
            nameLabel.text = cellData.name
            artistNameLabel.text = cellData.artistName
        }
        
    }

    override func viewDidDisappear(_ animated: Bool) {
        downloadTask?.cancel()
        super.viewDidDisappear(animated)
    }
    
    
}
