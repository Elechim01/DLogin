//
//  CustomTextFolder.swift
//  DLogin
//
//  Created by Michele on 28/12/20.
//

import SwiftUI

struct CustomTextFolder: View {
    var image : String
    var placeolder : String
    @Binding var txt : String
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .center), content: {
            Image(systemName: image)
                .font(.system(size: 24))
                .foregroundColor(Color("bottom"))
                .frame(width: 60, height: 60)
                .background(Color.white)
                .clipShape(Circle())
            
            ZStack{
                if placeolder == "Password" || placeolder == "Re-Enter"{
                    SecureField(placeolder,text: $txt)
                        .textContentType(.oneTimeCode)
                }else{
                    TextField(placeolder,text:$txt)
                }
            }
                .padding(.horizontal)
                .padding(.leading,65)
                .frame(height: 60)
                .background(Color.white.opacity(0.2))
                .clipShape(Capsule())
            
        })
        .padding()
    }
}

struct CustomTextFolder_Previews: PreviewProvider {
     @State static var txt = ""
    static var previews: some View {
        CustomTextFolder(image: "", placeolder: "", txt: $txt)
    }
}
