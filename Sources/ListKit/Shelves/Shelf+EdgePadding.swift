//
//  Shelf+EdgePadding.swift
//  ListKit
//
//  Created by Daniel Saidi on 2020-12-12.
//  Copyright © 2020-2026 Daniel Saidi. All rights reserved.
//

import SwiftUI

public extension EnvironmentValues {

    /// The horizontal edge padding to apply to a ``Shelf``.
    @Entry var shelfEdgePadding: CGFloat? = {
        #if os(tvOS)
        35
        #else
        nil
        #endif
    }()
}

public extension View {

    /// Sets the horizontal edge padding to apply to a ``Shelf``.
    func shelfEdgePadding(_ padding: CGFloat?) -> some View {
        environment(\.shelfEdgePadding, padding)
    }
}
