//
//  ContentView.swift
//  DLogin
//
//  Created by Michele on 28/12/20.
//

import SwiftUI
import Firebase

struct ContentView: View {
    @AppStorage("log_status")var status = false
    @StateObject var model = ModelData()
    var body: some View {
        ZStack {
            if status{
                VStack(spacing: 25){
                    Text("Logged In AS \(Auth.auth().currentUser?.email ?? "")")
                    Button(action: {
                        model.logOut()
                    }, label: {
                        Text("LogOut")
                            .fontWeight(.bold)
                    })
                }
            }else{
                LoginView(model: model)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
