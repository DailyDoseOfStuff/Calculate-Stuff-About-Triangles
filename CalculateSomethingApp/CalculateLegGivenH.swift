//
//  CalculateLegGivenH.swift
//  CalculateSomethingApp
//
//  Created by ALLEN LIU on 9/9/26.
//

import SwiftUI

struct CalculateLegGivenH: View {

    @State var Hyp = ""
    @State var Side = ""
    @State var DHyp = 0.0
    @State var DSide = 0.0
    @State var answer = 0.0
    @State var showAlert = false
    @State var navigateToAnswer = false

    func FindSide() -> Bool {
        guard let hyp = Double(Hyp), let side = Double(Side) else {
            showAlert = true
            return false
        }

        DHyp = hyp
        DSide = side
        answer = sqrt(pow(DHyp, 2) - pow(DSide, 2))
        return true
    }

    var body: some View {

        NavigationView {
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
                                .frame(width: 300, height: 100)
                                .foregroundStyle(.green)
                        )
                }

                
                Spacer()
                
                TextField("Hypotenuse", text: $Hyp)
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

                TextField("Side", text: $Side)
                    .textFieldStyle(.plain)
                    .padding()
                    .background(Color(.systemBackground))
                    .clipShape(
                        RoundedRectangle(
                            cornerSize: CGSize(width: 20, height: 20),
                            style: .continuous
                        )
                    )
                    .frame(width:350)

                Button("Reveal Length") {
                    if FindSide() {
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
                    AnswerView(answer: answer, calculationType: "Leg length")
                }
                
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
            .frame(maxWidth:.infinity, maxHeight: .infinity)
            .background(.orange)
            .alert(
                "Put the numbers in not the letters ",
                isPresented: $showAlert,
                actions: {
                    Button("I understand I have failed") {
                        Hyp = ""
                        Side = ""
                    }
                }
            )

        }
    }
}

#Preview {
    CalculateLegGivenH()
}
