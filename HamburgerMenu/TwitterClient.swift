//
//  TwitterClient.swift
//  TwitterApp
//
//  Created by Pushpinder Jaswal on 7/31/16.
//  Copyright © 2016 Pushpinder Jaswal. All rights reserved.
//

import UIKit
import BDBOAuth1Manager

class TwitterClient: BDBOAuth1SessionManager {
    
    static let sharedInstance = TwitterClient(baseURL: NSURL(string:"https://api.twitter.com"), consumerKey: "htGb7UMbFts2DImSKvjvEwDDo", consumerSecret: "GQwbAqURqhc8SGZ0xEJAfCeSyRzsocHTLonHRzWQ1JL3zbSZHw")
    var loginSuccess: (() -> ())?
    var loginFailure: ((NSError) -> ())?
    
    func login(success: () -> (), failure: (NSError) -> ()) {
        loginSuccess = success
        loginFailure = failure
        
        TwitterClient.sharedInstance.deauthorize()
        TwitterClient.sharedInstance.fetchRequestTokenWithPath("oauth/request_token", method: "GET", callbackURL: NSURL(string: "twitterdemo://oauth"), scope: nil,
                                                               success: { (requestToken:BDBOAuth1Credential!) -> Void  in
                                                                let url = NSURL(string: "https://api.twitter.com/oauth/authorize?oauth_token=\(requestToken.token)")
                                                                UIApplication.sharedApplication().openURL(url!)
                                                                
        }) {(error: NSError!) -> Void in
            print("error: \(error.localizedDescription)")
            self.loginFailure?(error)
        }
    }
    
    func logout() {
        User.currentUser = nil
        deauthorize()
        NSNotificationCenter.defaultCenter().postNotificationName(User.userDidLogoutNotification, object: nil)
    }
    
    func handleOpenURL(url: NSURL){
        let requestToken = BDBOAuth1Credential(queryString: url.query)
        fetchAccessTokenWithPath("oauth/access_token", method: "POST", requestToken: requestToken, success: { (accessToken: BDBOAuth1Credential!) -> Void in
            print("I got access!")
            
            self.currentAccount({ (user: User) -> () in
                User.currentUser = user
                self .loginSuccess?()
                }, failure: { (error: NSError) -> () in
                    self.loginFailure?(error)
            })
            
            //            client.currentAccount()
            //            client.homeTimeline({ (tweets: [Tweet]) -> () in
            //                for tweet in tweets{
            //                    print(tweet.text)
            //                }
            //                }, failure: { (error: NSError) -> () in
            //                    print(error.localizedDescription)
            //            })
            
        }) { (error: NSError!) -> Void in
            print("Error: \(error.localizedDescription)")
            self.loginFailure?(error)
        }
    }
    
    func homeTimeline(success: ([Tweet]) -> (), failure: (NSError) ->  ()){
        GET("1.1/statuses/home_timeline.json", parameters: nil, progress: nil, success: {(task: NSURLSessionDataTask, response: AnyObject?) -> Void in
            //print("account \(response)")
            let tweetsDictionary = response as? [NSDictionary]
            let tweets = Tweet.tweetsWithArray(tweetsDictionary!)
            
            success(tweets)
            } , failure: { (task: NSURLSessionDataTask?, error: NSError) in
                failure(error)
        })
        
    }
    
    func currentAccount(success: (User) -> (), failure: (NSError) -> ()) {
        GET("1.1/account/verify_credentials.json", parameters: nil, progress: nil, success: {(task: NSURLSessionDataTask, response: AnyObject?) -> Void in
            //print("account \(response)")
            let userDictionary = response as? NSDictionary
            let user = User(dictionary: userDictionary!)
            
            success(user)
            
            print("User: \(user.name)")
            
            } , failure: { (task: NSURLSessionDataTask?, error: NSError) -> Void in
                print("Error: \(error)")
                failure(error)
        })
    }
    
}
