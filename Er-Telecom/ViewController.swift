//
//  ViewController.swift
//  Er-Telecom
//
//  Created by Зоригто Бадмаин on 05.05.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var weekCurrent = [List]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        AlamoWeek.shared.loadWeekAlamo { (weather) in
            print(weather)
            self.weekCurrent = weather.oneDay()
            self.tableView.reloadData()
        }
        configureTable()
    }
    
    private func configureTable() {
        tableView.dataSource = self
        tableView.delegate = self
        
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "TableViewCell")
    }


}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weekCurrent.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.dateLabel.text = weekCurrent[indexPath.row].dt_txt
        cell.tempLabel.text = "\(weekCurrent[indexPath.row].main.temp) ℃"
        return cell
    }
    
    
}

