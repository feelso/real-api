//
//  APIMethods.swift
//  RealApiTask
//
//  Created by Arsen on 10/20/19.
//  Copyright © 2019 Arsen. All rights reserved.
//
import UIKit
import Foundation

enum Endpoint {
    
    case jsonFile
    
    
    var url: URL {
        return URL(string: self.stringValue)!
    }
    
    var stringValue: String {
        switch self {
        case .jsonFile:
            return "https://debug.pokerup.net/user/userdetails?version=3.1&user_id=301&login_id=301&resolution=2x"
        }
    }
}


class APIMethods {
    
    func handleComparisonCell(customJson: CustomJson?) {
        let bestHand = BestHandCellModel()
        
        if let bestHands = customJson?.bestHand {
            bestHand.bestHands = bestHands
        }

        InfoModel.singleCellModel[String(describing: BestHandCellModel.self)] = bestHand
    }
    
    func handleShowingBadgeCell(customJson: CustomJson?) {
        guard let duelProgress = customJson?.duelProgress else { return }
        var cellModels = [DataModel]()
        
        for event in duelProgress {
            let cellModel = BadgeCellModel()
            
            cellModel.numberOfStars = event.duelAchievements.completedStars
            
            let badgeImageLink = event.badge
                        let badgeImageTask = URLSession.shared.dataTask(with: URL(string: badgeImageLink)!,
                                                              completionHandler: { (data, response, error) in
            
                                                                guard let data = data else { return }
            
                                                                if let downloadedImage = UIImage(data: data) {
                                                                   cellModel.badge = downloadedImage
                                                                }
                        })
                        badgeImageTask.resume()
            
            let ribbon = event.badgeRibbon
            if ribbon == "" {
                cellModel.badgeRibbon = UIImage(named: "placeholder2")
            } else {
            let ribbonTask = URLSession.shared.dataTask(with: URL(string: ribbon)!) { (data, response, error) in
                guard let data = data else { return }
                
                if let downloadedImage = UIImage(data: data) {
                    cellModel.badgeRibbon = downloadedImage
                }
            }
            ribbonTask.resume()
        }
            
            cellModels.append(cellModel)
        }

        InfoModel.multipleCellsModel[String(describing: BadgeCellModel.self)] = cellModels
        
    }
    
    func handleShowingUserGameStyleCell(customJson: CustomJson?) {
        let model = UserGameStyleCellModel()

        if let agression = customJson?.aggression {
            model.agression = agression
        }
        if let fold = customJson?.foldRate {
            model.foldRate = fold
        }
        if let win = customJson?.winRate {
            model.winRate = win
        }
        
        InfoModel.singleCellModel[String(describing: UserGameStyleCell.self)] = model
    }
    
    func handleShowingUserCellWith(customJson: CustomJson?) {
        let model = UserInfoCellModel()
        
        if let picStringURL = customJson?.profilePic {
        let task = URLSession.shared.dataTask(with: URL(string: picStringURL)!) { (data, response, error) in
            guard let data = data else { return }
            let downloadedImage = UIImage(data: data)
           model.avatarImage = downloadedImage
        }
        task.resume()
        
    }
        if let coins = customJson?.coins {
            model.coins = coins
        }
        
        if let name = customJson?.name {
            model.userName = name
        }
        
        if let isOnline = customJson?.isOnline {
            model.isOnline = isOnline
        }
        
        if let subs = customJson?.subscribed {
            model.subscribed = subs
        }
        
        InfoModel.singleCellModel[String(describing: UserInfoCell.self)] = model
        
    }
  
    func handleTitleCell(customJson: CustomJson?) {
        let model = TitleCellModel()
        if let name = customJson?.rankProgress.rankInfo.name {
            model.name = name
        }
        InfoModel.singleCellModel[String(describing: TitleCell.self)] = model
    }
    
    func handleLastGamesCell(customJson: CustomJson?) {
        let model = LastGamesCellModel()
        
        if let games = customJson?.form {
            model.games = games
        }
        
        InfoModel.singleCellModel[String(describing: LastGamesCell.self)] = model
    }
    
    func handleRegistrationDateCell(customJson: CustomJson?) {
        let model = DateCellModel()
        if let date  = customJson?.registrationDay {
            model.registrationDay = date
        }
        InfoModel.singleCellModel[String(describing: DateCell.self)] = model

    }
    
    func getUserData()  {
        let randomImageEndpoint = Endpoint.jsonFile.url

        let task = URLSession.shared.dataTask(with: randomImageEndpoint
                , completionHandler: { (data, response, error) in
                    
        
            guard let data = data else { return  }
            
            let decoder = JSONDecoder()
            
                    do {
                        let userData = try decoder.decode(CustomJson.self,
                                                           from: data)
                        self.handleShowingUserCellWith(customJson: userData)
                        self.handleShowingUserGameStyleCell(customJson: userData)
                        self.handleShowingBadgeCell(customJson: userData)
                        self.handleComparisonCell(customJson: userData)
                        self.handleTitleCell(customJson: userData)
                        self.handleLastGamesCell(customJson: userData)
                        self.handleRegistrationDateCell(customJson: userData)
                    } catch {
                        print(error)
                    }
         
        })

        task.resume()
        
    }
    
}

