//
//  LoadingView.swift
//  DLogin
//
//  Created by Michele on 29/12/20.
//

import SwiftUI

struct LoadingView: View {
    @State var animation = false
    var body: some View {
        VStack{
            Circle()
                .trim(from: 0, to: 7)
                .stroke(Color("bottom"),lineWidth: 8)
                .frame(width: 75, height: 75)
                .rotationEffect(.init(degrees: animation ? 360:0))
                .padding(50)
        }
        .background(Color.white)
        .cornerRadius(20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.opacity(0.4).ignoresSafeArea(.all,edges: .all))
        .onAppear{
            withAnimation(Animation.linear(duration: 1)){
                animation.toggle()
            }
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
