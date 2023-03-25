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
        navigationItem.prompt = ""
        
        if let cellData = cellData{
            navigationItem.title = "Top " + formatKind(cellData.kind!)
            
            downloadTask = artworkView.loadImage(from: cellData.artworkUrl100!)
            artworkView.layer.cornerRadius = 125
            nameLabel.text = cellData.name
            artistNameLabel.text = cellData.artistName
            kindLabel.text = formatKind(cellData.kind!)
            genreLabel.text = formatGenre(cellData.genres!)
            releaseDateLabel.text = cellData.releaseDate ?? "N/A"
            ratingLabel.text = cellData.contentAdvisoryRating ?? "N/A"
        }
        
    }

    override func viewDidDisappear(_ animated: Bool) {
        downloadTask?.cancel()
        navigationController?.popViewController(animated: true)
        super.viewDidDisappear(animated)
    }
    
    func formatKind(_ kind: Kind) -> String{
        return "\(kind.rawValue.replacingOccurrences(of: "-", with: " ").capitalized)"
    }
    
    func formatGenre(_ genres: [Genre]) -> String {
        if genres.isEmpty { return "N/A"}
        var genreStr: [String] = []
        for genre in genres{
            genreStr.append(genre.name!)
        }
        return genreStr.joined(separator: "/")
    }
}
