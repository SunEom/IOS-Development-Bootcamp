//
//  ContentView.swift
//  SuneomCard
//
//  Created by 엄태양 on 2022/07/01.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(red: 0.17, green: 0.24, blue: 0.31)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image("suneom")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 170, height: 170
                    )
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .overlay(
                        Circle().stroke(Color.white, lineWidth: 5)
                    )
                
                Text("TaeYang Eom")
                    .font(Font.custom("Pacifico-Regular", size:40))
                    .bold()
                    .foregroundColor(.white)
                Text("iOS Developer")
                    .foregroundColor(.white)
                    .font(.system(size: 25))
                
                Divider()
                
                InfoView(text: "+82 010 1234 5678", imageName: "phone.fill")
                InfoView(text: "dkxl0701@gmail.com", imageName: "envelope.fill")
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

