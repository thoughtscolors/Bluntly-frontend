//
//  SearchEventsViewController.swift
//  Bluntly-dev
//
//  Created by Apple on 6/11/18.
//  Copyright © 2018 MEEU. All rights reserved.
//

import UIKit
import Apollo
import Kingfisher

class SearchViewCell: UITableViewCell {
    @IBOutlet weak var searchImage: UIImageView!
    @IBOutlet weak var searchTitle: UILabel!
    @IBOutlet weak var searchLocation: UILabel!
    @IBOutlet weak var searchDate: UILabel!
}

class searchBar: UISearchBar {
    let searchViewController = SearchEventsViewController()
    
    @IBAction func searchEvents() {
        searchViewController.searchBarTextDidEndEditing()
    }
    
    
}

class SearchEventsViewController: UITableViewController {
    
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchBar: searchBar!
    
    var searchEvents: [EventDetails]! {
        didSet {
            tableView.reloadData()
        }
    }
   
    
    @IBAction func searchBarTextDidEndEditing() {
        print("in search")
        let name = searchTextField.text
        print(name)
        apollo.fetch(query: EventsQuery(name: name!)) { [weak self] result, error in
            guard let events = result?.data?.eventbrite else { return }
            self?.searchEvents = events.map { ($0?.fragments.eventDetails)! }
        }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        searchBar.text = "search this"
//        apollo.fetch(query: EventsQuery(name: "deep house")) { [weak self] result, error in
//            guard let events = result?.data?.eventbrite else { return }
//            self?.searchEvents = events.map { ($0?.fragments.eventDetails)! }
//        }
        
    }
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    
    
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
        guard let events = self.searchEvents else { return 0 }
        // #warning Incomplete implementation, return the number of rows
        return events.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchCell", for: indexPath) as! SearchViewCell
        guard let events = self.searchEvents else { return UITableViewCell() }
        let eventDetails = events[indexPath.row]
        var url = URL(string: "https://cdn.herb.co/wp-content/uploads/2017/03/7_Things_Youll_1.jpg")!
        if (eventDetails.logo?.url != nil) {
            url = URL(string: (eventDetails.logo?.url)!)!
        }
        let resource = ImageResource(downloadURL: url)
        let image = UIImage(named: "Polygon")
        cell.searchImage.kf.setImage(with: resource, placeholder: image)
        cell.searchTitle?.text = eventDetails.name?.text
        cell.searchLocation.text = eventDetails.venue?.name
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE MMM d, yyyy - HH:mm"
        let formatterGet = DateFormatter()
        formatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        formatter.locale = Locale(identifier: "en_US")
        var eventDate = "2018-05-29T20:00:00"
        if (eventDetails.start?.local != nil) {
            eventDate = (eventDetails.start?.local)!
        }
        let date = formatterGet.date(from: eventDate)
        if (date != nil) {
            cell.searchDate.text = formatter.string(from: date!)
        } else {
            cell.searchDate.text = formatter.string(from: date!)
        }
        
        
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
