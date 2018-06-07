//
//  EventsViewController.swift
//  Bluntly-dev
//
//  Created by Apple on 6/4/18.
//  Copyright © 2018 MEEU. All rights reserved.
//

import UIKit
import Apollo
import Kingfisher

class EventTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var eventImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!

}

class EventsViewController: UITableViewController {

    var eventsArray: NSArray? = []
    var fruits = ["Apple", "Apricot", "Banana", "Blueberry", "Cantaloupe", "Cherry",
                  "Clementine", "Coconut", "Cranberry", "Fig", "Grape", "Grapefruit",
                  "Kiwi fruit", "Lemon", "Lime", "Lychee", "Mandarine", "Mango",
                  "Melon", "Nectarine", "Olive", "Orange", "Papaya", "Peach",
                  "Pear", "Pineapple", "Raspberry", "Strawberry"]


    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Events"
       apollo.fetch(query: EventsQuery(name: "cannabis")) { result, error in
            guard let events = result?.data?.eventbrite else { return }
            self.eventsArray = events as NSArray
            print(self.eventsArray)
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


     // MARK: - UITableViewDataController

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruits.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventCell", for: indexPath) as! EventTableViewCell

        cell.textLabel?.text = fruits[indexPath.row]
//        cell.locationLabel?.text = (eventsArray![indexPath.row] as AnyObject).venue.name
//        cell.timeLabel?.text = (eventsArray![indexPath.row] as AnyObject).start.local
        cell.locationLabel?.text = "SF"
        cell.timeLabel?.text = "Midnight"

        return cell
    }
}

//class EventsViewController: UITableViewController {
//
//        var fruits = ["Apple", "Apricot", "Banana", "Blueberry", "Cantaloupe", "Cherry", "Clementine", "Coconut", "Cranberry", "Fig", "Grape", "Grapefruit", "Kiwi fruit", "Lemon", "Lime", "Lychee", "Mandarine", "Mango", "Melon", "Nectarine", "Olive", "Orange", "Papaya", "Peach", "Pear", "Pineapple", "Raspberry", "Strawberry"]
//
//        // MARK: - Table view data source
//
//        override func numberOfSections(in tableView: UITableView) -> Int {
//            return 1
//        }
//
//        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//            return fruits.count
//        }
//
//        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//            let cell = tableView.dequeueReusableCell(withIdentifier: "EventCell", for: indexPath) as! EventTableViewCell
//
//            let fruitName = fruits[indexPath.row]
//            cell.textLabel?.text = fruitName
//            cell.imageView?.image = UIImage(named: fruitName)
//            cell.locationLabel.text = "SF"
//            cell.timeLabel.text = "Midnight"
//
//            return cell
//        }
//}

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */



//extension EventsViewController {
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let events = self.eventsArray else { return UITableViewCell() }
//        let cell = tableView.dequeueReusableCell(withIdentifier: "EventCell", for: indexPath)
//        print(events)
////            let name = eventsArray[indexPath.row].name.text!
////            cell.textLabel?.text = name
////            cell.locationLabel?.text = eventsArray![indexPath.row].venue.name
////            cell.timeLabel?.text = eventsArray![indexPath.row].start.local
//
//
//        //        let imageURL = !
//        //        let url = URL(string: (eventsArray![indexPath.row] as AnyObject).logo.url)!
//        //        let resource = ImageResource(downloadURL: url)
//        //        let image = UIImage(named: "Polygon")
//        //        eventImage.kf.setImage(with: resource, placeholder: image)
//
//        return cell
//    }
//
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "Events"
//    }
//}
