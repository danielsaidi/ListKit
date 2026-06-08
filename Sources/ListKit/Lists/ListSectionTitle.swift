//
//  ListSectionTitle.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-10-28.
//  Copyright © 2021-2026 Daniel Saidi. All rights reserved.
//

import SwiftUI

/// This view mimics the `Section` title of a grouped `List`,
/// approximating the style on each supported platform.
///
/// Since this doesn't add insets by default, you can enable
/// `withGroupedListSectionHeaderInsets` to apply a standard
/// list section padding.
public struct ListSectionTitle: View {

    public init(
        _ text: LocalizedStringResource,
        bundle: Bundle? = nil,
        withInsets: Bool = false
    ) {
        self.text = text
        self.bundle = bundle
        self.applyInsets = withInsets
    }

    private let text: LocalizedStringResource
    private let bundle: Bundle?
    private let applyInsets: Bool
    
    public var body: some View {
        #if os(iOS)
        if #available(iOS 26.0, *) {
            Text(text)
                .font(.headline)
                .foregroundColor(.secondary)
                .scaleEffect(0.98)
        } else {
            Text(text)
                .textCase(.uppercase)
                .foregroundColor(.secondary)
                .font(.footnote)
                .withGroupedListSectionHeaderInsets(if: applyInsets)
        }
        #elseif os(macOS)
        Text(text)
            .foregroundColor(.secondary)
            .font(.system(size: 11))
            .fontWeight(.semibold)
        #elseif os(tvOS)
        Text(text)
            .font(.headline)
            .foregroundColor(.secondary)
            .opacity(0.6)
        #elseif os(watchOS)
        Text(text)
            .font(.footnote)
            .fontWeight(.medium)
            .scaleEffect(0.98)
        #elseif os(visionOS)
        Text(text)
            .font(.title3)
            .fontWeight(.bold)
            .scaleEffect(x: 0.98)
        #endif
    }
}

private extension View {
    
    @ViewBuilder
    func withGroupedListSectionHeaderInsets(
        if condition: Bool
    ) -> some View {
        if condition {
            self.padding(.leading)
                .padding(.top, -3)
        } else {
            self
        }
    }
}

#Preview {

    List {
        Section("Preview") {
            ListSectionTitle("Preview")
        }
    }
}
