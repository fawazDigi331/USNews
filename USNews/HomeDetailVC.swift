//
//  HomeDetailVC.swift
//  USNews
//
//  Created by D&C Dev on 26/08/2021.
//

import UIKit

class HomeDetailVC: UIViewController {
    
    // Outlets with customization programtically
    @IBOutlet weak var titleLabel: UILabel!
    {
        didSet {
            titleLabel.font      = UIFont.boldSystemFont(ofSize: 20)
            titleLabel.textColor = UIColor.black
        }
    }
    
    @IBOutlet weak var authorLabel: UILabel!
    {
        didSet {
            authorLabel.font      = UIFont.systemFont(ofSize: 15)
            authorLabel.textColor = UIColor.gray
        }
    }
    
    @IBOutlet weak var publishedDateLabel: UILabel!{
        didSet {
            publishedDateLabel.font      = UIFont.systemFont(ofSize: 12)
            publishedDateLabel.textColor = UIColor.lightGray
        }
    }
    
    @IBOutlet weak var coverImage: UIImageView!
    
    @IBOutlet weak var subTitleLabel: UILabel!
    {
        didSet {
            subTitleLabel.font      = UIFont.systemFont(ofSize: 15)
            subTitleLabel.textColor = UIColor.darkText
        }
    }
    
    @IBOutlet weak var readMoreBtn: UIButton!
    {
        didSet {
            readMoreBtn.setTitle(constants.readMoreBtnTitle, for: .normal)
            readMoreBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        }
    }
    
    var article: HomeViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateTheDisplay()
       
    }
    // update the HomeDetailVC components with the passed Article
    func updateTheDisplay(){
        self.titleLabel.text = article?.title
        self.authorLabel.text = article?.byLine
        self.publishedDateLabel.text = article?.publishedDate
        self.subTitleLabel.text = article?.description
        if let url = URL(string: article?.largeImageUrl ?? ""){
            self.coverImage.imageFromURL(url)
        }
    }
    
    
    @IBAction func readMoreBtnAction(_ sender: Any) {
        guard let urlString = article?.newsUrl, let url = URL(string: urlString) else {
            return
        }
        
        // Open the URL in the external browser
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}
