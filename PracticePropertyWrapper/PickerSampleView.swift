//
//  PickerSampleView.swift
//  PracticePropertyWrapper
//
//  Created by Rin on 2023/04/23.
//

import SwiftUI

struct PickerSampleView: View {

    @State private var selectedValue = "りんご"
    private let fruits = [
        "りんご",
        "みかん",
        "ばなな"
    ]

    var body: some View {
        Picker("", selection: $selectedValue) {
            ForEach(fruits, id: \.self) { item in
                Text(item)
            }
        }
    }
}

struct PickerSampleView_Previews: PreviewProvider {
    static var previews: some View {
        PickerSampleView()
    }
}
