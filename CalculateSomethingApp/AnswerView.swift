//
//  AnswerView.swift
//  CalculateSomethingApp
//
//  Created by ALLEN LIU on 9/7/26.
//

import SwiftUI

struct AnswerView: View {

    let answer: Double

    var body: some View {

        Text("3rd Side Length is \(answer).")
            .foregroundStyle(.blue)

    }
}

#Preview {
    AnswerView(answer: 5.0)
}
