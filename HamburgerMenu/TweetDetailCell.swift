//
//  TweetDetailCell.swift
//  HamburgerMenu
//
//  Created by Pushpinder Jaswal on 8/8/16.
//  Copyright © 2016 Pushpinder Jaswal. All rights reserved.
//

import UIKit

class TweetDetailCell: UITableViewCell {

    
    @IBOutlet weak var tweetTextLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var thumbImageView: UIImageView!
    
    var tweet : Tweet! {
        didSet{
            tweetTextLabel.text = tweet.text
            thumbImageView.setImageWithURL((tweet.user?.profileURL)!)
            userNameLabel.text = tweet.user?.name as? String
            
//            let formatter = NSDateFormatter()
//            formatter.dateFormat = "EEE MMM d"
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
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
