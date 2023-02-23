//
//  ChangeTextView.swift
//  TestSwiftUI
//
//  Created by Nao RandD on 2023/02/17.
//

import SwiftUI

struct NameTextView: View {
    @State var name: String

    var body: some View {
        let message = Self._printChanges()
        let _ = print("NameTextView \(message)")
        Text(name)
    }
}
