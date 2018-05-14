//
//  ViewController.swift
//  Mivi_Test
//
//  Created by rakeshkumar thammishetty on 14/05/18.
//  Copyright © 2018 Altair. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    var msn = ""
    var dataBalance = Int()
    var dataPackage = ""
    var expireDate = ""
    var credit = Int()
    
    @IBOutlet weak var emailTF: UITextField!
    
override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "details" {
            let detailsVC = segue.destination as! DetailsViewController
            detailsVC.msn = msn
            let creditString = "\(credit)"
            detailsVC.credit = creditString
            detailsVC.dataPackage = dataPackage
            let dataBalanceString = "\(dataBalance)"
            detailsVC.dataBalance = dataBalanceString
            detailsVC.expiryDate = expireDate
        }
    }
    
    // Login Function
    @IBAction func loginTapped(_ sender: Any) {
        if emailTF.text == msn as String
        {
            self.performSegue(withIdentifier: "details", sender: self)
        }else{
            let alertController = UIAlertController(title: "Invalid MSN", message: "Please enter valid MSN", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(defaultAction)
            
            present(alertController, animated: true, completion: nil)
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.emailTF.delegate = self
        self.readJson()
    }
    
    // Funtion to read collection json
    func readJson() {
        do {
            if let file = Bundle.main.url(forResource: "collection", withExtension: "json") {
                let data = try Data(contentsOf: file)
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                if let object = json as? [String: AnyObject] {
                    // json is a dictionary
                    print(object)
                    let included = object["included"] as AnyObject as! [AnyObject]
                    let attributeDict = included[0]["attributes"] as! Dictionary<String, AnyObject>
                    print(attributeDict)

                    self.msn = attributeDict["msn"] as AnyObject as! String
                    self.expireDate = (attributeDict["credit-expiry"] as AnyObject) as! String
                    self.credit = (attributeDict["credit"] as AnyObject) as! Int
                    let attributeDict1 = included[1]["attributes"] as! Dictionary<String, AnyObject>
                    print(attributeDict1)
                    self.dataBalance = (attributeDict1["included-data-balance"] as AnyObject) as! Int
                   let attributeDict2 = included[2]["attributes"] as! Dictionary<String, AnyObject>
                    print(attributeDict2)
                    self.dataPackage = (attributeDict2["name"] as AnyObject) as! String
                    print(self.msn)
                    print(self.credit)
                    print(self.dataBalance)
                    print(self.expireDate)
                    print(self.dataPackage)
                    
                } else if let object = json as? [Any] {
                    // json is an array
                    print(object)
                } else {
                    print("JSON is invalid")
                }
            } else {
                print("no file")
            }
        } catch {
            print(error.localizedDescription)
        }
    }

    // Dismiss keyboard on click of return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true);
        return false;
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

