//
//  ViewController.swift
//  MesccoSnapchat
//
//  Created by Mescco Quiespe, Rosendo Alfredo on 7/11/23.
//

import UIKit
import FirebaseAuth

class iniciarSesionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func emailTextField(_ sender: Any) {
    }
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func iniciarSesionTapped(_ sender: Any) {
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
            print("Intentando Iniciar Sesion")
            if error != nil {
                print("Se presentó el siguiente error: \(error)")
            } else {
                print("Inicio de sesion existoso")
            }
        }
    }

}

