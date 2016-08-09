//
//  Tweet.swift
//  TwitterApp
//
//  Created by Pushpinder Jaswal on 7/31/16.
//  Copyright © 2016 Pushpinder Jaswal. All rights reserved.
//

import UIKit

class Tweet: NSObject {
    
    var text: String?
    var timeStamp: NSDate?
    var retweetCount: Int = 0
    var favoritesCount: Int = 0
    var imageUrl: NSURL?
    var user: User?
    
    init(dictionary: NSDictionary) {
        text = dictionary["text"] as? String
        
        retweetCount = (dictionary["retweet_count"] as? Int) ?? 0
        favoritesCount = (dictionary["favourites_count"] as? Int) ?? 0
        
        let userDict = (dictionary["user"]as! NSDictionary)
        user = User(dictionary: userDict)
        
        //        let imageURLString = dictionary["profile_image_url_https"] as? String
        //        if imageURLString != nil {
        //            imageUrl = NSURL(string: imageURLString!)!
        //        } else {
        //            imageUrl = nil
        //        }
        
        let timeStampString = dictionary["created_at"] as?  String
        if let  timeStampString = timeStampString {
            let formatter = NSDateFormatter()
            formatter.dateFormat = "EEE MMM d HH:mm:ss Z Y"
            timeStamp = formatter.dateFromString(timeStampString)
        }
    }
    
    class func tweetsWithArray(dictionaries: [NSDictionary]) -> [Tweet]{
        
        var tweets = [Tweet]()
        
        for dictionary in dictionaries {
            let tweet = Tweet(dictionary: dictionary)
            tweets.append(tweet)
        }
        
        return tweets
        
    }
}
