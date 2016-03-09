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
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        //TODO: add code for setting the cell
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
