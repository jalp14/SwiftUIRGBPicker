//
//  ContentView.swift
//  SwiftUIRGBPicker
//
//  Created by Jalp on 27/06/2019.
//  Copyright © 2019 JDC0rp. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    
    @State var rValue : Double
    @State var gValue : Double
    @State var bValue : Double
    @State var hexValue : String
    @State var didShowAlert = false
    
    var body: some View {
        VStack {
            Rectangle()
            .foregroundColor(Color(red: rValue, green: gValue, blue: bValue, opacity: 1.0))
            .cornerRadius(CGFloat(13))
            .shadow(radius: CGFloat(9))
            .padding(.horizontal, CGFloat(10))
            .padding(.top, CGFloat(5))
            Text("R : \(Int(rValue*255))  G : \(Int(gValue*255))  B : \(Int(bValue*255))")
            VStack {
                HStack {
                    Text("0").color(.red)
                    Slider(value : $rValue, from: 0.0, through: 1.0)
                    Text("255").color(.red)
                    }.padding()
                HStack {
                    Text("0").color(.green)
                    Slider(value : $gValue, from: 0.0, through: 1.0)
                    Text("255").color(.green)
                    }.padding()
                HStack {
                    Text("0").color(.blue)
                    Slider(value : $bValue, from: 0.0, through: 1.0)
                    Text("255").color(.blue)
                    }.padding()
                
                Button(action: {
                    self.didShowAlert = true
                }) {
                    Text("Show Hex Value")
                    .accentColor(Color.black)
                    .padding()
                    .background(Color.red)
                } .cornerRadius(CGFloat(9))
                .presentation($didShowAlert) {
                    Alert(title: Text("Hex Value is "), message: Text(convertToHex(rValue: rValue, gValue: gValue, bValue: bValue)), dismissButton: .default(Text("OK")))
                }
            }
        }
    }
}


func convertToHex(rValue : Double, gValue : Double, bValue : Double) -> String {
    var rHex = ""
    var gHex = ""
    var bHex = ""
    
    rHex = String(Int(rValue*255), radix: 16, uppercase: true)
    gHex = String(Int(gValue*255), radix: 16, uppercase: true)
    bHex = String(Int(bValue*255), radix: 16, uppercase: true)
    
    return rHex + gHex + bHex
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView(rValue : 0.5, gValue : 0.5, bValue : 0.5, hexValue: "Nil", didShowAlert: false)
    }
}
#endif

