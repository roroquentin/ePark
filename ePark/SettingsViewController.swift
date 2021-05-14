//
//  SettingsViewController.swift
//  ePark
//
//  Created by Hasan Güzelmansur on 12.05.2021.
//

import UIKit
import Firebase

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func signOutClicked(_ sender: Any) {
        
        do{
            
            try Auth.auth().signOut()
            self.performSegue(withIdentifier: "toVc", sender: nil)
            
        }catch{
            
            print("HATA! Lütfen tekrar deneyin!")
            
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
