//
//  DetailViewController.swift
//  DemoLoginG
//
//  Created by dohien on 11/09/2018.
//  Copyright © 2018 dohien. All rights reserved.
//

import UIKit
import GoogleSignIn
class DetailViewController: UIViewController {
    
    
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    var imageString: URL?
    var nameString: String?
    var emailString: String?
    @IBOutlet weak var photoImageGoogle: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = nameString
        photoImageGoogle.imageUrlString(urlString: imageString!)
        emailLabel.text = emailString

    }
   


    @IBAction func BtnLogOutGG(_ sender: UIButton) {
        GIDSignIn.sharedInstance().signOut()
        navigationController?.isNavigationBarHidden = true
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation
  
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    

}
