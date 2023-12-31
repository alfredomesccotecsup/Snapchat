//
//  ViewController.swift
//  MesccoSnapchat
//
//  Created by Mescco Quiespe, Rosendo Alfredo on 7/11/23.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
class IniciarSesionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Cualquier configuración adicional después de cargar la vista.
    }
    
    
    
    @IBOutlet weak var emailTextField: UITextField!
    
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func cerrarSesionTapped(_ sender: Any) {
        dismiss(animated: true, completion:nil)
    }
    
    
    @IBAction func iniciarSesionTapped(_ sender: Any) {
        // Intentar iniciar sesión con Firebase
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
            print("Intentando Iniciar Sesión")
            if error != nil {
                print("Se presentó el siguiente error: \(error)")
                Auth.auth().createUser(withEmail: self.emailTextField.text!, password:
                    self.passwordTextField.text!, completion: { (user, error) in
                    print("Intentando crear un usuario")
                    if error != nil {
                        print("Se presentó el siguiente error al crear el usuario: \(error)")
                    } else {
                        print("El usuario fue creado exitosamente")
                        
                        Database.database().reference().child("usuarios").child(user!.user.uid).child("email").setValue(user!.user.email)
                        let alerta = UIAlertController(title: "Creación de Usuario", message: "Usuario: \(self.emailTextField.text!) se creó correctamente.", preferredStyle: .alert)
                        let btnOK = UIAlertAction(title: "Aceptar", style: .default, handler: { (UIAlertAction) in
                            self.performSegue(withIdentifier: "iniciarsesionsegue", sender: nil)
                        })
                        alerta.addAction(btnOK)
                        self.present(alerta, animated: true, completion: nil)
                        
                        self.performSegue(withIdentifier: "iniciarsesionsegue", sender: nil)
                    }
                })
            } else {
                print("Inicio de sesión exitoso")
                self.performSegue(withIdentifier: "iniciarsesionsegue", sender: nil)
            }
        }
    }
    
}

