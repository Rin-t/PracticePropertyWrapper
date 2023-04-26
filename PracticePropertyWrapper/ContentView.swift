//
//  ContentView.swift
//  PracticePropertyWrapper
//
//  Created by Rin on 2023/04/23.
//

import SwiftUI

struct ContentView: View {

    @State private var text = "morning"

    var body: some View {
        VStack {
            Text(text)
                .padding(.bottom, 16)
            FirstChildView(text: $text)
        }
    }
}


// 子Viewで値を変更を親Viewの値に伝えるときはBindingを使用
// initでBinding<String>を使用する時は「_」を使用する
struct FirstChildView: View {

    @Binding private var text: String

    init(text: Binding<String>) {
        self._text = text
    }

    var body: some View {
        VStack {
            Text("FirstChildView")
                .padding(.bottom, 16)
            SecondChildView(text: $text)
        }
    }
}

struct SecondChildView: View {

    @Binding private var text: String

    init(text: Binding<String>) {
        self._text = text
    }

    var body: some View {
        Button("tap") {
            text = text == "morning" ? "evening" : "morning"
        }
        .padding(.bottom, 16)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
