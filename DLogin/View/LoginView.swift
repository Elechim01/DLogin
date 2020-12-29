//
//  LoginView.swift
//  DLogin
//
//  Created by Michele on 28/12/20.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var model : ModelData
    var body: some View {
        if(UIScreen.main.bounds.height < 750){
            ScrollView{
                ZStack {
                    VStack{
                Spacer(minLength: 0)
                    Image("logo")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .padding(.horizontal)
                        .padding(.vertical,20)
                        .background(Color.white.opacity(0.2))
                        .cornerRadius(30)
                .padding(.top)
                VStack(spacing:4) {
                    HStack(spacing:0){
                        Text("Dating")
                            .font(.system(size: 35,weight:.heavy))
                            .foregroundColor(.white)
                        Text("Match")
                            .font(.system(size: 35, weight: .heavy))
                            .foregroundColor(.orange)
                    }
                    Text("lets choose your match")
                        .foregroundColor(Color.black.opacity(0.3))
                        .fontWeight(.heavy)
                }
                .padding(.top)
                VStack(spacing: 20){
                    CustomTextFolder(image: "person", placeolder: "Email", txt: $model.email)
                    CustomTextFolder(image: "lock", placeolder: "Password", txt: $model.password)

                }
                .padding(.top )
                Button(action: {
                    model.login()
                }, label: {
                    Text("Login")
                        .fontWeight(.bold)
                        .foregroundColor(Color("bottom"))
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 30)
                        .background(Color.white)
                        .clipShape(Capsule())
                })
                .padding(.top,22)
                HStack(spacing:12){
                    Text("Don't have an account?")
                        .foregroundColor(Color.white.opacity(0.7))
                    Button(action: {
                        model.isSignUp.toggle()
                    }, label: {
                        Text("Sign Up Now")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    })

                }
                .padding(.top,25)
                Button(action: {
                    model.resetPassword()
                }, label: {
                    Text("Forget Password?")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }).padding(.vertical,22)
                    }
                    if model.isLoading{
                        LoadingView()
                    }
                }
            }
            .background(LinearGradient(gradient: .init(colors: [Color("top"),Color("bottom")]), startPoint: .top, endPoint: .bottom).ignoresSafeArea(.all,edges: .all))

            .fullScreenCover(isPresented: $model.isSignUp, content: {
                    SignUpView(model: model)
            })
            .alert(isPresented: $model.isLinkSend, content: {
                Alert(title: Text("Message"), message: Text("Password Reset Link Has Been Sent."), dismissButton: .destructive(Text("Ok")))
            })
            .alert(isPresented: $model.alert, content: {
                Alert(title: Text("Message"), message: Text(model.alertMSg), dismissButton: .destructive(Text("OK")))
            })
        }
        else{
            ZStack {
                VStack{
                    Spacer(minLength: 0)
                        Image("logo")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .padding(.horizontal)
                        .padding(.vertical,20)
                        .background(Color.white.opacity(0.2))
                        .cornerRadius(30)
                    .padding(.top)
                    VStack(spacing:4) {
                        HStack(spacing:0){
                            Text("Dating")
                                .font(.system(size: 35,weight:.heavy))
                                .foregroundColor(.white)
                            Text("Match")
                                .font(.system(size: 35, weight: .heavy))
                                .foregroundColor(.orange)
                        }
                        Text("lets choose your match")
                            .foregroundColor(Color.black.opacity(0.3))
                            .fontWeight(.heavy)
                    }
                    .padding(.top)
                    VStack(spacing: 20){
                        CustomTextFolder(image: "person", placeolder: "Email", txt: $model.email)
                        CustomTextFolder(image: "lock", placeolder: "Password", txt: $model.password)
                        
                    }
                    .padding(.top )
                    Button(action: {
                        model.login()
                    }, label: {
                        Text("Login")
                            .fontWeight(.bold)
                            .foregroundColor(Color("bottom"))
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 30)
                            .background(Color.white)
                            .clipShape(Capsule())
                    })
                    .padding(.top,22)
                    HStack(spacing:12){
                        Text("Don't have an account?")
                            .foregroundColor(Color.white.opacity(0.7))
                        Button(action: {
                            model.isSignUp.toggle()
                        }, label: {
                            Text("Sign Up Now")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                        })
                        
                    }
                    .padding(.top,25)
                    Button(action: {
                        model.resetPassword()
                    }, label: {
                        Text("Forget Password?")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }).padding(.vertical,22)
                }
                if model.isLoading{
                    LoadingView()
                }
            }
                .background(LinearGradient(gradient: .init(colors: [Color("top"),Color("bottom")]), startPoint: .top, endPoint: .bottom).ignoresSafeArea(.all,edges: .all))
                .fullScreenCover(isPresented: $model.isSignUp, content: {
                        SignUpView(model: model)
                })
                .alert(isPresented: $model.isLinkSend, content: {
                    Alert(title: Text("Message"), message: Text("Password Reset Link Has Been Sent."), dismissButton: .destructive(Text("Ok")))
                })
                .alert(isPresented: $model.alert, content: {
                    Alert(title: Text("Message"), message: Text(model.alertMSg), dismissButton: .destructive(Text("OK")))
            })
            
        }
    }
}
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(model: ModelData())
    }
}
