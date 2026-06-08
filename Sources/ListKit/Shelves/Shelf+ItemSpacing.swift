//
//  Shelf+ItemSpacing.swift
//  ListKit
//
//  Created by Daniel Saidi on 2020-12-12.
//  Copyright © 2020-2026 Daniel Saidi. All rights reserved.
//

import SwiftUI

public extension EnvironmentValues {

    /// The spacing to apply between items in a ``Shelf``.
    @Entry var shelfItemSpacing: CGFloat = {
        #if os(tvOS)
        25
        #else
        10
        #endif
    }()
}

public extension View {

    /// Sets the spacing to apply between items in a ``Shelf``.
    func shelfItemSpacing(_ spacing: CGFloat) -> some View {
        environment(\.shelfItemSpacing, spacing)
    }
}
