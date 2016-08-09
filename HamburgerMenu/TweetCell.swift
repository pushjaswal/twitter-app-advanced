//
//  TweetCell.swift
//  TwitterApp
//
//  Created by Pushpinder Jaswal on 7/31/16.
//  Copyright © 2016 Pushpinder Jaswal. All rights reserved.
//

import UIKit

class TweetCell: UITableViewCell {
    
    @IBOutlet weak var thumbImageView: UIImageView!
  
    @IBOutlet weak var tweetTextLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    
    
    var tweet : Tweet! {
        didSet{
            tweetTextLabel.text = tweet.text
            thumbImageView.setImageWithURL((tweet.user?.profileURL)!)
            userNameLabel.text = tweet.user?.name as? String
            
            let formatter = NSDateFormatter()
            formatter.dateFormat = "EEE MMM d"
//            var time  = formatter.stringFromDate(tweet.timeStamp!)
//            timaStampLabel.text = time
            //
            //            if(tweet.retweetCount > 0){
            //                retweetCountLabel.text = "\(tweet.retweetCount)"
            //            }
            //            if(tweet.favoritesCount > 0){
            //                favoriteLabel.text = "\(tweet.favoritesCount)"
            //            }
            
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        thumbImageView.layer.cornerRadius = 3
        thumbImageView.clipsToBounds = true
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
