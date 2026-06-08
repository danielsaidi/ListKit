//
//  Shelf.swift
//  ListKit
//
//  Created by Daniel Saidi on 2020-12-12.
//  Copyright © 2020-2026 Daniel Saidi. All rights reserved.
//

import SwiftUI

/// This view can be used to render a shelf title with a row
/// of horizontally scrolling items below.
///
/// You can disable scrolling with the `.shelfScrollBehavior`
/// view modifier. This can be useful when your shelf should
/// only have a single view that takes up the full available
/// width, for instance a `TabView` with paging.
///
/// Available view modifiers:
///
/// - ``SwiftUICore/View/shelfEdgePadding(_:)``
/// - ``SwiftUICore/View/shelfItemSpacing(_:)``
/// - ``SwiftUICore/View/shelfScrollBehavior(_:)``
public struct Shelf<Item, Title: View, Content: View>: View {

    public init(
        items: [Item],
        @ViewBuilder title: @escaping () -> Title,
        @ViewBuilder content: @escaping (Item) -> Content
    ) {
        self.items = items
        self.title = title
        self.content = content
    }

    private let items: [Item]
    private let title: () -> Title
    private let content: (Item) -> Content

    public typealias ItemAction = (Item) -> Void

    @Environment(\.shelfEdgePadding) var edgePadding
    @Environment(\.shelfItemSpacing) var itemSpacing
    @Environment(\.shelfScrollBehavior) var scrollBehavior

    public var body: some View {
        VStack(spacing: itemSpacing) {
            title()
                .padding(.horizontal, edgePadding)
            if scrollBehavior == .enabled {
                ScrollView(.horizontal, showsIndicators: false) {
                    stackContent
                        .padding(.horizontal, edgePadding)
                        .shelfContent()
                }
                .shelfContainer()
            } else {
                stackContent
                    #if os(tvOS)
                    .focusSection()
                    #endif
                    .padding(.horizontal, edgePadding)
            }
        }
    }
}

private extension View {

    func shelfContainer() -> some View {
        #if os(tvOS)
        self.focusSection()
            .padding(.top, -40)
            .padding(.bottom, -80)
        #else
        self
        #endif
    }

    func shelfContent() -> some View {
        #if os(tvOS)
        self.padding(.top, 40)
            .padding(.bottom, 80)
        #else
        self
        #endif
    }
}

private extension Shelf {

    var stackContent: some View {
        HStack(spacing: itemSpacing) {
            ForEach(Array(items.enumerated()), id: \.offset) { item in
                content(item.element)
            }
        }
    }
}

#Preview {

    struct Preview: View {

        var body: some View {
            Shelf(items: [1, 2, 3, 4, 5]) {
                Text("Shelf Title")
                    .padding(5)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.yellow)
                    .clipShape(.rect(cornerRadius: 10))
            } content: { _ in
                Button {
                    print("Tapped")
                } label: {
                    Color.red
                        .frame(height: 150)
                        .aspectRatio(15/9, contentMode: .fit)
                        .clipShape(.rect(cornerRadius: 10))
                }
                #if os(tvOS)
                .buttonStyle(.card)
                #endif
            }
            .shelfEdgePadding(25)
            .shelfItemSpacing(25)
            .shelfScrollBehavior(.enabled)
        }
    }

    return Preview()
}
