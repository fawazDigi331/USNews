//
//  HomeViewModel.swift
//  USNews
//
//  Created by D&C Dev on 25/08/2021.
//

import Foundation


struct ArticleListViewModel {
    let articles: [Article]
}

extension ArticleListViewModel {
    var numberOfSections: Int {
        return 1
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return self.articles.count
    }
    
    func articleAtIndex(_ index: Int) -> HomeViewModel {
        let article = self.articles[index]
        return HomeViewModel(article)
    }
}

struct HomeViewModel {
    private let article: Article
}

extension HomeViewModel {
    init(_ article: Article) {
        self.article = article
    }
}

extension HomeViewModel {
    var title: String {
        return self.article.title
    }
    
    var description: String {
        return self.article.subTitle
    }
    
    var publishedDate: String {
        return self.article.publishedDate
    }
    
    var imageUrl: String {
        return self.article.media.first?.all.first?.url ?? ""
    }
    
    var byLine: String {
        return self.article.byLine
    }
    
    var largeImageUrl: String {
        return self.article.media.last?.all.last?.url ?? ""
    }
    
    var newsUrl: String {
        return self.article.url
    }
    
    
}

