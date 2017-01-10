//
//  SettingTableViewController.swift
//  UniversityRating
//
//  Created by Izzy on 20/12/2016.
//  Copyright © 2016 Izzy. All rights reserved.
//

import UIKit

class SettingTableViewController: UITableViewController {
    
    
    //MARK: Stored Properties
    let universityArray = UniversityModel.sharedIntstance.universityArray
    var selectedRow: IndexPath?
    
    
    //MARK: UIView Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        tableSetup()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        addListeningObserver()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        //remove observer!
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: "moduleSelected"), object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: "load"), object: nil)

    }
    
    
    //MARK: Helper Methods

    
    
    //MARK: TableSetup
    func tableSetup() {
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 140
        tableView.register(UINib(nibName: "SettingsHeader", bundle: nil), forHeaderFooterViewReuseIdentifier: "settingsHeaderCell")
        tableView.reloadData()
    }
    
    
    //MARK: Observer Methods
    func moveToRatingTableView() {
        print("Moving to Rating Table view")
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let ratingVC = storyboard.instantiateViewController(withIdentifier: "RatingTableViewController") as! RatingTableViewController
        self.navigationController?.show(ratingVC, sender: nil)
        //        self.present(ratingVC, animated:true, completion:nil)
    }
    
    func reloadAllSettingsData() {
        tableView.reloadData()
    }
    
    func addListeningObserver() {
        // Define identifier
        let moveToRatingsTable = Notification.Name("moduleSelected")
        let reload = Notification.Name("load")

        // Register to receive notification
        NotificationCenter.default.addObserver(self, selector: #selector(SettingTableViewController.moveToRatingTableView), name: moveToRatingsTable, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(SettingTableViewController.reloadAllSettingsData), name: reload, object: nil)

    }
    
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return universityArray.count
    }
    
    
    //MARK: Selection/ Checkmark method
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "settingsCell", for: indexPath) as! SettingsTableViewCell
        let uni = universityArray.object(at: indexPath.row) as! University
        
        if uni.checked == false {
            //            cell.accessoryType = .checkmark
            cell.tickImageView.isHidden = false
            cell.internalSettingsCard.alpha = 1.0
            
            uni.checked = true
        } else {
            //            cell.accessoryType = .none
            cell.tickImageView.isHidden = true
            cell.internalSettingsCard.alpha = 0.5
            
            uni.checked = false
        }
        
        tableView.reloadRows(at: [indexPath], with: .none)
    }
    
    
    //MARK: Creating Cells
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return self.settingsCellAtIndex(indexPath: indexPath)
    }
    
    
    //MARK: HeaderView
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 40))
        if (section == 0) {
            return self.settingsHeaderCell(section: section)
        } else {
            headerView.backgroundColor = UIColor.clear
        }
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    
    //MARK: FooterView
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 70))
        if (section == 0) {
            return self.settingsFooterCell(section: section)
        } else {
            footerView.backgroundColor = UIColor.clear
        }
        return footerView
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 70
    }
    
    
    //MARK: Custom Cells
    func settingsCellAtIndex(indexPath: IndexPath) -> SettingsTableViewCell {
        
        self.tableView.register(UINib.init(nibName: "Settings", bundle: nil), forCellReuseIdentifier: "settingsCell")
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "settingsCell", for: indexPath) as! SettingsTableViewCell
        let uni = universityArray.object(at: indexPath.row) as! University
        cell.universitObject = uni
        cell.configureCell()
        
        if uni.checked == true {
            //            cell.accessoryType = .checkmark
            cell.tickImageView.isHidden = false
            cell.internalSettingsCard.alpha = 1.0
            
            uni.checked = true
        } else  {
            //            cell.accessoryType = .none
            cell.tickImageView.isHidden = true
            cell.internalSettingsCard.alpha = 0.50
            
            uni.checked = false
        }
        
        return cell
        
    }
    
    func settingsHeaderCell(section: NSInteger) -> SettingsHeaderTableViewCell {
        self.tableView.register(UINib.init(nibName: "SettingsHeader", bundle: nil), forCellReuseIdentifier: "settingsHeaderCell")
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "settingsHeaderCell") as! SettingsHeaderTableViewCell
        
        return cell
    }
    
    func settingsFooterCell(section: NSInteger) -> SettingsFooterTableViewCell {
        self.tableView.register(UINib.init(nibName: "SettingsFooter", bundle: nil), forCellReuseIdentifier: "settingsFooterCell")
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "settingsFooterCell") as! SettingsFooterTableViewCell
        
        return  cell
    }
}
