//
//  LoginViewController.swift
//  Bluntly-dev
//
//  Created by Apple on 6/7/18.
//  Copyright © 2018 MEEU. All rights reserved.
//

import UIKit


class LoginViewController: UIViewController {
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passField: UITextField!
    
    
    var userViewController: UserViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func login() {
        let newEmail = emailField.text
        let newPass = passField.text
        
        let register = LoginMutation(email: newEmail!, pass: newPass!)
        apollo.perform(mutation: register) { [weak self] result, error in guard let result = result?.data?.register else { return }
            if let error = error {
                print(error.localizedDescription)
                return
            }
            self?.userViewController.email = newEmail!
            return
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let interestsViewController = segue.destination as? InterestsViewController {
            interestsViewController.userViewController = userViewController
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
