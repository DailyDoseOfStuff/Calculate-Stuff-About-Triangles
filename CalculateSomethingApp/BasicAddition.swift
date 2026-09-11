//
//  BasicAddition.swift
//  CalculateSomethingApp
//
//  Created by ALLEN LIU on 9/9/26.
//

import SwiftUI

struct BasicAddition: View {

    @State var Snum1 = ""
    @State var Snum2 = ""
    @State var num1 = 0.0
    @State var num2 = 0.0
    @State var ans = 0.0
    @State var showAlert = false
    @State var navigateToAnswer = false

    
    func add() -> Bool {
        guard let n1 = Double(Snum1), let n2 = Double(Snum2) else {
            showAlert = true
            return false
        }
        
        num1 = n1
        num2 = n2
        ans = num1 + num2
        return true
        
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                MeshGradient(
                    width: 2,
                    height: 2,
                    points: [
                        [0, 0], [1, 0],
                        [0, 1], [1, 1],
                    ],
                    colors: [.gray, .purple, .blue, .gray]
                )
                .ignoresSafeArea()

                VStack {
                    
                    Text("Basic Addition?")
                        .foregroundStyle(.white)
                        .font(.largeTitle)
                        .bold()
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .frame(width: 350, height: 50)
                                .foregroundStyle(.black)
                        )
                    
                    Spacer()
                    TextField("Enter first number", text: $Snum1)
                        .textFieldStyle(.plain)
                        .padding()
                        .background(Color(.systemBackground))
                        .clipShape(
                            RoundedRectangle(
                                cornerSize: CGSize(width: 20, height: 20),
                                style: .continuous
                            )
                        )
                        .frame(width: 350)

                    TextField("Enter Second number", text: $Snum2)
                        .textFieldStyle(.plain)
                        .padding()
                        .background(Color(.systemBackground))
                        .clipShape(
                            RoundedRectangle(
                                cornerSize: CGSize(width: 20, height: 20),
                                style: .continuous
                            )
                        )
                        .frame(width: 350)

                    Button("Reveal Length") {
                        if add() {
                            navigateToAnswer = true
                        }
                    }
                    .frame(width: 250, height: 50)
                    .font(.title2)
                    .foregroundStyle(.black)
                    .bold()
                    .background(
                        RoundedRectangle(cornerRadius: 30)
                            .frame(width: 300, height: 50)
                            .foregroundStyle(.blue)
                    )
                    .navigationDestination(isPresented: $navigateToAnswer) {
                        AnswerView(answer: ans, calculationType: "answer")
                    }
                    
                    
                    Spacer()

                    NavigationLink {
                        MenuSelectPage()
                    } label: {
                        Text("Calculate Some Other Stuff Here")
                            .bold()
                            .font(.title)
                            .background(
                                RoundedRectangle(cornerRadius: 30)
                                    .frame(width: 365, height: 100)
                                    .foregroundStyle(.yellow)
                            )
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .alert(
                    "Put the numbers in not the letters ",
                    isPresented: $showAlert,
                    actions: {
                        Button("I understand I have failed") {
                            Snum1 = ""
                            Snum2 = ""
                        }
                    }

                )
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }

    }
}

#Preview {
    BasicAddition()
}
