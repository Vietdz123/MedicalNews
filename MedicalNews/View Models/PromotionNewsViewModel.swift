//
//  PromotionNewsViewModel.swift
//  MedicalNews
//
//  Created by Long Bảo on 09/03/2023.
//

import Foundation
import UIKit

enum PromotionOption: Int {
    case category
    case filter
    
    var topTitle: String {
        switch self {
        case .category:
            return "Danh mục"
        case .filter:
            return "Lọc và phân loại"
        }
    }
    
    var bottomTitle: String {
        switch self {
        case .category:
            return "Khuyến mãi"
        case .filter:
            return "Mới nhất"
        }
    }
}

struct PromotionViewModel {
    var promotionList: [PromotionModel]
    
    var currentIndex: Int = 0
    
    var numberPromotion: Int {
        return promotionList.count
    }
    
    func getLinkPromotion(index: Int) -> URL? {
        return URL(string: promotionList[index].link)
    }
    
    var dateTitleString: String {
        let inputDateFormatter = DateFormatter()
        inputDateFormatter.dateFormat = "dd/MM/yyyy"
        guard let inputDate = inputDateFormatter.date(from: promotionList[0].created_at) else {
            fatalError("Invalid date format")
        }

        let outputDateFormatter = DateFormatter()
        outputDateFormatter.dateFormat = "dd 'tháng' MM yyyy"
        let outputDateString = outputDateFormatter.string(from: inputDate)
        return outputDateString
    }
    
    
    var titlePromotionString: String {
        return promotionList[currentIndex].name
    }
    
    var datePromotionString: String {
        let inputDateFormatter = DateFormatter()
        inputDateFormatter.dateFormat = "dd/MM/yyyy"
        guard let inputDate = inputDateFormatter.date(from: promotionList[currentIndex].created_at) else {
            fatalError("Invalid date format")
        }

        let outputDateFormatter = DateFormatter()
        outputDateFormatter.dateFormat = "dd 'tháng' MM yyyy"
        let outputDateString = outputDateFormatter.string(from: inputDate)
        return outputDateString
    }
    
    var imagePromotionUrl: URL? {
        return URL(string: self.promotionList[currentIndex].picture)
    }

    init(promotions: [PromotionModel]) {
        self.promotionList = promotions
    }
}
