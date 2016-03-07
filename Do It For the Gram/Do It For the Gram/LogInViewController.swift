//
//  LogInViewController.swift
//  Do It For the Gram
//
//  Created by Matt on 3/6/16.
//  Copyright © 2016 Matt Del Signore. All rights reserved.
//

import UIKit
import Parse

class LogInViewController: UIViewController {

    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSignInPress(sender: AnyObject) {
        PFUser.logInWithUsernameInBackground(userNameField.text!, password: self.passwordField.text!) { (user: PFUser?, error: NSError?) -> Void in
            if user != nil{
                print("logged in succesfully")
                self.performSegueWithIdentifier("loginSegue", sender: nil)
            }else{
                print(error?.localizedDescription)
            }
        }
    }

    @IBAction func onSignUpPress(sender: AnyObject) {
        let user = PFUser() //create a new user object to send to the parse backend
        user.username = userNameField.text
        user.password = passwordField.text
        
        user.signUpInBackgroundWithBlock { (success:Bool, error:NSError?) -> Void in
            if success{
                print("new user added successfully")
                self.performSegueWithIdentifier("loginSegue", sender: nil)

            }else{
                print(error?.localizedDescription)
            }
        }
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
