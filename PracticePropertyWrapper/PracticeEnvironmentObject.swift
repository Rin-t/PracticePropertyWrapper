//
//  PracticeEnvironmentObject.swift
//  PracticePropertyWrapper
//
//  Created by Rin on 2023/04/24.
//

import SwiftUI

struct PracticeEnvironmentObject: View {

    @EnvironmentObject var stateData: StateData

    var body: some View {
        VStack {
            ChildView()
                .padding(.bottom, 16)
            Text(stateData.isShowingHello ? "hello" : "evening")
        }
    }
}

struct PracticeEnvironmentObject_Previews: PreviewProvider {
    static var previews: some View {
        PracticeEnvironmentObject().environmentObject(StateData())
    }
}

struct ChildView: View {

    @EnvironmentObject var stateData: StateData

    var body: some View {
        Button("おしてね") {
            stateData.isShowingHello.toggle()
        }
    }
}

final class StateData: ObservableObject {
    @Published var isShowingHello = false
}
