//
//  MenuViewController.swift
//  HamburgerMenu
//
//  Created by Pushpinder Jaswal on 8/6/16.
//  Copyright © 2016 Pushpinder Jaswal. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

   
    @IBOutlet weak var linkLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    private var greenNavigationontroller: UIViewController!
    private var blueNavigationontroller: UIViewController!
    private var pinkNavigationontroller: UIViewController!
    
    var viewControllers: [UIViewController] = []
    var hamburgerViewController: HamburgerViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        greenNavigationontroller = storyBoard.instantiateViewControllerWithIdentifier("GreenNavigationController")
        blueNavigationontroller = storyBoard.instantiateViewControllerWithIdentifier("BlueNavigationController")
        pinkNavigationontroller = storyBoard.instantiateViewControllerWithIdentifier("PinkNavigationController")
        
        viewControllers.append(greenNavigationontroller)
        viewControllers.append(blueNavigationontroller)
        viewControllers.append(pinkNavigationontroller)
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier("MenuCell", forIndexPath: indexPath) as! MenuCell
        
        let titles = ["Profile", "TimeLine", "Mentions"]

        cell.menuTitleLabel.text = titles[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        hamburgerViewController.contentViewController = viewControllers[indexPath.row]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
