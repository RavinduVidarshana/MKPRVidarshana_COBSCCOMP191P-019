//
//  SignupViewController.swift
//  NIBM_COVID19
//
//  Created by Digital-04 on 9/17/20.
//  Copyright © 2020 NIBM. All rights reserved.
//

import UIKit
import Firebase

class SignupViewController: UIViewController {

    
    @IBOutlet weak var firstName: UITextField!
    
    @IBOutlet weak var lastName: UITextField!
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var role: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBAction func btnSignUp(_ sender: Any) {
        
        if let email = email.text, let password = password.text {
            
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                
                if let e = error {
                    print(e)
                }
                else{
                    self.performSegue(withIdentifier: "SignupSegway", sender: self)
                    print("Success")
                }// ...
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
