//
//  ListSelectItem.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2026-06-08.
//  Copyright © 2026 Daniel Saidi. All rights reserved.
//

import SwiftUI

/// This view can be used to show selection state in a list.
///
/// This view wraps the content view in an `HStack` and adds
/// a `selectionIndicator` to the trailing edge, if the item
/// is selected.
public struct ListSelectItem<Content: View, Indicator: View>: View {

    /// Create an item with a custom indicator view.
    ///
    /// - Parameters:
    ///   - isSelected: Whether or not the item is selected.
    ///   - selectionIndicator: The view to show for selected views.
    ///   - content: The list item content view.
    public init(
        isSelected: Bool,
        @ViewBuilder content: @escaping () -> Content,
        @ViewBuilder selectionIndicator: @escaping () -> Indicator
    ) {
        self.isSelected = isSelected
        self.selectionIndicator = selectionIndicator()
        self.content = content
    }

    /// Create an item with a custom indicator image.
    ///
    /// - Parameters:
    ///   - isSelected: Whether or not the item is selected.
    ///   - selectionIndicator: The image to show for selected views, by default `.checkmark`.
    ///   - content: The list item content view.
    public init(
        isSelected: Bool,
        selectionIndicator: Image = Image(systemName: "checkmark"),
        @ViewBuilder content: @escaping () -> Content
    ) where Indicator == Image {
        self.init(
            isSelected: isSelected,
            content: content,
            selectionIndicator: { selectionIndicator }
        )
    }

    private let isSelected: Bool
    private let selectionIndicator: Indicator
    private let content: () -> Content
    
    public var body: some View {
        HStack {
            content()
            Spacer()
            if isSelected {
                selectionIndicator
            }
        }
    }
}

#Preview {
    
    struct Preview: View {
        
        @State private var selection = 0

        var body: some View {
            List {
                ForEach(0...10, id: \.self) { index in
                    ListSelectItem(
                        isSelected: index == selection
                    ) {
                        Text("Item \(index)")
                    }
                    ListSelectItem(
                        isSelected: index == selection,
                    ) {
                        Text("Item \(index)")
                    } selectionIndicator: {
                        Image
                            .symbol("checkmark.circle.fill")
                            .foregroundColor(.green)
                    }
                }
            }
        }
    }
    
    return Preview()
}
