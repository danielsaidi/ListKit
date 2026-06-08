//
//  View+ListSpacing.swift
//  ListKit
//
//  Created by Daniel Saidi on 2026-06-08.
//  Copyright © 2026 Daniel Saidi. All rights reserved.
//

import SwiftUI

public extension View {

    /// Applies a custom section spacing on supported platforms.
    func preferredSectionSpacing(
        _ spacing: Double
    ) -> some View {
        #if os(macOS)
        self
        #else
        self.listSectionSpacing(spacing)
        #endif
    }
}

#Preview {
    List {
        Section("Section 1") {
            Text("Text 1")
        }
        Section("Section 2") {
            Text("Text 2")
        }
    }
    .preferredSectionSpacing(10)
}
