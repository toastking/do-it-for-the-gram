//
//  PostViewController.swift
//  Do It For the Gram
//
//  Created by Matt on 3/8/16.
//  Copyright © 2016 Matt Del Signore. All rights reserved.
//

import UIKit

class PostViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var takePhotoButton: UIButton!
    @IBOutlet weak var cameraRollButton: UIButton!
    @IBOutlet weak var previewImageView: UIImageView!
    @IBOutlet weak var captionTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    
    var imageToAdd: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTakePhotoPress(sender: AnyObject) {
        //instantiate a photo camera controller
        let vc = UIImagePickerController()
        vc.delegate = self
        vc.allowsEditing = true
        vc.sourceType = UIImagePickerControllerSourceType.Camera
        
        self.presentViewController(vc, animated: true, completion: nil)
        
    }
    
    //delegate class
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let original = info[UIImagePickerControllerOriginalImage] as! UIImage
        let edited = info[UIImagePickerControllerEditedImage] as! UIImage
        
        //set the imageview on the page to be the image
        imageToAdd = original
        
        previewImageView.image = imageToAdd //set the preview image
        
        dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func onCameraRollPress(sender: AnyObject) {
        let vc = UIImagePickerController()
        vc.delegate = self
        vc.allowsEditing = true
        vc.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        
        self.presentViewController(vc, animated: true, completion: nil)
        
    }
    
    @IBAction func onSubmitPress(sender: AnyObject) {
        
        //TODO: add code to upload the image
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
