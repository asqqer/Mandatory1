//
//  FirstViewController.swift
//  mandatory1
//
//  Created by Asger Deleuran on 4/22/18.
//  Copyright © 2018 Asger Deleuran. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate  {
    let imagePicker = UIImagePickerController()
    @IBOutlet var imageView: UIImageView!
    
    @IBAction func savebtn(_ sender: UIButton) {
    }
    
    @IBAction func btn(_ sender: UIButton) {
        imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        print("return form picking")
        let image = info[UIImagePickerControllerEditedImage] as! UIImage
        imageView.image = image
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.allowsEditing = true
        imageView.image = #imageLiteral(resourceName: "Firstphoto")
        imagePicker.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

