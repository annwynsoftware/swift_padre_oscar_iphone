//
//  AINewsTableViewController.swift
//  EnlaceCatolico IP
//
//  Created by Jose Matus on 14/06/14.
//  Copyright (c) 2014 annwynsoft. All rights reserved.
//

import UIKit

class AINewsTableViewController: UITableViewController {

    var news = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Padre Oscar"
        tableView.registerClass(AITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.separatorInset = UIEdgeInsets(top: 0.0, left: 5.0, bottom: 0.0, right: 5.0)
        
        // Fetching some data from hacker news.
        let session = NSURLSession.sharedSession()
        let url = NSURL(string: "http://ajax.googleapis.com/ajax/services/feed/load?v=1.0&num=30&q=http://www.avemariatv.org/padre-oscar?format=feed&type=rss")
        let dataTask = session.dataTaskWithHTTPGetRequest(url, completionHandler: {(data, response, error) -> Void in
            
            let entries = NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments, error: nil) as NSDictionary
            if let responseData = entries["responseData"] as? NSDictionary {
                if let feed = responseData["feed"] as? NSDictionary {
                    if let entries = feed["entries"] as? NSArray {
                        
                        self.news = entries
                        
                        dispatch_async(dispatch_get_main_queue()) {
                            self.tableView.reloadData()
                        }
                    }
                }
            }
            
        })
        
        dataTask.resume()
    }

    override func tableView(tableView: UITableView?, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }

    override func tableView(tableView: UITableView?, cellForRowAtIndexPath indexPath: NSIndexPath?) -> UITableViewCell? {
        let cell = tableView!.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as AITableViewCell
        
        if let path = indexPath {
            let entry = news[path.row] as NSDictionary
            cell.textLabel.text = entry["title"] as NSString
            cell.detailTextLabel.text = entry["link"] as NSString
        }

        return cell
    }
    
    override func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        if let path = indexPath {
            let entry = news[path.row] as NSDictionary
            let url = entry["link"] as NSString
            let title = entry["title"] as NSString
            let description = entry["content"]  as NSString
            let webViewController = AIWebViewController(htmltext: description)
            webViewController.title = title
          splitViewController.showDetailViewController(webViewController, sender: self)
        }
    }

}
