//
//  View+ListBackgroundGradient.swift
//  ListKit
//
//  Created by Daniel Saidi on 2026-06-08.
//  Copyright © 2026 Daniel Saidi. All rights reserved.
//

import SwiftUI

public extension View {

    /// Applies a single color gradient background.
    func listBackgroundGradient(
        _ color: Color
    ) -> some View {
        self.scrollContentBackground(.hidden)
            .background(color.gradient)
    }

    /// Applies a multi-color gradient background.
    func listBackgroundGradient(
        colors: [Color],
        startPoint: UnitPoint = .top,
        endPoint: UnitPoint = .bottom
    ) -> some View {
        self.scrollContentBackground(.hidden)
            .background(
                LinearGradient(
                    gradient: Gradient(colors: colors),
                    startPoint: startPoint,
                    endPoint: endPoint
                )
            )
    }
}

#Preview("Color") {
    List {}
        .listBackgroundGradient(.blue)
}

#Preview("Colors") {
    List {}
        .listBackgroundGradient(colors: [.mint, .blue])
}
