//
//  ObservedObjectAndStateObjectView2.swift
//  PracticePropertyWrapper
//
//  Created by Rin on 2023/04/26.
//

import SwiftUI

struct CounterView_Previews: PreviewProvider {
    static var previews: some View {
        CounterView()
    }
}

final class DataSource: ObservableObject {
    @Published var counter = 0

    init() {
        print("init")
    }
}

struct CounterView: View {

    @State private var isDanger = false

    var body: some View {
        VStack {
            Button("change color") {
                isDanger.toggle()
            }

            if isDanger {
                Circle().foregroundColor(.red)
            } else {
                Circle().foregroundColor(.green)
            }
            CounterChildView()
        }
    }
}


struct CounterChildView: View {

    // @ObservedObjectにすると、change colorボタンをタップでcounterの値が0に戻る
    @StateObject var dataSource = DataSource()

    var body: some View {
        VStack {
            Button("increment counter") {
                dataSource.counter += 1
            }
            Text("count: \(dataSource.counter)")
        }
    }
}

//struct CounterView: View {
//
//    @StateObject var dataSource = DataSource()
//
//    var body: some View {
//        CounterChildView(dataSource: dataSource)
//    }
//}
//
//
//struct CounterChildView: View {
//
//    @ObservedObject var dataSource: DataSource
//
//    var body: some View {
//        VStack {
//            Button("increment counter") {
//                dataSource.counter += 1
//            }
//            Text("count: \(dataSource.counter)")
//        }
//    }
//}


