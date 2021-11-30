//
//  CategoryImage.swift
//  TodoListApp
//
//  Created by 志水拓哉 on 2021/11/18.
//

import SwiftUI

struct CategoryImage: View {
    var body: some View {
        Image(systemName: "tortoise.fill")
            .resizable()
            .scaledToFit()
            .foregroundColor(.white)
            .padding(2.0)
            .frame(width: 30, height: 30)
            .background(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
            .cornerRadius(6.0)
    }
}

struct CategoryImage_Previews: PreviewProvider {
    static var previews: some View {
        CategoryImage()
    }
}
