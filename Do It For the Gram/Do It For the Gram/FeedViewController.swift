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

class FeedViewController: UIViewController {

    @IBOutlet weak var profileButton: UITabBarItem!
    @IBOutlet weak var photoButton: UITabBarItem!
    @IBOutlet weak var homeButton: UITabBarItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //get the user from the current user from parse
        user = PFUser.currentUser()
        
        if let user = user{
            print(user.username! + " is currently logged in")
        }else{
            print("error getting user")
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func onLogOutPress(sender: AnyObject) {
        //call the parse logout function
        PFUser.logOut()
        
        //segue back to the login screen
        self.performSegueWithIdentifier("feedToLoginSegue", sender: nil)
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
