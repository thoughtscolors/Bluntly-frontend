//
//  TableViewController.swift
//  Bluntly-dev
//
//  Created by Apple on 6/6/18.
//  Copyright © 2018 MEEU. All rights reserved.
//

import UIKit
import Apollo
import Kingfisher

class TableViewCell: UITableViewCell {
    @IBOutlet weak var tableImage: UIImageView!
    @IBOutlet weak var cellTitle: UILabel!
    @IBOutlet weak var cellLocation: UILabel!
    @IBOutlet weak var cellDate: UILabel!
}

class TableViewController: UITableViewController {
    
    var fruits = ["Apple", "Apricot", "Banana", "Blueberry", "Cantaloupe", "Cherry",
                  "Clementine", "Coconut", "Cranberry", "Fig", "Grape", "Grapefruit",
                  "Kiwi fruit", "Lemon", "Lime", "Lychee", "Mandarine", "Mango",
                  "Melon", "Nectarine", "Olive", "Orange", "Papaya", "Peach",
                  "Pear", "Pineapple", "Raspberry", "Strawberry"]
    
    var events: [EventDetails]! {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        apollo.fetch(query: AllEventsQuery(userID: "123qwer")) { [weak self] result, error in
            guard let events = result?.data?.allEventbrite else { return }
            self?.events = events.map { ($0?.fragments.eventDetails)! }
//            print(self?.events!)
            
        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
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
        guard let events = self.events else { return 0 }
        // #warning Incomplete implementation, return the number of rows
        return events.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath) as! TableViewCell
        guard let events = self.events else { return UITableViewCell() }
        let eventDetails = events[indexPath.row]
        var url = URL(string: "https://cdn.herb.co/wp-content/uploads/2017/03/7_Things_Youll_1.jpg")!
        if (eventDetails.logo?.url != nil) {
            url = URL(string: (eventDetails.logo?.url)!)!
        }
        let resource = ImageResource(downloadURL: url)
        let image = UIImage(named: "Polygon")
        cell.tableImage.kf.setImage(with: resource, placeholder: image)
        cell.cellTitle?.text = eventDetails.name?.text
        cell.cellLocation.text = eventDetails.venue?.name
        cell.cellDate.text = eventDetails.start?.local
        
        return cell
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
