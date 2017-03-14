//
//  PostInfo.swift
//  snapChatProject
//
//  Created by Brandon Pearl on 3/12/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit

class PostInfo: NSObject {
    let image: UIImage
    let poster: String
    let timePosted: Date
    var postRead: Bool = false
    

    init(_ image: UIImage, _ poster: String) {
        self.image = image
        self.poster = poster
        self.timePosted = Date()
    }
    
    func getTimeSincePost() -> String {
        let timeSince = Int(Date().timeIntervalSince(timePosted))
        if timeSince < 60 {
            if timeSince == 1 {
                return "1 second ago"
            }
            return String(Int(timeSince)) + " seconds ago"
        } else {
            if Int(timeSince / 60) == 1 {
                return "1 minute ago"
            }
            return String(timeSince / 60) + " minutes ago"
        }
    }
    
    func getPoster() -> String {
        return poster
    }
    
    func isRead() -> Bool {
        return postRead
    }
    
    func setPostReadAndGetImage() -> UIImage {
        postRead = true
        return image
    }
}
