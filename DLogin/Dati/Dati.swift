//
//  Dati.swift
//  DLogin
//
//  Created by Michele on 28/12/20.
//

import Foundation
import UIKit
import SwiftUI
import Firebase

class ModelData : ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    @Published var isSignUp = false
    @Published var email_SignUp = ""
    @Published var pasword_SignUP = ""
    @Published var reEnterPassword = ""
    @Published var isLinkSend = false
//    Error Alerts
    @Published var alert = false
    @Published var alertMSg = ""
//    Loading
    @Published var isLoading = false
    
//    setto lo stato dell'utente
    @AppStorage("log_status")var status = false
//    Alertview With Textfields
    func resetPassword(){
        let alert = UIAlertController(title: "Reset Password", message: "Enter Your e-mail id To Reset Your Password", preferredStyle: .alert)
        alert.addTextField{(password) in
            password.placeholder = "Email"
        }
        let proceed = UIAlertAction(title: "Reset", style: .default, handler: {(_) in
//            sending password Link
            if alert.textFields![0].text != ""{
                
                withAnimation{
                    self.isLoading.toggle()
                }
                Auth.auth().sendPasswordReset(withEmail: alert.textFields![0].text!, completion: {(err) in
                    withAnimation{
                        self.isLoading.toggle()
                    }
                    if err != nil{
                        self.alertMSg = err!.localizedDescription
                        self.alert.toggle()
                        return
                    }
//                    Alerting User
                    self.alertMSg = "Password Reset Link Has Been Sent !!"
                    self.alert.toggle()
                })
            }
            
        })
        let cancel = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        alert.addAction(cancel)
        alert.addAction(proceed)
//        presenting
        UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true)
    }
//    singUp
    func signUp(){
        if email_SignUp == "" || pasword_SignUP == "" || reEnterPassword == ""{
            self.alertMSg = "Fill contents proprely !!!"
            self.alert.toggle()
            return
        }
        if pasword_SignUP != reEnterPassword{
            self.alertMSg = "Password Mismatch !!!"
            self.alert.toggle()
            return
        }
        withAnimation{
            self.isLoading.toggle()
        }
        Auth.auth().createUser(withEmail: email_SignUp, password: pasword_SignUP, completion: {(result,err) in
            withAnimation{
                self.isLoading.toggle()
            }
            if err != nil{
                self.alertMSg = err!.localizedDescription
                self.alert.toggle()
                return
            }
//            sending Verification Link
            result?.user.sendEmailVerification(completion: {(err) in
                if err != nil{
                    self.alertMSg = err!.localizedDescription
                    self.alert.toggle()
                    return
                }
//                Alerting User To Verify Email...
                self.alertMSg = "Email Verification Has Been Sent !!! Verify Your Email ID!!!"
                self.alert.toggle()
            })
            
        })
        
    }
//    Login
    func login(){
        if email == "" || password == ""{
            self.alertMSg = "Fill the contents properly !!!"
            self.alert.toggle()
            return
        }
        withAnimation{
            self.isLoading.toggle()
        }
        Auth.auth().signIn(withEmail: email, password: password, completion: {(result,err) in
            withAnimation{
                self.isLoading.toggle()
            }
            if err != nil {
                self.alertMSg = err!.localizedDescription
                self.alert.toggle()
                return
            }
//            checking if Users is verified or not...
//            if not verified means loggin out
            let user = Auth.auth().currentUser
            
           if !user!.isEmailVerified {
                self.alertMSg = "Please Verify Email Address!!"
                self.alert.toggle()
//                logout
                try! Auth.auth().signOut()
                return
            }
//            settings user status as true...
            withAnimation{
                self.status = true
            }
        })
    }
    
    func logOut() {
        try! Auth.auth().signOut()
        withAnimation{
            self.status = false
        }
//        clearing all data..
        email = ""
        password = ""
        email_SignUp = ""
        pasword_SignUP = ""
        reEnterPassword = ""
        
    }
}
//Checking With Smaller Devces
