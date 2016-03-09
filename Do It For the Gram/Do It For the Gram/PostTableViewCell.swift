//
//  PostTableViewCell.swift
//  Do It For the Gram
//
//  Created by Matt on 3/8/16.
//  Copyright © 2016 Matt Del Signore. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class PostTableViewCell: UITableViewCell {

    @IBOutlet weak var postImageView: PFImageView!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var timeStampLabel: UILabel!
    @IBOutlet weak var likeCountLabel: UILabel!
    
    var post:Post!{
        didSet{
            self.postImageView.file = post.media
            
            self.postImageView.loadInBackground()
            
            if let caption = post.caption{
            self.captionLabel.text = caption
            }else{
                self.captionLabel.text = ""
            }
            
            if let user = post.author{
                self.usernameLabel.text = user.username
            }
            
            //get the current date
            let date = NSDate()
            let difference = date.timeIntervalSinceDate(post.createdAt!)
            
            var timeElapsed = Int(difference)
            var timeUnits = "s"
            if timeElapsed > 60{
                timeElapsed /= 60
                timeUnits = "m"
                if timeElapsed > 60 {
                    timeElapsed /= 60
                    timeUnits = "h"
                    
                    if timeElapsed > 24{
                        timeElapsed /= 24
                        timeUnits = "d"
                        
                        if timeElapsed > 7{
                            timeElapsed /= 7
                            timeUnits = "w"
                        }
                    }
                }
            }
            timeStampLabel.text = "\(timeElapsed) \(timeUnits)"
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
