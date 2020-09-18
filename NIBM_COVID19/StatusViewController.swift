//
//  StatusViewController.swift
//  NIBM_COVID19
//
//  Created by Digital-04 on 9/18/20.
//  Copyright © 2020 NIBM. All rights reserved.
//

import UIKit

class StatusViewController: UIViewController {

    @IBOutlet weak var statusimg: UIImageView!
    
    
    @IBOutlet weak var statuslbl: UILabel!
    
    private var _selectedDatedDate: String!
    
    var selectedDatedData : String{
        
        get{
            return  _selectedDatedDate
        }
        set{
            _selectedDatedDate = newValue
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        statuslbl.text = _selectedDatedDate
        
        if _selectedDatedDate == "Good"
        {
            statusimg.image = UIImage( named: "status0")
        }
            
        else if _selectedDatedDate == "Meduim"
        {
            statusimg.image = UIImage( named: "status1")
        }
            
        else if _selectedDatedDate == "In Risk"
        {
            statusimg.image = UIImage( named: "status2")
        }
        
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
