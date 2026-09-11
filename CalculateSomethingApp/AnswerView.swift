//
//  AnswerView.swift
//  CalculateSomethingApp
//
//  Created by ALLEN LIU on 9/7/26.
//

import SwiftUI

struct AnswerView: View {

    let answer: Double
    var calculationType: String

    var body: some View {

        VStack{
            
            ZStack{
                VStack{
                    if calculationType == "answer"{
                        Text("As a result of the developer not being able to do basic math, your result is")
                            .foregroundStyle(.yellow)
                            .font(.largeTitle)
                            .bold()
                            .shadow(radius: 20)
                            .multilineTextAlignment(.center)
                    
                        Text(answer, format: .number.precision(.fractionLength(3)))
                            .foregroundStyle(.yellow)
                            .bold()
                            .font(.title)
                    } else {
                        Text("Your result for \(calculationType) is")
                            .foregroundStyle(.yellow)
                            .font(.largeTitle)
                            .bold()
                            .shadow(radius: 20)
                            .multilineTextAlignment(.center)
                        Text(answer, format: .number.precision(.fractionLength(3)))
                            .foregroundStyle(.yellow)
                            .bold()
                            .font(.title)
                    }
                    
                }
            }
            
        }
        .padding()
        .frame(maxWidth:.infinity, maxHeight: .infinity)
        .background(.green)
    }
}

#Preview {
    AnswerView(answer: 0.0, calculationType: "test")
}
