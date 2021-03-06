//
//  MainTableViewController.swift
//  SimpleCountry
//
//  Created by Joseph Mennemeier on 5/27/16.
//  Copyright © 2016 Joseph Mennemeier. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {

    private var tableData = [String]()
    
    var country: [CountryInfo] = Countries
    
    var nameString = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        parseJSON()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    func parseJSON() {
        let urlPath = "https://restcountries.eu/rest/v1/all"
        let url = NSURL(string: urlPath)
        
        let session = NSURLSession.sharedSession()
        
        let task = session.dataTaskWithURL(url!, completionHandler: {data, response, error -> Void in
            if data != nil {
            do {
                let jsonResult = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as! NSArray
                
                
                dispatch_async(dispatch_get_main_queue(),{
                    self.tableView.reloadData()
                
                for results in jsonResult {
                    if let countryName = results["name"] as? String {
                        print(countryName)
                        self.nameString.append(countryName)
                        self.tableView.reloadData()
                    }
                    dispatch_async(dispatch_get_main_queue(),{
                        self.tableView.reloadData()
                    })
                    }
                })
                
            } catch let error as NSError {
                print(error.localizedDescription)
            }
            
            }else {
                print("error")
            }
        })
        task.resume()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return nameString.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! CountryNameTableViewCell

        let countryList = nameString[indexPath.row] as String
        
        cell.nameLabel.text = countryList
        // self.tableView.reloadData()
        // print("TableView has \(tableData.count) items in list.")

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
