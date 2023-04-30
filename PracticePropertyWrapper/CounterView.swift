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

final class Counter: ObservableObject {
    @Published var value = 0

    init() {
        print("init Counter")
    }
}

struct CounterView: View {

    @State private var isSun = false

    var body: some View {
        VStack {

            Button("change image") {
                isSun.toggle()
            }
            .padding(.bottom, 16)

            if isSun {
                Image(systemName: "sun.max")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 120, height: 120)
            } else {
                Image(systemName: "moon")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 120, height: 120)
            }
            CounterChildView()
                .padding(.top, 16)
        }
    }
}


struct CounterChildView: View {

    // @ObservedObjectにすると、change colorボタンをタップでcounterの値が0に戻る
    @StateObject var dataSource = Counter()

    init() {
        print("init CounterChildView")
    }

    var body: some View {
        VStack {
            Button("カウントアップ") {
                dataSource.value += 1
            }
            .padding(.bottom, 16)
            
            Text("count: \(dataSource.value)")
                .font(.system(size: 20))
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


