//
//  ObservedObjectAndStateObject.swift
//  PracticePropertyWrapper
//
//  Created by Rin on 2023/04/26.
//

import SwiftUI

struct ObservedObjectAndStateObject: View {

    @StateObject var viewModel = ObservedObjectAndStateObjectViewModel()


    var body: some View {
        NavigationView {
            VStack{
                Text(viewModel.mainCount.description)
                    .font(.title)

                NavigationLink("ObservedObject") {
                    ObservedObjectView(mainCount: $viewModel.mainCount)
                }
                .font(.title)
                .padding()

                NavigationLink("StateObject") {
                    StateObjectView(mainCount: $viewModel.mainCount)
                }
                .font(.title)
                .padding()

                Button("tap") {
                    viewModel.mainCount += 1
                }
            }
        }
    }
}

struct ObservedObjectAndStateObject_Previews: PreviewProvider {
    static var previews: some View {
        ObservedObjectAndStateObject()
    }
}

class ObservedObjectAndStateObjectViewModel: ObservableObject {
    @Published var mainCount = 0
}

final class StateObjectViewModel: ObservableObject {
    @Published var count = 0

    func addCount() {
        self.count += 1
    }
}

final class ObservedObjectViewModel: ObservableObject {
    @Published var count = 0

    func addCount() {
        self.count += 1
    }
}

struct StateObjectView: View {
    @StateObject var viewModel = StateObjectViewModel()
    @Binding var mainCount : Int
    

    var body: some View {
        VStack{
            Text("StateObject : \(viewModel.count.description)")
                .font(.title)
                .padding()
                .onTapGesture {
                    viewModel.addCount()
                }

            Button {
                self.mainCount += 1
            } label: {
                Text("change main view count")
                    .font(.title)
            }
            Text(self.mainCount.description)
                .font(.title)
        }
    }
}

struct ObservedObjectView: View {
    @ObservedObject var viewModel = ObservedObjectViewModel()
    @Binding var mainCount : Int

    var body: some View {
        VStack{
            Text("Observed : \(viewModel.count.description)")
                .font(.title)
                .padding()
                .onTapGesture {
                    viewModel.addCount()
                }

            Button {
                self.mainCount += 1
            } label: {
                Text("change main view count")
                    .font(.title)
            }
            Text(self.mainCount.description)
                .font(.title)

        }
    }
}
