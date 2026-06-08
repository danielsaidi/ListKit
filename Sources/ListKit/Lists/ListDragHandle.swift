#if os(iOS)
//
//  ListDragHandle.swift
//  ListKit
//
//  Created by Daniel Saidi on 2026-06-08.
//  Copyright © 2026 Daniel Saidi. All rights reserved.
//

import SwiftUI

/// This view can be used to add a drag handle to items in a
/// list, that mimics the native drag handle.
///
/// The handle is only displayed when the list is not edited,
/// since edit mode will render the native drag handle.
public struct ListDragHandle: View {

    public init() {}

    @Environment(\.editMode)
    private var editMode

    public var body: some View {
        if !isEditing {
            Image(systemName: "line.3.horizontal")
                .font(Font.title2.weight(.light))
                .foregroundColor(.secondary)
                .opacity(0.5)
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
    }
}

private extension ListDragHandle {

    var isEditing: Bool {
        editMode?.wrappedValue.isEditing ?? false
    }
}

#Preview {

    NavigationView {
        List {
            ForEach(1...10, id: \.self) { item in
                HStack {
                    Text("Item")
                    ListDragHandle()
                }
            }
            .onMove { _, _ in }
            .onDelete { _ in }
        }
        .toolbar {
            EditButton()
        }
    }
}
#endif
