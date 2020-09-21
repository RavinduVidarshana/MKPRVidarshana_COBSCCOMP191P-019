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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var firstName: UITextField!
    
    @IBOutlet weak var lastName: UITextField!
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var role: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    var ref: DatabaseReference!
    
    @IBAction func btnSignUp(_ sender: UIButton) {
        
        if let email = email.text, let password = password.text {
            
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                
                if let e = error {
                    print(e)
                    
                }
                else{
                    let userId = authResult?.user.uid
                    let fName = self.firstName.text
                    let lName = self.lastName.text
                    let emailID = self.email.text
                    let uRole = self.role.text
                    
                    self.ref = Database.database().reference()
                    
                    self.ref.child("users").child(userId ?? "").setValue(["username": fName,"lastname": lName,"email": emailID,"role": uRole])
                    
                    self.performSegue(withIdentifier: "SignupSegway", sender: self)
                    print("Success")
                    
                    // create the alert
                    let alert = UIAlertController(title: "Login Success", message: "Please answer this question.", preferredStyle: UIAlertController.Style.alert)
                    
                    // add an action (button)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                    
                    // show the alert
                    self.present(alert, animated: true, completion: nil)
                 
                }// ...
            }
        }
        
//       let fName = firstName.text
//       let lName = lastName.text
//       let emailID = email.text
//       let uRole = role.text
//
//        ref = Database.database().reference()
//        self.ref.child("users").childByAutoId().setValue(["username": fName,"lastname": lName,"email": emailID,"role": uRole])
//
        
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
