//
//  ListButtonGroup.swift
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
///
/// Available view modifiers:
/// 
/// - ``SwiftUICore/View/listButtonGroupSpacing(_:)``
@available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, visionOS 26.0, *)
public struct ListButtonGroup<Content: View>: View {

    public init(
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.content = content
    }

    private let content: () -> Content

    @Environment(\.listButtonGroupSpacing) private var spacing

    public var body: some View {
        PreferredGlassEffectContainer {
            HStack(spacing: spacing) {
                Group {
                    content()
                }
                .buttonBorderShape(.circle)
                .controlSize(.extraLarge)
                .font(.title2)
                .preferredGlassButtonStyle()
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.vertical, 10)    // Avoid clipping
        }
        .buttonStyle(.plain)
        .labelStyle(PaddedIconLabelStyle())
        .listRowBackground(Color.clear)
        .listRowInsets(.init())
    }
}

public extension EnvironmentValues {

    /// The spacing between buttons in a ``ListButtonGroup``.
    @Entry var listButtonGroupSpacing: CGFloat = 0
}

public extension View {

    /// Sets the spacing between buttons in a ``ListButtonGroup``.
    func listButtonGroupSpacing(_ spacing: CGFloat) -> some View {
        environment(\.listButtonGroupSpacing, spacing)
    }
}

@available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, visionOS 26.0, *)
private struct PreferredGlassEffectContainer<Content: View>: View {

    let content: () -> Content

    var body: some View {
        #if os(visionOS)
        content()
        #else
        GlassEffectContainer {
            content()
        }
        #endif
    }
}

@available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, visionOS 26.0, *)
private extension View {

    func preferredGlassButtonStyle() -> some View {
        #if os(visionOS)
        self
        #else
        self.buttonStyle(.glass(.clear))
        #endif
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
                ListButtonGroup {
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
        .tint(.white)
        .preferredListSectionSpacing(10)
        .listBackgroundGradient(colors: [.mint, .blue])
        .listButtonGroupSpacing(0)
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
