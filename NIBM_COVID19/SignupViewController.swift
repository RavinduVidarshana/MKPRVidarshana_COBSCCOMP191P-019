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
    
    var ref: DatabaseReference!
    
    @IBAction func btnSignUp(_ sender: Any) {
        
        if let email = email.text, let password = password.text {
            
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                
                if let e = error {
                    print(e)
                }
                else{
                   // self.performSegue(withIdentifier: "SignupSegway", sender: self)
                    print("Success")
                }// ...
            }
        }
        
       let fName = firstName.text
       let lName = lastName.text
       let emailID = email.text
       let uRole = role.text

        ref = Database.database().reference()
        self.ref.child("users").childByAutoId().setValue(["username": fName,"lastname": lName,"email": emailID,"role": uRole])
        
        
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
