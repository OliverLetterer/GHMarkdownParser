# GHMarkdownParser
**GHMarkdownParser** is a [GitHub Flavored Markdown](http://github.github.com/github-flavored-markdown/) parser for iOS and based on [discount](https://github.com/Orc/discount).


## How to setup GHMarkdownParser is your project

* add GHMarkdownParser as a submodule to your project
* navigate into GHMarkdownParser directory
    * run `git submodule init` and `git submodule update `
* drag and drop the `GHMarkdownParser.xcodeproj` into your project
* select your project target -> build settings
    * fill `Other Linker Flags` with `-Objc` and `-all_load
    * add GHMarkdownParser path to `Library Search Paths` and `Header Search Paths`
* go into build phases
    * add the GHMarkdownParser static library to `Target Dependencies`
    * add `libGHMarkdownParser.a` to `Link Binary with Libraries`

## How to use GHMarkdownParser

* import the GHMarkdownParser header

    #import "GHMarkdownParser.h"

* convert any markdown formatted string into HTML

```objecttive-c
NSString *markdown = ...;
NSString *HTML = markdown.flavoredHTMLStringFromMarkdown;
```