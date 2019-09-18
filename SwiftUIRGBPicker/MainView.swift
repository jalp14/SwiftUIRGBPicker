//
//  MainView.swift
//  SwiftUIRGBPicker
//
//  Created by Jalp on 18/09/2019.
//  Copyright © 2019 JDC0rp. All rights reserved.
//

import SwiftUI

struct MainView: View {
    
    // Binding Values
    @State var rValue : Double
    @State var gValue : Double
    @State var bValue : Double
    @State var hexValue : String
    @State var didShowAlert : Bool
    
    let sliderRange = 0.0...1.0
    
    var body: some View {
        VStack {
            // Large rectangle that shows the color
            Rectangle()
                .foregroundColor(Color(red: rValue, green: gValue, blue: bValue))
                .cornerRadius(CGFloat(13))
                .shadow(radius: CGFloat(9))
                .padding(.horizontal, CGFloat(10))
                .padding(.top, CGFloat(5))
            
            // Shows the current RGB values
            Text("Red : \(Int(rValue*255))   Green : \(Int(gValue*255))   Blue : \(Int(bValue*255))")
            
            VStack {
                // HStack for each slider
                // Red Slider
                HStack {
                    Text("0").foregroundColor(.red)
                    Slider(value: $rValue, in: sliderRange)
                    Text("255").foregroundColor(.red)
                }.padding()
                // Green Slider
                HStack {
                    Text("0").foregroundColor(.green)
                    Slider(value: $gValue, in: sliderRange)
                    Text("255").foregroundColor(.green)
                }.padding()
                // Blue Slider
                HStack {
                    Text("0").foregroundColor(.blue)
                    Slider(value: $bValue, in: sliderRange)
                    Text("255").foregroundColor(.blue)
                }.padding()
                // Convert to hex button
                Button(action : {
                    self.didShowAlert = true
                }) {
                    Text("Test button")
                        .accentColor(Color.black)
                        .padding()
                        .background(Color.red)
                }.cornerRadius(CGFloat(9))
                    .alert(isPresented: $didShowAlert) {
                        Alert(title: Text("Hex value is "), message: Text(convertToHex(rValue: rValue, gValue: gValue, bValue: bValue)), dismissButton: .default(Text("OK")))
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
    
    
    
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(rValue : 0.5, gValue : 0.5, bValue : 0.5, hexValue: "nil", didShowAlert: false)
    }
}
