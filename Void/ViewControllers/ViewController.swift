//
//  ViewController.swift
//  Void
//
//  Created by Marc Harvey on 31/12/2020.
//

import UIKit
import FirebaseUI


class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func startLogin(_ sender: Any) {
        //get default auth ui object
        let authUI = FUIAuth.defaultAuthUI()
        
        ///Cannot be nil else error returned
        guard authUI != nil else {
            return
                print(Error.self)
        }
        
        //set self as delegate
        authUI?.delegate = self
        ///Had to specidy here that was signing in with email
        authUI!.providers = [FUIEmailAuth()]
        
        ///get reference to the auth UIViewController - force unwrapped as it's already established that it's not nil
        let authViewController = authUI!.authViewController()
        
        //Show it
        present(authViewController, animated: true, completion: nil)
    }
}

extension ViewController: FUIAuthDelegate {
    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
        
        //If no error: continue as is
        guard error == nil else {
            ///Logs the error
            return
        }
        ///Segue to the FirebaseUI generated login page
        performSegue(withIdentifier: "goToHome", sender: self)
        
    }
}

