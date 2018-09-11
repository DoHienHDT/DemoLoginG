//
//  ViewController.swift
//  DemoLoginG
//
//  Created by dohien on 11/09/2018.
//  Copyright © 2018 dohien. All rights reserved.
//

import UIKit
import GoogleSignIn
class ViewController: UIViewController, GIDSignInUIDelegate, GIDSignInDelegate{
    
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var photoImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().delegate = self
        
        let googleSignInButton = GIDSignInButton()
        googleSignInButton.center = view.center

        view.addSubview(googleSignInButton)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if error != nil {
            print(error ?? "google error")
            return
        }
        emailLabel.text = user.profile.email
        photoImage.image = UIImage(url: user.profile.imageURL(withDimension: 400))
        GIDSignIn.sharedInstance().signOut()
        print(user.profile.imageURL(withDimension: 400))
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  

}
extension UIImage {
    convenience init?(url: URL?) {
        guard let url = url else { return nil }
        do {
            let data = try Data(contentsOf: url)
            self.init(data: data)
        } catch {
            print("Cannot load image from url: \(url) with error: \(error)")
            return nil
        }
    }
}
