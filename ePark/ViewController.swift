//
//  ViewController.swift
//  ePark
//
//  Created by Hasan Güzelmansur on 12.05.2021.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var eMailText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signInClicked(_ sender: Any) {
        performSegue(withIdentifier: "toMap", sender: nil)
    }
    
    
    @IBAction func signUpClicked(_ sender: Any) {
        
        if eMailText.text != "" && passwordText.text != "" {
            
            Auth.auth().createUser(withEmail: eMailText.text!, password: passwordText.text!) { (authdata, error) in
                if error != nil {
                    
                    self.makeAlert(titleIn: "HATA!!", messageIn: error?.localizedDescription ?? "Error")
                    
                }else{
                    self.performSegue(withIdentifier: "toMap", sender: nil)
                }
            }
            
            
        }else{
            
            makeAlert(titleIn: "HATA!!", messageIn: "eMail ve şifre boş olamaz!!")
            
        }
        
        
        
    }
    
    func makeAlert(titleIn:String, messageIn:String){
        
        let alert = UIAlertController(title: titleIn, message: messageIn, preferredStyle: UIAlertController.Style.alert)
        
        let okButton = UIAlertAction(title: "Tamam", style: UIAlertAction.Style.default, handler:   nil)
        
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
        
    }
    
}

