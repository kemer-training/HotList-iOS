//
//  HotListTableViewCell.swift
//  HotList-iOS
//
//  Created by NAHØM on 03/03/2023.
//

import UIKit

class HotListTableViewCell: UITableViewCell {

    @IBOutlet weak var artworkView: UIImageView!
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var name: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
