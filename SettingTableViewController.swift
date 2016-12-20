//
//  SettingTableViewController.swift
//  UniversityRating
//
//  Created by Izzy on 20/12/2016.
//  Copyright © 2016 Izzy. All rights reserved.
//

import UIKit

class SettingTableViewController: UITableViewController {
    let universityArray = UniversityModel.sharedIntstance.universityArray
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UniversityModel.sharedIntstance.createUniversityArray()
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 140
        
        tableView.register(UINib(nibName: "SettingsHeader", bundle: nil), forHeaderFooterViewReuseIdentifier: "settingsHeaderCell")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return universityArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return self.settingsCellAtIndex(indexPath: indexPath)
    }
    

    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 70))
        if (section == 0) {
            return self.settingsHeaderCell(section: section)
        } else {
            headerView.backgroundColor = UIColor.clear
        }
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 70
    }
    
    //MARK: Custom Cells
    func settingsCellAtIndex(indexPath: IndexPath) -> SettingsTableViewCell {
        
        self.tableView.register(UINib.init(nibName: "Settings", bundle: nil), forCellReuseIdentifier: "settingsCell")
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "settingsCell", for: indexPath) as! SettingsTableViewCell
        let uni = universityArray.object(at: indexPath.row) as! University
        cell.universitObject = uni
        cell.configureCell()
        
        return cell
        
    }
    
    func settingsHeaderCell(section: NSInteger) -> SettingsHeaderTableViewCell {
        self.tableView.register(UINib.init(nibName: "SettingsHeader", bundle: nil), forCellReuseIdentifier: "settingsHeaderCell")
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "settingsHeaderCell") as! SettingsHeaderTableViewCell
        return cell
    }
    
    
    
    
}
