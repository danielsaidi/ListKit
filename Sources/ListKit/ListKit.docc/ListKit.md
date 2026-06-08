# ``ListKit``

ListKit adds extra list, grid and shelf utilities to `SwiftUI`.



## Overview

![ListKit logo](Logo.png)

ListKit is a SwiftUI library that provides additional list, grid, and shelf-related views & utilities to simplify working with list in flexible ways.



## Installation

ListKit can be installed with the Swift Package Manager:

```
https://github.com/danielsaidi/ListKit.git
```



## Getting Started

ListKit has a bunch of predefined view components, and native view extensions. Below are the most useful views, but have a look at the source code previews, and the demo app for more examples. 


### List Button Group

The ``ListButtonGroup`` lets you add quick list actions to the top of any list, like you can see in apps like the native Contacts app:

@Row {
    @Column {
        ![Preview](list-button-group-cropped)
    }    
    
    @Column {
        ```swift
        struct ContentView: View {

            var body: some View {
                List {
                    ListButtonGroup {
                        Button(action: doSomething) { ... }
                        Button(action: doSomething) { ... }
                        Button(action: doSomething) { ... }
                        Button(action: doSomething) { ... }
                    }
                }
                .listBackgroundGradient(colors: [.mint, .blue])
            }
        }
        ``` 
    }
}




The default glass style works best with a colored background. You can use ``SwiftUICore/View/listBackgroundGradient(colors:startPoint:endPoint:)`` to apply a colored background to any list.


### Shelf

The ``Shelf`` view component can be used to build vertical lists of horizontally scrolling shelves, as can be seen in many streaming apps:

@Row {
    @Column {
        ![Preview](shelf-cropped)
    }    
    
    @Column {
        ```swift
        Shelf(items: [1, 2, 3, 4, 5]) {
            Text("Shelf Title")
                .padding(5)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.yellow)
                .clipShape(.rect(cornerRadius: 10))
        } content: { item in
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
        ```
    }
}

A shelf has a custom title and content view, and lets you customize edge padding, item spacing and scroll behavior with view modifiers like ``SwiftUICore/View/shelfEdgePadding(_:)``, ``SwiftUICore/View/shelfItemSpacing(_:)``, and ``SwiftUICore/View/shelfScrollBehavior(_:)``.


### More Views

ListKit has more views, not listed here to avoid bloating the overview:

* ``ListDragHandle``
* ``ListSectionTitle``
* ``ListSelectItem``
* ``PlainListContent``
* ``PlainListHeader``
* ``PlainListFooter``


### View Extensions

ListKit also provides list-related view extensions to simplify common tasks:

* ``SwiftUICore/View/listBackgroundGradient(_:)``
* ``SwiftUICore/View/listBackgroundGradient(colors:startPoint:endPoint:)``
* ``SwiftUICore/View/preferredListSectionSpacing(_:)``
* ``SwiftUICore/View/preferredScrollContentHidden()``

The "preferred" extensions are used to express intent, and will be ignored without compile-time errors if the modifier isn't supported for the current platform. 



## Repository

For more information, source code, etc., visit the [project repository][Repository].



## License

ListKit is available under the MIT license.



## Topics

### Cards

- ``Card``
- ``CardButtonStyle``
- ``CardStyle``

### Colors

- ``SwiftUICore/Color``
- ``ColorRepresentable``

### Data

- ``CsvParser``
- ``FetchedDataView``
- ``MimeType``
- ``StorageValue``
- ``AppStorageValue``
- ``SceneStorageValue``

### Device

- ``DeviceIdentifier``

### Files

- ``BundleFileFinder``
- ``DirectoryFileManager``
- ``DirectoryMonitor``
- ``DirectoryObservable``
- ``iCloudDocumentSync``

### Fonts

- ``SwiftUICore/Font``
- ``FontRepresentable``

### Images

- ``SwiftUICore/Image``
- ``ImageCache``
- ``ImageRepresentable``

### Keychain

- ``KeychainItemAccessibility``
- ``KeychainService``
- ``KeychainWrapper``

### Lists

- ``Reorderable``
- ``ReorderableForEach``
- ``SidebarListRowBackgroundModifier``

### Previews

- ``SwiftUIPreviewInspector``

### Regex

- ``ValidationRegex``

### Sharing

- ``ShareSheet``

### Styles

- ``ViewShadowStyle``

### Text

- ``SwiftUICore/Text``
- ``MultilineSubmitViewModifier``
- ``TextEditorStyle``
- ``TextFieldClearButton``

### Views

- ``SwiftUICore/View``
- ``EditableView``



[Repository]: https://github.com/danielsaidi/ListKit

[Email]: mailto:daniel.saidi@gmail.com
[Website]: https://danielsaidi.com
[GitHub]: https://github.com/danielsaidi
[OpenSource]: https://danielsaidi.com/opensource
[Sponsors]: https://github.com/sponsors/danielsaidi
