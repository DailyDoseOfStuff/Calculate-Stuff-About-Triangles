//
//  ContentView.swift
//  CalculateSomethingApp
//
//  Created by ALLEN LIU on 9/2/26.
//  Calculate Jump power generated based on weight

import SwiftUI

struct ContentView: View {
    
    @State var Side1 = ""
    @State var Side2 = ""
    @State var DSide1 = 0.0
    @State var DSide2 = 0.0
    @State var answer = 0.0
    @State var showAlert = false
//    @State var SquareNAdd = 0.0
    
    func FindTriangle(){
        if let side1 = Double(Side1){
            DSide1 = side1
        } else {
            showAlert.toggle()
        }
        if let side2 = Double(Side2){
            DSide2 = side2
        } else {
            showAlert.toggle()
        }
        
        answer = sqrt(pow(DSide1, 2) + pow(DSide2, 2))
    }
    
    
    
    
    
    
    var body: some View {
        VStack {
            ZStack(alignment: .top){
                Text("Pythagorean Theorem")
                    .multilineTextAlignment(.center)
                    .padding()
                    .font(.largeTitle)
                    .bold()
                    .shadow(color: .yellow , radius: 12)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                        .frame(width:300, height: 80)
                        .foregroundStyle(.green))
                
                
            }
            
            Spacer()
            
            VStack{
                
            }
            
            TextField("Side 1 ", text:$Side1)
                    .textFieldStyle(.plain)
                    .padding()
                    .background(Color(.systemBackground))
                    .clipShape(
                        RoundedRectangle(
                            cornerSize: CGSize(width: 20, height: 20),
                            style: .continuous
                        )
                    )

            TextField("Side 2 ", text:$Side2)
                .textFieldStyle(.plain)
                .padding()
                .background(Color(.systemBackground))
                .clipShape(
                    RoundedRectangle(
                        cornerSize: CGSize(width: 20, height: 20),
                        style: .continuous
                    )
                )
            
            
            NavigationLink{
                AnswerView(answer:answer)
            } label: {
                ZStack{
                    Text("Review Length of 3rd side.")
                        .font(.default)
                        .textFieldStyle(.plain)
                        .padding()
                        .multilineTextAlignment(.center)
                        .background(
                            RoundedRectangle(cornerRadius:15)
                                .frame(width: 250, height: 50)
                                .foregroundStyle(.green)
                        )
                        
                }
                
            }
            
            Spacer()
            Spacer()
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
        .padding()
        .background(.purple)
        .alert("Put the numbers in not the letters ", isPresented: $showAlert, actions:{
            Button("I understand I have failed"){
                Side1 = ""
                Side2 = ""
            }
        })
    }
        
}

#Preview {
    ContentView()
}
