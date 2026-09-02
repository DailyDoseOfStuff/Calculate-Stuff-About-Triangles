//
//  ContentView.swift
//  CalculateSomethingApp
//
//  Created by ALLEN LIU on 9/2/26.
//  Calculate Jump power generated based on weight

import SwiftUI

struct ContentView: View {
    
    @State var weight = ""
    @State var DWeight = 0.0
    @State var Fn = 0.0
    @State var showAlert = false
    func FindFn(){
        if let DWeight = Double(weight){
            Fn = 9.8 * DWeight
        } else {
            showAlert.toggle()
        }
    }
    
    
    
    
    
    
    var body: some View {
        VStack {
            
            ZStack{
            //    RoundedRectangle(cornerRadius: 25)
             //       .frame(width: 150, height: 50)
                TextField("Enter weight in pounds", text:$weight)
                    .textFieldStyle(.plain)
                    .padding()
                    .background(Color(.systemBackground))
                    .clipShape(
                        RoundedRectangle(
                            cornerSize: CGSize(width: 20, height: 20),
                            style: .continuous
                        )
                    )

                
            }
            
            
            
            
            
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
        .padding()
        .background(.purple)
        .alert("Put the numbers in not the letters ", isPresented: $showAlert, actions:{
            Button("I understand I have failed"){
                weight = ""
            }
        })
    }
        
}

#Preview {
    ContentView()
}
