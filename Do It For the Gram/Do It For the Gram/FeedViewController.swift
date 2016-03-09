//
//  FeedViewController.swift
//  Do It For the Gram
//
//  Created by Matt on 3/8/16.
//  Copyright © 2016 Matt Del Signore. All rights reserved.
//

import UIKit
import Parse

var user: PFUser!

class FeedViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var posts: [Post]!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //get the user from the current user from parse
        user = PFUser.currentUser()
        
        if let user = user{
            print(user.username! + " is currently logged in")
        }else{
            print("error getting user")
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        
        //make the request to get the images
        // construct query
        let query = PFQuery(className: "Post")
        query.orderByDescending("createdAt")
        query.includeKey("author") //include this becausae it's a pointer to another obejct
        query.limit = 20
        
        // fetch data asynchronously
        query.findObjectsInBackgroundWithBlock { (posts: [PFObject]?, error: NSError?) -> Void in
            if let posts = posts {
                //set the posts
                self.posts = Post.postsFromObjects(posts)
                
                //reload the cells 
                self.tableView.reloadData()
                
            } else {
                print(error?.localizedDescription)
            }
        }
        
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier("PostCell", forIndexPath: indexPath) as! PostTableViewCell
        //assign the business
        cell.post = posts[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        if posts != nil{
            return posts.count
        }else{
            return 0
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func onLogOutPress(sender: AnyObject) {
        //call the parse logout function
        PFUser.logOut()
        
        //segue back to the login screen
       NSNotificationCenter.defaultCenter().postNotificationName("UserDidLogout", object: nil)
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
