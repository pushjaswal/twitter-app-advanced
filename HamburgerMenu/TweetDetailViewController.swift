//
//  TweetDetailViewController.swift
//  HamburgerMenu
//
//  Created by Pushpinder Jaswal on 8/8/16.
//  Copyright © 2016 Pushpinder Jaswal. All rights reserved.
//

import UIKit

class TweetDetailViewController: UIViewController {
    
    
    @IBOutlet weak var tweetTextLabel: UILabel!
    @IBOutlet weak var retweetsLabel: UILabel!
    @IBOutlet weak var favoritesLabel: UILabel!
    @IBOutlet weak var thumbImageView: UIImageView!
    @IBOutlet weak var timeStampLabel: UILabel!
    
    
    
    var tweet: Tweet!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tweetTextLabel.text = tweet.text
        var retweetString = String(tweet.retweetCount)
        retweetsLabel.text = retweetString + " RETWEETS"
        
        var favoriteString = String(tweet.favoritesCount)
        favoritesLabel.text = favoriteString + " FAVORITES"
        
        thumbImageView.setImageWithURL((tweet.user?.profileURL)!)
        
        let formatter = NSDateFormatter()
        formatter.dateFormat = "EEE MMM d"
        var time  = formatter.stringFromDate(tweet.timeStamp!)
        timeStampLabel.text = time
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
