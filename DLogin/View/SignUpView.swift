//
//  SignUpView.swift
//  DLogin
//
//  Created by Michele on 28/12/20.
//

import SwiftUI

struct SignUpView: View {
    @ObservedObject var model : ModelData
    
    var body: some View {
        if UIScreen.main.bounds.height < 750 {
            ScrollView {
                ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top), content: {
                VStack{
                    Spacer(minLength: 0)
                    Image("logo")
                        .resizable()
                        .frame(width: 180, height: 180)
                        .padding(.horizontal)
                        .padding(.vertical,20)
                        .background(Color.white.opacity(0.2))
                        .cornerRadius(30)
                    VStack(spacing:4) {
                        HStack(spacing:0){
                            Text("New")
                                .font(.system(size: 35,weight:.heavy))
                                .foregroundColor(.white)
                            Text("Profile")
                                .font(.system(size: 35, weight: .heavy))
                                .foregroundColor(.orange)
                        }
                        Text("Create a profile for you")
                            .foregroundColor(Color.black.opacity(0.3))
                            .fontWeight(.heavy)
                    }
                    .padding(.top)
                    VStack(spacing: 20){
                        CustomTextFolder(image: "person", placeolder: "Email", txt: $model.email_SignUp)
                        CustomTextFolder(image: "lock", placeolder: "Password", txt: $model.pasword_SignUP)
                        CustomTextFolder(image: "lock", placeolder: "Re-Enter", txt: $model.reEnterPassword)
                        
                    }
                    .padding(.top)
                    Button(action: {
                        model.signUp()
                    }, label: {
                        Text("SignUP")
                            .fontWeight(.bold)
                            .foregroundColor(Color("bottom"))
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 30)
                            .background(Color.white)
                            .clipShape(Capsule())
                    })
                    .padding(.vertical,22)
                    
                    Spacer(minLength: 0)
                }
                Button(action: {
                    model.isSignUp.toggle()
                }, label: {
                    Image(systemName: "xmark")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.black.opacity(0.6))
                        .clipShape(Circle())
                })
                .padding(.trailing,2)
                .padding(.top,10)
                if model.isLoading{
                    LoadingView()
                }
            })
            }
            .background(LinearGradient(gradient: .init(colors: [Color("top"),Color("bottom")]), startPoint: .top, endPoint: .bottom).ignoresSafeArea(.all,edges: .all))
            .alert(isPresented: $model.alert, content: {
                Alert(title: Text("Message"), message: Text(model.alertMSg), dismissButton: .destructive(Text("OK"),action: {
//                    if email link sent means closing the signupview...
                    if model.alertMSg == "Email Verification Has Been Sent !!! Verify Your Email ID!!!"{
                        model.isSignUp.toggle()
                        model.email_SignUp = ""
                        model.pasword_SignUP = ""
                        model.reEnterPassword = ""
                    }
                }))
            })
        }
        else{
            ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top), content: {
            VStack{
                Spacer(minLength: 0)
                Image("logo")
                    .resizable()
                    .frame(width: 180, height: 160)
                    .padding(.horizontal)
                    .padding(.vertical,20)
                    .background(Color.white.opacity(0.2))
                    .cornerRadius(30)
                VStack(spacing:4) {
                    HStack(spacing:0){
                        Text("New")
                            .font(.system(size: 35,weight:.heavy))
                            .foregroundColor(.white)
                        Text("Profile")
                            .font(.system(size: 35, weight: .heavy))
                            .foregroundColor(.orange)
                    }
                    Text("Create a profile for you")
                        .foregroundColor(Color.black.opacity(0.3))
                        .fontWeight(.heavy)
                }
                .padding(.top)
                VStack(spacing: 20){
                    CustomTextFolder(image: "person", placeolder: "Email", txt: $model.email_SignUp)
                    CustomTextFolder(image: "lock", placeolder: "Password", txt: $model.pasword_SignUP)
                    CustomTextFolder(image: "lock", placeolder:  "Re-Enter", txt: $model.reEnterPassword)
                    
                }
                .padding(.top)
                Button(action: {
                    model.signUp()
                }, label: {
                    Text("SignUP")
                        .fontWeight(.bold)
                        .foregroundColor(Color("bottom"))
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 30)
                        .background(Color.white)
                        .clipShape(Capsule())
                })
                .padding(.vertical,22)
                
                Spacer(minLength: 0)
            }
            Button(
                action: {
                model.isSignUp.toggle()
            }, label: {
                Image(systemName: "xmark")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black.opacity(0.6))
                    .clipShape(Circle())
            })
            .padding(.trailing)
            .padding(.top,10)
                if model.isLoading{
                    LoadingView()
                }
                
        })
            .background(LinearGradient(gradient: .init(colors: [Color("top"),Color("bottom")]), startPoint: .top, endPoint: .bottom).ignoresSafeArea(.all,edges: .all))
            .alert(isPresented: $model.alert, content: {
                Alert(title: Text("Message"), message: Text(model.alertMSg), dismissButton: .destructive(Text("OK"),action: {
//                    if email link sent means closing the signupview...
                    if model.alertMSg == "Email Verification Has Been Sent !!! Verify Your Email ID!!!"{
                        model.isSignUp.toggle()
                        model.email_SignUp = ""
                        model.pasword_SignUP = ""
                        model.reEnterPassword = ""
                    }
                }))
            })
            
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(model: ModelData())
    }
}
