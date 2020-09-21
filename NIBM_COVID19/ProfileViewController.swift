//
//  ProfileViewController.swift
//  NIBM_COVID19
//
//  Created by Digital-04 on 9/18/20.
//  Copyright © 2020 NIBM. All rights reserved.
//
//

import UIKit
import Firebase

class ProfileViewController: UIViewController {

    
    

    @IBOutlet weak var firstname: UILabel!
    @IBOutlet weak var lastname: UILabel!
    @IBOutlet weak var role: UILabel!
    @IBOutlet weak var email: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        var ref: DatabaseReference!
        
        ref = Database.database().reference()
        let userID = Auth.auth().currentUser?.uid
        ref.child("users").child(userID!).observeSingleEvent(of: .value, with:{(snapshot) in
            
            if let user = snapshot.value as? [String : String] {
                print(user)
                self.firstname.text = user["username"]!
                self.lastname.text = user["lastname"]
                self.email.text = user["email"]
                self.role.text = user["role"]
            }
        }){ (error) in
            print(error.localizedDescription)
        }
        
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func btnLogout(_ sender: UIButton) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            self.navigationController?.popViewController(animated: true)
        }
        catch let  SignOutError as NSError {
            print("Error: %@", SignOutError)
        }
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
