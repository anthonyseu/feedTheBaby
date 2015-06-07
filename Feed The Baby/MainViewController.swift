//
//  MainViewController.swift
//  Feed The Baby
//
//  Created by Li Jiao on 5/16/15.
//  Copyright (c) 2015 Li Jiao. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let textCellIdentifier = "TextCell"

    var options: [String] = ["stopwatch"]

    @IBOutlet weak var optionsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Feed The Baby"
        
        // options table view
        self.optionsTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.optionsTableView.delegate = self
        self.optionsTableView.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.options.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! UITableViewCell
        
        let row = indexPath.row
        cell.textLabel?.text = self.options[row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        
        let row = indexPath.row
        if (row == 0) {
            // select stop watch 
            var stopWatchController = StopWatchViewController(nibName: "StopWatchViewController", bundle: nil)

            self.navigationController!.pushViewController(stopWatchController, animated: false)
        }
        println(self.options[row])
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
