//
//  Image+Symbol.swift
//  ListKit
//
//  Created by Daniel Saidi on 2026-06-08.
//

import SwiftUI

extension Image {

    static func symbol(_ name: String) -> Image {
        .init(systemName: name)
    }
}
