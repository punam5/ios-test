//
//  ViewController.swift
//  lab2a
//
//  Created by KUET_CSE_MAC_01 on 9/23/19.
//  Copyright © 2019 cse kuet. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidAppear(_ animated: Bool) {
        let isUserLoggedIn = UserDefaults.standard.bool(forKey:"isUserLoggedIn");
        if(!isUserLoggedIn){
            self.performSegue(withIdentifier: "log", sender: self);
            
        }
        
    }
    
    @IBAction func logoutButtonTapped(_ sender: Any) {
        UserDefaults.standard.set(false,forKey:"isUserLoggedIn");
        UserDefaults.standard.synchronize();
        self.performSegue(withIdentifier: "log", sender: self);
    }
    
}

