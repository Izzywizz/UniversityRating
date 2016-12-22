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
        
        for index in universityArray {
            let university = index as! University
            print(university.checked)
        }

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
        return self.universityCellAtIndex(indexPath: indexPath)
    }
    
    
    //MARK: Custom Cells
    func universityCellAtIndex(indexPath: IndexPath) -> UniversityTableViewCell {
        
        self.tableView.register(UINib.init(nibName: "UniversityCell", bundle: nil), forCellReuseIdentifier: "universityCell")
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "universityCell", for: indexPath) as! UniversityTableViewCell
        let uni = universityArray.object(at: indexPath.row) as! University
        cell.universitObject = uni
        cell.configureCell()
    
        return cell

    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let uni = universityArray.object(at: indexPath.row) as! University
        if uni.checked == true {
            return 100.0
        } else {
            return 0.0
        }
    }
    
    //MARK: Action Methods
    
    @IBAction func test(_ sender: Any) {
        print("rating accessed")
        for index in universityArray {
            let university = index as! University
            print("Rating: \(university.rating)")
        }
    }
    
    @IBAction func settingsButtonPressed(_ sender: UIBarButtonItem) {
        _ = self.navigationController?.popViewController(animated: true)
    }
}
