//
//  RegViewController.swift
//  lab2a
//
//  Created by KUET_CSE_MAC_01 on 9/23/19.
//  Copyright © 2019 cse kuet. All rights reserved.
//

import UIKit

class RegViewController: UIViewController {

    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func registerButtonTapped(_ sender: Any) {
        let userEmail = userEmailTextField.text;
        let userPassword = userPasswordTextField.text;
        let userRepeatPassword = repeatPasswordTextField.text;
        
        if(((userEmail)?.isEmpty)! || ((userPassword)?.isEmpty)! || ((userRepeatPassword)?.isEmpty)!)
        {
            displayMyAlertMessage(userMessage:"All fields are required!");
            return;
        }
        if(userPassword != userRepeatPassword)
        {
           displayMyAlertMessage(userMessage:"Password not matched!");
            return;
            
        }
        UserDefaults.standard.set(userEmail,forKey:"userEmail");
        UserDefaults.standard.set(userPassword,forKey:"userPassword");
        UserDefaults.standard.synchronize();
        
        var myAlert = UIAlertController(title:"Alert",message:"Registration is successful!", preferredStyle:UIAlertControllerStyle.alert);
        let okAction = UIAlertAction(title:"OK", style:UIAlertActionStyle.default){
            action in
            self.dismiss(animated: true,completion:nil);
        }
        myAlert.addAction(okAction);
        self.present(myAlert,animated: true,completion: nil);
    }

    func displayMyAlertMessage(userMessage: String)
    {
        var myAlert = UIAlertController(title:"Alert",message:userMessage, preferredStyle:UIAlertControllerStyle.alert);
        let okAction = UIAlertAction(title:"OK", style:UIAlertActionStyle.default,handler:nil);
        myAlert.addAction(okAction);
        self.present(myAlert,animated: true,completion: nil);
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
