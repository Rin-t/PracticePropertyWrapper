//
//  ContentView.swift
//  PracticePropertyWrapper
//
//  Created by Rin on 2023/04/23.
//

import SwiftUI

struct ContentView: View {

    @State var text = "morning"

    var body: some View {
        VStack {
            CustomButtonView(text: $text)
            Text(text)
        }
    }
}


// 子Viewで値を変更を親Viewの値に伝えるときはBindingを使用
// initでBinding<String>を使用する時は「_」を使用する
struct CustomButtonView: View {

    @Binding var text: String

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
