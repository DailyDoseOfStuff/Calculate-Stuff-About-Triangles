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
    @State var navigateToAnswer = false

    func FindSide3() -> Bool {
        guard let side1 = Double(Side1), let side2 = Double(Side2) else {
            showAlert = true
            return false
        }

        DSide1 = side1
        DSide2 = side2
        answer = sqrt(pow(DSide1, 2) + pow(DSide2, 2))
        return true
    }

    var body: some View {
        NavigationStack {
            VStack {
                ZStack(alignment: .top) {
                    Text("3rd side of Right Triangle")
                        .multilineTextAlignment(.center)
                        .padding()
                        .font(.largeTitle)
                        .bold()
                        .shadow(color: .yellow, radius: 12)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .frame(width: 300, height: 80)
                                .foregroundStyle(.green)
                        )
                }

                Spacer()

                TextField("Side 1 ", text: $Side1)
                    .textFieldStyle(.plain)
                    .padding()
                    .background(Color(.systemBackground))
                    .clipShape(
                        RoundedRectangle(
                            cornerSize: CGSize(width: 20, height: 20),
                            style: .continuous
                        )
                    )

                TextField("Side 2 ", text: $Side2)
                    .textFieldStyle(.plain)
                    .padding()
                    .background(Color(.systemBackground))
                    .clipShape(
                        RoundedRectangle(
                            cornerSize: CGSize(width: 20, height: 20),
                            style: .continuous
                        )
                    )

                Button("Reveal Length") {
                    if FindSide3() {
                        navigateToAnswer = true
                    }
                }
                .frame(width: 250, height: 50)
                .font(.title2)
                .foregroundStyle(.black)
                .background(
                    RoundedRectangle(cornerRadius: 30)
                        .frame(width: 300, height: 50)
                        .foregroundStyle(.blue)
                )
                .navigationDestination(isPresented: $navigateToAnswer) {
                    AnswerView(answer: answer, calculationType: "Hypotenuse length")
                }

                Spacer()
                Spacer()
                
                NavigationLink{
                    MenuSelectPage()
                } label: {
                    Text("Calculate Some Other Stuff Here")
                        .bold()
                        .font(.title)
                        .background(RoundedRectangle(cornerRadius:30)
                            .frame(width:365, height: 100)
                            .foregroundStyle(.yellow)
                        )
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
            .background(.purple)
            .alert(
                "Put the numbers in not the letters ",
                isPresented: $showAlert,
                actions: {
                    Button("I understand I have failed") {
                        Side1 = ""
                        Side2 = ""
                    }
                }
            )
        }
    }
}

#Preview {
    ContentView()
}
