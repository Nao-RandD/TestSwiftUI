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
        let message = Self._printChanges()
        let _ = print("ContentView \(message)")
        List {
            ForEach(nameList.indices, id: \.self) { index in
                HStack {
                    Button(action: {
                        print("🍻：ボタンが押されてselectInfoを更新")
                        selectInfo = Info(name: nameList[index])
//                        isPresentedNameTextView = true
                    }, label: {
                        Text(nameList[index])
                    })
                }
            }
        }
//        .sheet2(isPresented: $isPresentedNameTextView) {
//            NameTextView(name: selectInfo?.name ?? "値なし")
//            let message = Self._printChanges()
//            let _ = print("Sheet \(message)")
//        }
        // isPresentedでsheetを管理。初回選択で"値なし"と表示される
//        .sheet(isPresented: $isPresentedNameTextView) {
//            NameTextView(name: selectInfo?.name ?? "値なし")
//            let message = Self._printChanges()
//            let _ = print("Sheet \(message)")
//        }
//        // itemでsheetを管理。初回選択から選択した名前が表示される
//        .sheet(item: $selectInfo) { info in
//            NameTextView(name: info.name)
//        }
        .sheet3(item: $selectInfo) { info in
            NameTextView(name: info.name)
        }
    }
}

struct Info: Identifiable {
    let id = UUID()
    let name: String
}

extension View {
    public func sheet2<Content>(isPresented: Binding<Bool>,
                                onDissmiss: (() -> Void)? = nil,
                                @ViewBuilder content: @escaping () -> Content) -> some View where Content: View {
        print("🍻：ここで更新")
        return sheet(isPresented: isPresented, content: content)
    }

    public func sheet3<Item, Content>(item: Binding<Item?>,
                                      onDismiss: (() -> Void)? = nil,
                                      content: @escaping (Item) -> Content) -> some View where Item : Identifiable, Content : View {
        print("🍻：ここで更新")
        return sheet(item: item, content: content)
    }
}
