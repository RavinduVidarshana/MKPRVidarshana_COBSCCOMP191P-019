//
//  SurvayViewController.swift
//  NIBM_COVID19
//
//  Created by Digital-04 on 9/17/20.
//  Copyright © 2020 NIBM. All rights reserved.
//

import UIKit

class SurvayViewController: UIViewController {

    @IBOutlet weak var imgSurway: UIImageView!
    
    
    @IBOutlet weak var lblQuestions: UILabel!
    
    
    @IBOutlet weak var btnYes: UIButton!
    
    
    @IBOutlet weak var btnNo: UIButton!
    
    let quAndAns = [
        ["Are you having fever, cough, sore throat or headache?","No"],
        ["Have you been exposed with crowded places?","No"],
        ["Have you been interact with sick person?","No"],
        ["Have you been tarvel last 14 days?","No"]
    ]
    
    var queNo=0
    var total=0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        showImage()
    }
    
    
    @IBAction func btnSurwayAnswer(_ sender: UIButton) {
        let usrAnswer = sender.currentTitle
        let newAnswer = quAndAns[queNo][1]
        
        if newAnswer == usrAnswer {
            print("Write")
            total += 1
            print(total)
        }
        else{
            print("Wrong")
        }
        
        if queNo + 1 < quAndAns.count{
            queNo += 1
        }
        showImage()
    }
    func showImage(){
        imgSurway.image = UIImage(named: "survay\(queNo).png")
        lblQuestions.text = quAndAns[queNo][0]
    }
        
    
    @IBAction func btnStatus(_ sender: Any) {
        
        var status = "Good"
        if total > 2{
            status = "Good"
            
        }
        if total == 2 {
            status = "Meduim"
        }
        if total < 2{
            status = "In Risk"
        }
        self.performSegue(withIdentifier: "userDataSeg", sender: status)
    }
    
  
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if let destin = segue.destination as?  MyMenuViewController{
            if let uData = sender as? String{
                //destin.selectedDatedData = uData
            }
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
