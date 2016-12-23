//
//  RatingTableViewController.swift
//  UniversityRating
//
//  Created by Izzy on 20/12/2016.
//  Copyright © 2016 Izzy. All rights reserved.
//

import UIKit

class RatingTableViewController: UITableViewController {

    
    //MARK: Stored Properties
    let universityArray = UniversityModel.sharedIntstance.universityArray
    
    
    //MARK: UI Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Table View loaded")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        addListeningObserver()
    }

    override func viewDidDisappear(_ animated: Bool) {
        //remove observer!
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: "submitCourseFeedback"), object: nil)
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
        return self.universityCellAtIndex(indexPath: indexPath)
    }
    
    
    //MARK: Footer View/ Height
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 70))
        if (section == 0) {
            return self.universityFooterCell(section: section)
        } else {
            footerView.backgroundColor = UIColor.clear
        }
        return footerView
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 70
    }
    
    
    //MARK: Height Cell
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let uni = universityArray.object(at: indexPath.row) as! University
        if uni.checked == true {
            return 160.0
        } else {
            return 0.0
        }
    }
    
    //MARK: Custom Cells
    func universityCellAtIndex(indexPath: IndexPath) -> UniversityTableViewCell {
        
        self.tableView.register(UINib.init(nibName: "University", bundle: nil), forCellReuseIdentifier: "universityCell")
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "universityCell", for: indexPath) as! UniversityTableViewCell
        let uni = universityArray.object(at: indexPath.row) as! University
        cell.universitObject = uni
        cell.configureCell()
    
        return cell

    }

    func universityFooterCell(section: NSInteger) -> UniversityFooterTableViewCell {
        self.tableView.register(UINib.init(nibName: "UniversityFooter", bundle: nil), forCellReuseIdentifier: "universityFooterCell")
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "universityFooterCell") as! UniversityFooterTableViewCell
        
        return  cell
        
    }
    
    //MARK: Observer Methods
    func submitCourseFeedback() {
        print("Submit")
        for index in universityArray {
            let university = index as! University
            print("Rating: \(university.rating)")
        }

    }
    
    func addListeningObserver() {
        // Define identifier
        let notificationName = Notification.Name("submitCourseFeedback")
        // Register to receive notification
        NotificationCenter.default.addObserver(self, selector: #selector(RatingTableViewController.submitCourseFeedback), name: notificationName, object: nil)
    }
    
    
    //MARK: Action Methods
    @IBAction func settingsButtonPressed(_ sender: UIBarButtonItem) {
        _ = self.navigationController?.popViewController(animated: true)
    }
}
