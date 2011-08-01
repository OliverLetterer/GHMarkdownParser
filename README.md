# GHMarkdownParser
**GHMarkdownParser** is a *markdown* parser for iOS and based on [discount](https://github.com/Orc/discount).


## How to use GHMarkdownParser

* drag and drop the `GHMarkdownParser.xcodeproj` into your project
* select your project target -> build settings
    * fill `Other Linker Flags` with `-Objc` and `-all_load
    * add GHMarkdownParser path to `Library Search Paths` and `Header Search Paths`
* go into build phases
    * add the GHMarkdownParser static library to Target Dependencies