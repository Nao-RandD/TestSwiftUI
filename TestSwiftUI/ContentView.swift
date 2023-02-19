//
//  ContentView.swift
//  TestSwiftUI
//
//  Created by Nao RandD on 2023/02/15.
//

import SwiftUI

struct ContentView: View {
    @State var isPresentedNameTextView: Bool = false
    @State var selectInfo: Info?
    @State var nameList = [
        "ジョン",
        "キャサリン",
        "ボブ"
    ]

    var body: some View {
        List {
            ForEach(nameList.indices, id: \.self) { index in
                HStack {
                    Button(action: {
                        selectInfo = Info(name: nameList[index])
                        print("🍻：ボタンが押されてselectInfoを更新", selectInfo?.name ?? "値がないみたい")
                        isPresentedNameTextView = true
                    }, label: {
                        Text(nameList[index])
                    })
                }
            }
        }
        // isPresentedでsheetを管理。初回選択で"値なし"と表示される
        .sheet(isPresented: $isPresentedNameTextView) {
            NameTextView(name: selectInfo?.name ?? "値なし")
        }
        // itemでsheetを管理。初回選択から選択した名前が表示される
//        .sheet(item: $selectInfo) { info in
//            NameTextView(name: info.name)
//        }
    }
}

struct Info: Identifiable {
    let id = UUID()
    let name: String
}
