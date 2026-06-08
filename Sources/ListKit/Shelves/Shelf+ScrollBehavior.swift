//
//  Shelf+ScrollBehavior.swift
//  ListKit
//
//  Created by Daniel Saidi on 2020-12-12.
//  Copyright © 2020-2026 Daniel Saidi. All rights reserved.
//

import SwiftUI

/// This enum defines the scroll behavior of a ``Shelf``.
public enum ShelfScrollBehavior: Sendable, Hashable {

    /// The shelf wraps its content in a horizontal scroll view.
    case enabled

    /// The shelf renders its content without a scroll view.
    case disabled
}

public extension EnvironmentValues {

    /// The scroll behavior to apply to a ``Shelf``.
    @Entry var shelfScrollBehavior: ShelfScrollBehavior = .enabled
}

public extension View {

    /// Sets the scroll behavior to apply to a ``Shelf``.
    func shelfScrollBehavior(_ behavior: ShelfScrollBehavior) -> some View {
        environment(\.shelfScrollBehavior, behavior)
    }
}
