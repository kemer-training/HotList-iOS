//
//  LoadData.swift
//  HotList-iOS
//
//  Created by NAHØM on 06/03/2023.
//

import UIKit

class DataLoader{
    var apiData: DataModel?
    var isLoading = true
    
    func getUrl(for mediaType: String, and type: String) -> URL?{
        return URL(string: "https://rss.applemarketingtools.com/api/v2/us/\(mediaType)/10/\(type).json"
        )
    }
    
    func loadData(mediaType: String, type: String, on tableView: UITableView,  completion: @escaping () -> ()){
        
        let url = getUrl(for: mediaType, and: type)
        
        let session = URLSession.shared
        let task = session.dataTask(with: url!) { data, response, error in
            if let error = error{
                print("Error - \(error.localizedDescription)")
            }
            else if let response = response as? HTTPURLResponse, response.statusCode != 200{
                print("\(response.statusCode) - \(response.description)")
            }
            else{
                self.apiData = self.decodeData(from: data)
                self.isLoading = false
                DispatchQueue.main.async {
                    completion()
                    tableView.reloadData()
                }
            }
        }
        task.resume()
        
    }
    
    func decodeData(from data: Data?) -> DataModel?{
        let decoder = JSONDecoder()
        do{
            let apiData = try decoder.decode(DataModel.self, from: data!)
            return apiData
        }catch{
            print(error.localizedDescription)
        }
        return nil
    }
    
    func displayLoading(on tableView: UITableView) -> UITableViewCell{
        var spinner: UIActivityIndicatorView?
        let cell = tableView.dequeueReusableCell(withIdentifier: "LoadingCell")!
        spinner = cell.viewWithTag(2000) as? UIActivityIndicatorView
        spinner?.startAnimating()
        return cell
    }
    
    func displayData(_ data: Result, on tableView: UITableView) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "HotListCell") as! HotListTableViewCell
        cell.name.text = data.name
        cell.artistName.text = data.artistName
        cell.artworkView.loadImage(from: data.artworkUrl100!)
        
        return cell
    }
}

extension UIImageView{
    func loadImage(from urlString: String){
        let url = URL(string: urlString)
        let session = URLSession.shared
        
        let downloadTask = session.downloadTask(with: url!) { url, response, error in
            if let error = error{
                print(error.localizedDescription)
            }
            else if let response = response as? HTTPURLResponse, response.statusCode != 200{
                print("\(response.statusCode) - \(response.description)")
            }
            else if let url = url{
                do{
                    let data = try Data(contentsOf: url)
                    let image = UIImage(data: data)
                    DispatchQueue.main.async {
                        self.image = image
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
        self.image = nil
        downloadTask.resume()
    }
}
