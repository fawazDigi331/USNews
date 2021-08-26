//
//  HomeMainCell.swift
//  USNews
//
//  Created by D&C Dev on 26/08/2021.
//

import UIKit

class HomeMainCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var thumbImage: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var publishedDate: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cellConfiguration()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func cellConfiguration(){
        self.thumbImage.layer.cornerRadius = thumbImage.frame.height / 2
        self.selectionStyle = .none
    }
    
    func updateCell(data: HomeViewModel) {
        self.titleLabel.text = data.title
        self.descriptionLabel.text = data.description
        self.publishedDate.text = data.publishedDate
        // fetching image
        if let url = URL(string: data.imageUrl){
            self.thumbImage.imageFromURL(url)
        }
    }
    
}
