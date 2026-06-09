<p align="center">
    <img src="Resources/Icon_Badge.png" alt="Project Icon" width="250" />
</p>

<p align="center">
    <img src="https://img.shields.io/github/v/release/danielsaidi/ListKit?color=%2300550&sort=semver" alt="Version" />
    <img src="https://img.shields.io/badge/Swift-6.3-orange.svg" alt="Swift 6.3" />
    <img src="https://img.shields.io/badge/platform-SwiftUI-blue.svg" alt="Swift UI" title="Swift UI" />
    <a href="https://danielsaidi.github.io/ListKit"><img src="https://img.shields.io/badge/documentation-web-blue.svg" alt="Documentation" /></a>
    <a href="https://github.com/danielsaidi/ListKit/blob/main/LICENSE"><img src="https://img.shields.io/github/license/danielsaidi/ListKit" alt="MIT License" /></a>
</p>


# ListKit

ListKit is a SwiftUI library that provides additional list, grid, and shelf utilities to simplify listing items in flexible ways.



## Installation

ListKit can be installed with the Swift Package Manager:

```
https://github.com/danielsaidi/ListKit.git
```


## Getting started

ListKit has a bunch of predefined view components, and native view extensions. Below are the most useful views. Please have a look at the online [documentation][Documentation] and the source code previews for more examples. 


### List Button Group

The `ListButtonGroup` lets you add quick list actions, like you can see in apps like the native Contacts app:

![Preview](/Resources/list-button-group-cropped.jpg)

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

The default glass style works best with a prominent background. You can use the `.listBackgroundGradient(...)` extension to make this happen.


### Shelf

The `Shelf` view can be used to build vertical list of horizontally scrolling shelves, as seen in many streaming apps:

![Preview](/Resources/shelf-cropped.jpg) 

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

A shelf has a custom title and content view, and lets you customize edge padding, item spacing and scroll behavior.


### More Views

ListKit has more views, not listed here to avoid bloating the overview:

* `ListDragHandle`
* `ListSectionTitle`
* `ListSelectItem`
* `PlainListContent`


### View Extensions

ListKit also provides many view extensions to simplify common tasks:

* `.listBackgroundGradient(.blue)`
* `.listBackgroundGradient(colors: [.mint, .blue])`
* `.preferredListSectionSpacing(10)`
* `.preferredScrollContentHidden()`

See the online [documentation][Documentation] for more information.



## Documentation

The online [documentation][Documentation] has more information, articles, code examples, etc.



## Demo Application

This repository will get a demo app once it has 100+ stars. Until then, check out the source code demos.



## Support My Work

You can [become a sponsor][Sponsors] to help me dedicate more time on my various [open-source tools][OpenSource]. Every contribution, no matter the size, makes a real difference in keeping these tools free and actively developed.



## Contact

Feel free to reach out if you have questions or want to contribute in any way:

* Website: [danielsaidi.com][Website]
* E-mail: [daniel.saidi@gmail.com][Email]
* Bluesky: [@danielsaidi@bsky.social][Bluesky]
* Mastodon: [@danielsaidi@mastodon.social][Mastodon]



## License

ListKit is available under the MIT license. See the [LICENSE][License] file for more info.


[Email]: mailto:daniel.saidi@gmail.com
[Website]: https://danielsaidi.com
[GitHub]: https://github.com/danielsaidi
[OpenSource]: https://danielsaidi.com/opensource
[Sponsors]: https://github.com/sponsors/danielsaidi

[Bluesky]: https://bsky.app/profile/danielsaidi.bsky.social
[Mastodon]: https://mastodon.social/@danielsaidi
[Twitter]: https://twitter.com/danielsaidi

[Documentation]: https://danielsaidi.github.io/ListKit/
[Getting-Started]: https://danielsaidi.github.io/ListKit/documentation/ListKit/getting-started
[License]: https://github.com/danielsaidi/ListKit/blob/master/LICENSE
