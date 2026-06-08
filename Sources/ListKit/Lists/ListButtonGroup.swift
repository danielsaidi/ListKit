//
//  ListActionButtonGroup.swift
//  Vinylsamlaren
//
//  Created by Daniel Saidi on 2026-05-26.
//

import SwiftUI

/// This view renders a horizontal list button group, with a
/// circular glass button style, that looks like in Contacts.
///
/// This view lets you add action buttons to the top of item
/// list views, to provide quick actions.
///
/// To use this view, just provide it with a list of buttons.
/// Four buttons is ideal on iOS.
@available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, visionOS 26.0, *)
public struct ListActionButtonGroup<Content: View>: View {

    public init(
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.content = content
    }

    private let content: () -> Content

    public var body: some View {
        GlassEffectContainer {
            HStack(spacing: 0) {
                Group {
                    content()
                }
                .buttonStyle(.glass(.clear))
                .buttonBorderShape(.circle)
                .controlSize(.extraLarge)
                .font(.title2)
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.vertical, 10)    // Avoid clipping
        }
        .labelStyle(PaddedIconLabelStyle())
        .listRowBackground(Color.clear)
        .listRowInsets(.init())
    }
}

private struct PaddedIconLabelStyle: LabelStyle {
    var padding: CGFloat = 4
    func makeBody(configuration: Configuration) -> some View {
        configuration.icon.padding(padding)
    }
}

#Preview {

    if #available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, visionOS 26.0, *) {
        List {
            Section {
                ListActionButtonGroup {
                    previewButton()
                    previewButton()
                    previewButton()
                    previewButton()
                }
            }

            Section {
                Text("Foo")
                Text("Foo")
                Text("Foo")
            }
            .listRowBackground(
                Color.white.opacity(0.2)
            )
        }
        .preferredSectionSpacing(10)
        .listBackgroundGradient(colors: [.mint, .blue])
        .tint(.white)
    }
}

private func previewButton() -> some View {
    Button {
        print("Tap!")
    } label: {
        Label {
            Text("Foo")
        } icon: {
            Image.symbol("envelope.fill")
        }
    }
}

private extension Image {

    static func symbol(_ name: String) -> Image {
        .init(systemName: name)
    }
}
