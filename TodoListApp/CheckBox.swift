//
//  CheckBox.swift
//  TodoListApp
//
//  Created by 志水拓哉 on 2021/11/18.
//

import SwiftUI

//  where Label: View 型パラメータの条件
// ここではLabelがviewに適合することを条件に定義している
struct CheckBox<Label>: View where Label: View {
    // StateはSwiftUIで管理することを意味する
    // これをつけると、変数の変更を自動的に画面に反映するようになる
//    @State var checked: Bool = false
    // 他のViewから値を受け取れるようにする
    // 親Viewと同じ値をうけとりたい
    
    private var label: () -> Label
    
    public init(checked: Binding<Bool>, @ViewBuilder label: @escaping () -> Label) {
        // @ViewBuilderとはViewを改行で並べて列挙して、
        // 複数のViewを渡す? 意味不
        // binding構造体にアクセスしたいので_をつけている
        self._checked = checked
        self.label = label
    }
    
    @Binding var checked: Bool
    var body: some View {
        HStack {
            Image(systemName: checked ? "checkmark.circle" : "circle")
                .onTapGesture {
                    self.checked.toggle()
            }
            label()
        }
        // $はBinding構造体
        // 値を複数のViewで共有するための構造体
//        Toggle(isOn: $checked) {
//            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//        }
    }
}

struct CheckBox_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            // Binding方の変数を渡さないないといけない
            // 固定値を渡したい場合はconstant
            CheckBox(checked: .constant(false)) {
                Text("牛乳を買う")
            }
            CheckBox(checked: .constant(true)) {
                Image(systemName: "hand.thumbsup")
                Text("牛乳を買う")
            }
        }
    }
}
