
//    public func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
//
//        if (error == nil) {
//            // Perform any operations on signed in user here.
//            let userId = user.userID                  // For client-side use only!
//            let idToken = user.authentication.idToken // Safe to send to the server
//            let fullName = user.profile.name
//            let givenName = user.profile.givenName
//            let familyName = user.profile.familyName
//            let email = user.profile.email
//            emailLabel.text = email
//            nameLabel.text = fullName
//            let userDetailViewController = DetailViewController()
//            userDetailViewController.nameString = user.profile.name
//            userDetailViewController.emailString = user.profile.email
//            userDetailViewController.imageString = user.profile.imageURL(withDimension: 400)
//            photoImage.imageUrlString(urlString: user.profile.imageURL(withDimension: 400))
//        } else {
//            print("\(error.localizedDescription)")
//        }
//    }

//    func sign(_ signIn: GIDSignIn!,
//              present viewController: UIViewController!) {
//        self.present(viewController, animated: true, completion: nil)
//    }
//    func sign(_ signIn: GIDSignIn!,
//              dismiss viewController: UIViewController!) {
//        self.dismiss(animated: true, completion: nil)
//    }
//
//    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
//        if error != nil {
//            print(error ?? "google error")
//            return
//        }
//        googleSignInButton.isHidden = true
//        photoImage.imageUrlString(urlString: user.profile.imageURL(withDimension: 400))
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let abcViewController = storyboard.instantiateViewController(withIdentifier: "ABCViewControlleridentifier") as! DetailViewController
//        abcViewController.title = "LoginGoogleDetail"
//        abcViewController.imageString = user.profile.imageURL(withDimension: 400)
//        abcViewController.nameString = user.profile.name
//        abcViewController.emailString = user.profile.email
//        navigationController?.pushViewController(abcViewController, animated: true)
//        emailLabel.text = user.profile.email
//        nameLabel.text = user.profile.name
//    }
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
    

    
    @IBOutlet weak var btnSignIn: UIButton!

    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var photoImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    let googleSignInButton = GIDSignInButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().delegate = self
//        googleSignInButton.center = view.center
//        view.addSubview(googleSignInButton)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func btnSignInGG(_ sender: UIButton) {
        GIDSignIn.sharedInstance().signIn()
        btnSignIn.isHidden = true
       
        
    }
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
                if error != nil {
                    print(error ?? "google error")
                    return
                }
                googleSignInButton.isHidden = true
                photoImage.imageUrlString(urlString: user.profile.imageURL(withDimension: 400))
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let abcViewController = storyboard.instantiateViewController(withIdentifier: "ABCViewControlleridentifier") as! DetailViewController
                abcViewController.title = "LoginGoogleDetail"
                abcViewController.imageString = user.profile.imageURL(withDimension: 400)
                abcViewController.nameString = user.profile.name
                abcViewController.emailString = user.profile.email
                navigationController?.pushViewController(abcViewController, animated: true)
                emailLabel.text = user.profile.email
                nameLabel.text = user.profile.name
}
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
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

extension UIImageView {
    func imageUrlString(urlString: URL) {
//        guard let url = URL(string: urlString) else {return}
        DispatchQueue.global().async {
            if let data = try?  Data(contentsOf: urlString) {
                DispatchQueue.main.async {
                    self.image = UIImage(data: data)
                }
            }
        }
    }
}
