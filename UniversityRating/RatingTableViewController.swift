//
//  RatingTableViewController.swift
//  UniversityRating
//
//  Created by Izzy on 20/12/2016.
//  Copyright © 2016 Izzy. All rights reserved.
//

import UIKit

class RatingTableViewController: UITableViewController {

    let universityArray = UniversityModel.sharedIntstance.universityArray
//  varet universityTableCell = UniversityTableViewCell()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Table View loaded")
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
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

    
    func universityCellAtIndex(indexPath: IndexPath) -> UniversityTableViewCell {
        
        self.tableView.register(UINib.init(nibName: "UniversityCell", bundle: nil), forCellReuseIdentifier: "universityCell")
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "universityCell", for: indexPath) as! UniversityTableViewCell
        let uni = universityArray.object(at: indexPath.row) as! University
        cell.universitObject = uni
        cell.configureCell()
        
        return cell

    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return self.universityCellAtIndex(indexPath: indexPath)
    }
    
}
