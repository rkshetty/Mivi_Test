//
//  DetailsViewController.swift
//  Mivi_Test
//
//  Created by rakeshkumar thammishetty on 14/05/18.
//  Copyright © 2018 Altair. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    var msn = ""
    var credit = ""
    var dataBalance = ""
    var expiryDate = ""
    var dataPackage = ""
    
    @IBOutlet weak var msnLabel: UILabel!
    
    @IBOutlet weak var creditLabel: UILabel!
    
    @IBOutlet weak var dataBalanceLabel: UILabel!
    
    @IBOutlet weak var expiryDateLabel: UILabel!
    
    @IBOutlet weak var dataPackageLabel: UILabel!
    
    @IBAction func doneTapped(_ sender: Any) {
        
        self.dismiss(animated: true, completion: {})
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        // Do any additional setup after loading the view.
        self.msnLabel.text = self.msn
        self.creditLabel.text = self.credit
        self.dataBalanceLabel.text = self.dataBalance
        self.expiryDateLabel.text = self.expiryDate
        self.dataPackageLabel.text = self.dataPackage
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // take ibaction for done and write this code inside it later
    //        self.dismiss(animated: true, completion: {})


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
