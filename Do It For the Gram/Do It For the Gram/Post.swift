//
//  Post.swift
//  Do It For the Gram
//
//  Created by Matt on 3/8/16.
//  Copyright © 2016 Matt Del Signore. All rights reserved.
//

import UIKit
import Parse

class Post: NSObject {
    
    var media: PFFile?
    var author: PFUser?
    var caption: String?
    var likesCount: Int?
    var commentsCount: Int?
    var createdAt: NSDate?
    
    
    init(object: PFObject) {
        self.media = object["media"] as? PFFile
        self.author = object["author"] as? PFUser
        self.caption = object["caption"] as? String
        self.likesCount = (object["likesCount"] as? Int) ?? 0
        self.commentsCount = (object["commentsCount"] as? Int) ?? 0
        //self.createdAt = object["createdAt"] as? NSDate
    }
    
    //function to make an array of posts from input of pfobjects
    class func postsFromObjects(array: [PFObject])->[Post]{
        var posts = [Post]() //initialize the array
        for obj in array{
            let post = Post(object: obj)
            posts.append(post)
        }
        return posts
    }
    
    class func postImage(image : UIImage?, withCaption caption:String?, withCompletion completion:PFBooleanResultBlock){
        let post = PFObject(className: "Post") //creat a PFObject with the classname of Post
        
        //add the fields to hte objet dictionary
        post["media"] = getPFFileFromImage(image)
        post["author"] = PFUser.currentUser()
        if let caption = caption{
            post["caption"] = caption
        }
        else{
            post["caption"] = ""
        }
        post["likesCount"] = 0
        post["commentsCount"] = 0
        
        //save the object and then call the block function
        post.saveInBackgroundWithBlock(completion)
    }
    
    class func getPFFileFromImage(image: UIImage?) -> PFFile? {
        // check if image is not nil
        if let image = image {
            // get image data and check if that is not nil
            if let imageData = UIImagePNGRepresentation(image) {
                return PFFile(name: "image.png", data: imageData)
            }
        }
        return nil
    }

}
