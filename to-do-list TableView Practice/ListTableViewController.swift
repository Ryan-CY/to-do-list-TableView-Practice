//
//  ListTableViewController.swift
//  to-do-list TableView Practice
//
//  Created by Ryan Lin on 2023/2/6.
//

import UIKit

class ListTableViewController: UITableViewController {
    
    var Countries: [Country] = [
        
        Country(name: "JAPAN", attraction: [
            Attraction(name: "東京塔", location: "東京都港區", transportation: "地鐵", visit: false, like: false),
            Attraction(name: "上野動物園", location: "東京都台東區", transportation: "地鐵", visit: false, like: false),
            Attraction(name: "富士山", location: "静岡縣", transportation: "巴士", visit: false, like: false),
            Attraction(name: "淺草寺", location: "東京都台東區", transportation: "地鐵", visit: false, like: false),
            Attraction(name: "新宿", location: "東京都新宿區", transportation: "地鐵", visit: false, like: false),
            Attraction(name: "原宿", location: "東京都渋谷區", transportation: "地鐵", visit: false, like: false),
            Attraction(name: "日本橋", location: "東京都中央區", transportation: "地鐵", visit: false, like: false),
            Attraction(name: "東京迪士尼樂園", location: "千葉縣", transportation: "巴士", visit: false, like: false),
            Attraction(name: "江戶村", location: "東京都墨田區", transportation: "地鐵", visit: false, like: false),
            Attraction(name: "秋葉原", location: "東京都千代田區", transportation: "地鐵",  visit: false, like: false),
            Attraction(name: "銀座", location: "東京都中央區", transportation: "地鐵", visit: false, like: false),
            Attraction(name: "晴空塔", location: "東京都港區", transportation: "地鐵", visit: false, like: false),
            Attraction(name: "神田明神", location: "東京都千代田區", transportation: "地鐵", visit: false, like: false),
            Attraction(name: "涉谷", location: "東京都渋谷區", transportation: "地鐵", visit: false, like: false),
            Attraction(name: "明治神宮", location: "東京都渋谷區", transportation: "地鐵", visit: false, like: false)]),
        
        Country(name: "KOREA", attraction: [
            Attraction(name: "首爾塔", location: "首爾市中心", transportation: "地鐵", visit: false, like: false),
            Attraction(name: "景福宮", location: "景福門", transportation: "地鐵", visit: false, like: false),
            Attraction(name: "光州塔", location: "光州市中心", transportation: "公車", visit: false, like: false),
            Attraction(name: "首爾城堡", location: "首爾市中心", transportation: "地鐵", visit: false, like: false),
            Attraction(name: "海邊藝術村", location: "釜山市西部海岸", transportation: "公車", visit: false, like: false),
            Attraction(name: "秀川村", location: "忠清北道", transportation: "公車", visit: false, like: false),
            Attraction(name: "漢江花園城", location: "首爾市東南部", transportation: "地鐵", visit: false, like: false),
            Attraction(name: "東大門市場", location: "首爾市東部", transportation: "地鐵", visit: false, like: false),
            Attraction(name: "釜山海洋世界", location: "釜山市西部海岸", transportation: "公車", visit: false, like: false),
            Attraction(name: "慶州海灘", location: "慶州市", transportation: "公車", visit: false, like: false),
            Attraction(name: "首爾科學博物館", location: "首爾市中心", transportation: "地鐵", visit: false, like: false),
            Attraction(name: "松山文化村", location: "首爾市中心", transportation: "地鐵", visit: false, like: false),
            Attraction(name: "南怡島", location: "釜山市西南部", transportation: "公車", visit: false, like: false),
            Attraction(name: "韓國牛肉餐廳", location: "首爾市中心", transportation: "地鐵", visit: false, like: false),
            Attraction(name: "濟州島", location: "忠清北道", transportation: "飛機", visit: false, like: false)
        ])
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 45
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        Countries.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let country = Countries[section]
        return country.attraction.count
    }
    
    fileprivate func configureCell(_ indexPath: IndexPath, _ cell: AttractionTableViewCell) {
        let country = Countries[indexPath.section]
        let spot = country.attraction[indexPath.row]
        
        cell.heartButton.frame = CGRect(x: 10, y: 10, width: 22, height: 22)
        
        cell.nameLabel.text = spot.name
        cell.nameLabel.frame = CGRect(x: 35, y: 10, width: 145, height: 25)
        cell.nameLabel.font = .systemFont(ofSize: 20, weight: .heavy, width: .standard)
        
        cell.areaLabel.text = spot.location
        cell.areaLabel.frame = CGRect(x: 190, y: 10, width: 110, height: 25)
        cell.areaLabel.font = .systemFont(ofSize: 15, weight: .regular)
        
        cell.transportLabel.text = spot.transportation
        cell.transportLabel.frame = CGRect(x: 310, y: 10, width: 35, height: 25)
        cell.transportLabel.font = .systemFont(ofSize: 15, weight: .regular)
        cell.transportLabel.textColor = .gray
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AttractionTableViewCell.reuseIdentifier, for: indexPath) as? AttractionTableViewCell else {
            fatalError("dequeueReusableCell AttractionTableViewCell failed")
        }
        
        if Countries[indexPath.section].attraction[indexPath.row].visit == false {
            cell.accessoryType = .none
        } else {
            cell.accessoryType = .checkmark
        }
        
        if Countries[indexPath.section].attraction[indexPath.row].like == false {
            cell.heartButton.setImage(UIImage(systemName: "\(Heart.unlike.rawValue)"), for: .normal)
            cell.heartButton.tintColor = .systemGray3
        } else {
            cell.heartButton.setImage(UIImage(systemName: "\(Heart.like.rawValue)"), for: .normal)
            cell.heartButton.tintColor = UIColor.systemRed
        }
        
        configureCell(indexPath, cell)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        Countries[section].name
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // !：Bool之間轉換，不是true就是false
        Countries[indexPath.section].attraction[indexPath.row].visit = !Countries[indexPath.section].attraction[indexPath.row].visit
        //Reloads the rows and sections of the table view.
        tableView.reloadData()
    }
    
    @IBAction func heartButtonChosen(_ sender: UIButton) {
        
        let point = sender.convert(CGPoint.zero, to: tableView)
        
        if let indexPath = tableView.indexPathForRow(at: point) {
            Countries[indexPath.section].attraction[indexPath.row].like = !Countries[indexPath.section].attraction[indexPath.row].like
        }
        tableView.reloadData()
    }
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
