//
//  MenuSelectPage.swift
//  CalculateSomethingApp
//
//  Created by ALLEN LIU on 9/8/26.
//

import SwiftUI

struct MenuSelectPage: View {


    var body: some View {
        
        NavigationStack{
            VStack{
                
                Text("Other calculations")
                    .foregroundStyle(.white)
                    .font(.largeTitle)
                    .bold()
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: 300, height: 50)
                            .foregroundStyle(.black)
                    )
                
                Spacer()
                
                NavigationLink{
                    CalculateLegGivenH()
                } label: {
                    Text("Length of leg given hyp & 1 leg")
                        .foregroundStyle(.black)
                        .font(.title2)
                        .bold()
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .frame(width: 380, height: 100 )
                                .foregroundStyle(.white)
                                .padding()
                            
                        )
                }
                .padding(22)
                
                
                NavigationLink{
                    BasicAddition()
                } label: {
                    Text("Basic Addition")
                        .foregroundStyle(.black)
                        .font(.title2)
                        .bold()
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .frame(width: 380, height: 100)
                                .foregroundStyle(.white)
                                .padding()
                            
                        )
                }
                .padding(.bottom, 20)
                
                NavigationLink{
                    ContentView()
                } label: {
                    Text("Find Hypotenuse given 2 legs")
                        .foregroundStyle(.black)
                        .font(.title2)
                        .bold()
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .frame(width: 380, height: 100)
                                .foregroundStyle(.white)
                                .padding()
                            )
                }
                .padding(15)
                
                Spacer()
                
                
                
                
        
            }
            .padding()
            .frame(maxWidth:.infinity, maxHeight: .infinity)
            .background(.green)
        }
    }
}

#Preview {
    MenuSelectPage()
}
