    //
    //  MainPageVC.swift
    //  PersistenceDemo
    //
    //  Created by user on 30/10/2022.
    //

import UIKit

class MainPageVC: UIViewController {
    
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var ageText: UITextField!
    @IBOutlet weak var myTableView: UITableView!
    
    static let dataKey = "StoredData"
    
    var tableData = [String: Int]()
    
    var keyList: [String] {
        get {
            return Array(tableData.keys)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
            // Retrieve data from UserDefaults
        if UserDefaults.standard.object(forKey: MainPageVC.dataKey) != nil {
            tableData = UserDefaults.standard.object(forKey: MainPageVC.dataKey) as! [String: Int]
        }
        
    }
    
    
    @IBAction func addRecordTapped(_ sender: UIButton) {
        if nameText.text != "" && ageText.text != "" {
            tableData.updateValue(Int(ageText.text!)!, forKey: (nameText.text!))
                // Save to UserDefaults
            UserDefaults.standard.set(tableData, forKey: MainPageVC.dataKey)
            nameText.text = ""
            ageText.text = ""
            myTableView.reloadData()
        }
        
    }
    
        // MARK: - Table view data source
    
    
    
    
}

extension MainPageVC: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            // Get cell and configure it.
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        let key = keyList[indexPath.row]
        cell.textLabel?.text = key
        cell.detailTextLabel?.text = String(describing: tableData[key]!)
        
        return cell
    }
    
        //    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //        return tableData.count
        //    }
        //
        //
        //    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //
        //    }
}
