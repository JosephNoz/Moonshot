//
//  Color-theme.swift
//  MoonShot
//
//  Created by Joseph Norris on 04/09/2023.
//

import Foundation
import SwiftUI

extension ShapeStyle where Self == Color {
    static var lightbackgroundColor: Color {
        Color(red: 0.1, green : 0.1, blue: 0.2)
    }
    static var darkbackgroundColor: Color {
        Color(red:0.1, green: 0.2, blue: 0.3)
    }
}


//struct Hello : ViewModifier{
//    func body(content: Content) -> some View {
//        content
//    }
//}
