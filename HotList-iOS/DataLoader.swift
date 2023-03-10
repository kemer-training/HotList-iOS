//
//  LoadData.swift
//  HotList-iOS
//
//  Created by NAHØM on 06/03/2023.
//

import UIKit

class DataLoader{
    static var myData: DataModel?
    
    static func getUrl() -> URL?{
        return URL(string: "https://rss.applemarketingtools.com/api/v2/us/music/most-played/10/albums.json")
    }
    static func loadData(on tableView: UITableView,  completion: @escaping () -> ()){
        
        let url = getUrl()
        
        
        let session = URLSession.shared
        let task = session.dataTask(with: url!) { data, response, error in
            if let error = error{
                print("Error - \(error.localizedDescription)")
            }
            else if let response = response as? HTTPURLResponse, response.statusCode != 200{
                print("Response Code - \(response.statusCode)")
            }
            else{
                myData = decodeData(from: data)
                
                DispatchQueue.main.async {
                    completion()
                    tableView.reloadData()
                }
            }
        }
        task.resume()
        
    }
    
    static func decodeData(from data: Data?) -> DataModel?{
        let decoder = JSONDecoder()
        do{
            let myData = try decoder.decode(DataModel.self, from: data!)
            return myData
        }catch{
            
        }
        return nil
    }
}

