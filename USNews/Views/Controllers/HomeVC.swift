//
//  HomeVC.swift
//  USNews
//
//  Created by D&C Dev on 26/08/2021.
//

import UIKit

class HomeVC: UIViewController {
   // setup everything related tableview setup done here
    @IBOutlet weak var tableView: UITableView!{
        didSet{
            tableView.delegate = self
            tableView.dataSource = self
            tableView.tableFooterView = UIView()
            tableView.register(UINib(nibName: constants.homeMainCell, bundle: nil), forCellReuseIdentifier: constants.homeMainCell)
        }
    }
    private var articleListVM: ArticleListViewModel!
    let articleUrl = URL(string: UrlDirectory.getMostViewedApi())!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.getNews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.addTitle()
    }
    // MARK: API CALL from Api Client
    func getNews(){
            ApiClient().getArticles(url: articleUrl) { articles in
                if let articles = articles {
                    self.articleListVM  = ArticleListViewModel(articles: articles)
                    //call in main thread
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
           }
                
        }
     }
    
    func addTitle(){
        navigationItem.title = constants.homeTitle
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == constants.homeToDetail {
            if let destinationVC = segue.destination as? HomeDetailVC {
                destinationVC.article = sender as? HomeViewModel
            }
        }
    }
}

// MARK: UITableView Delegates

extension HomeVC: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.articleListVM == nil ? 0 : self.articleListVM.numberOfSections
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleListVM.numberOfRowsInSection(section)
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: constants.homeMainCell, for: indexPath) as? HomeMainCell else {
            fatalError("Home Main Cell not found!")
        }
        
        let articleVM = self.articleListVM.articleAtIndex(indexPath.row)
        cell.updateCell(data: articleVM)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let data = self.articleListVM.articleAtIndex(indexPath.row)
        self.performSegue(withIdentifier: constants.homeToDetail, sender: data)
    }
}
