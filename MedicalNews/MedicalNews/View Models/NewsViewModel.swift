//
//  NewsViewModel.swift
//  MedicalNews
//
//  Created by Long Bảo on 08/03/2023.
//

import Foundation
import UIKit

struct NewsViewModel {
    var articles: [ArticleModel]
    
    var currentIndex: Int = 1
    
    var numberArticle: Int {
        return articles.count
    }
    
    var imageTitleTURL: URL? {
        return URL(string: self.articles[0].picture)
    }
    
    var titleString: String {
        return articles[0].title
    }

    func getLinkArticle(index: Int) -> URL? {
        return URL(string: articles[index + 1].link)
    }
    
    var dateTitleString: String {
        let inputDateFormatter = DateFormatter()
        inputDateFormatter.dateFormat = "dd/MM/yyyy"
        guard let inputDate = inputDateFormatter.date(from: articles[0].created_at) else {
            fatalError("Invalid date format")
        }

        let outputDateFormatter = DateFormatter()
        outputDateFormatter.dateFormat = "dd 'tháng' MM yyyy"
        let outputDateString = outputDateFormatter.string(from: inputDate)
        return outputDateString
    }
    
    
    var titleArticleString: String {
        return articles[currentIndex].title
    }
    
    var dateArticleString: String {
        let inputDateFormatter = DateFormatter()
        inputDateFormatter.dateFormat = "dd/MM/yyyy"
        guard let inputDate = inputDateFormatter.date(from: articles[currentIndex].created_at) else {
            fatalError("Invalid date format")
        }

        let outputDateFormatter = DateFormatter()
        outputDateFormatter.dateFormat = "dd 'tháng' MM yyyy"
        let outputDateString = outputDateFormatter.string(from: inputDate)
        return outputDateString
    }
    
    var imageArticleUrl: URL? {
        return URL(string: self.articles[currentIndex].picture)
    }

    init(articles: [ArticleModel]) {
        self.articles = articles
    }
}
