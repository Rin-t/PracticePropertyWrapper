//
//  ObservedObjectSampleView.swift
//  PracticePropertyWrapper
//
//  Created by Rin on 2023/04/23.
//

import SwiftUI

struct ObservedObjectSampleView: View {

    // ObservedObjectをつけないとviewModelのfuncの処理は走るけど、
    // 値はViewに反映されない。
    @ObservedObject var viewModel = ViewModel(text: "morning")

    var body: some View {
        VStack {
            Button("tapped") {
                viewModel.tappedButton()
            }
            .padding(.bottom, 16)
            Text(viewModel.text)
        }
    }
}

struct ObservedObjectSampleView_Previews: PreviewProvider {
    static var previews: some View {
        ObservedObjectSampleView()
    }
}

final class ViewModel: ObservableObject {
    
    // PublishedをつけないとviewModelのfuncの処理は走るけど、
    // 値はViewに反映されない。
    @Published var text: String

    init(text: String) {
        self.text = text
    }

    func tappedButton() {
        text = text == "morning" ? "evening" : "morning"
        print(text)
    }
}
