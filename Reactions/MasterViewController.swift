//
//  ViewController.swift
//  Reactions
//
//  Created by Robert Mylne on 21/06/2016.
//  Copyright © 2016 Robert Mylne. All rights reserved.
//

import UIKit
import CameraManager

class MasterViewController: UIViewController {
    
    let cameraManager = CameraManager()
    var image: UIImage?
    
    @IBOutlet weak var imagePreview: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cameraManager.addPreviewLayerToView(imagePreview)
        cameraManager.cameraDevice = .Front
        cameraManager.cameraOutputMode = .StillImage
        cameraManager.cameraOutputQuality = .High
        cameraManager.writeFilesToPhoneLibrary = false
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "previewSegue" {
            let dvc = segue.destinationViewController as! PreviewViewController
            dvc.image = image
        }
    }
    

    @IBAction func takePhoto(sender: AnyObject) {
        cameraManager.capturePictureWithCompletition({ (image, error) -> Void in
        
            self.image = image
            
            self.performSegueWithIdentifier("previewSegue", sender: nil)
        
        })
    }
}

