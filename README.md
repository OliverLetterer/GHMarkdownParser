# GHMarkdownParser
**GHMarkdownParser** is a [GitHub Flavored Markdown](http://github.github.com/github-flavored-markdown/) parser for iOS and Mac OS, based on [discount](https://github.com/Orc/discount).


## How to setup GHMarkdownParser in your project

* add **GHMarkdownParser** as a submodule to your project
* navigate into **GHMarkdownParser directory** and initialize the submodules

    ```
    git submodule init
    git submodule update
    ```
* drag and drop the `GHMarkdownParser.xcodeproj` into your project
* select your **project target** -> **build settings**
    * fill **Other Linker Flags** with `-Objc` and `-all_load`
    * add the **path of GHMarkdownParser** to `Library Search Paths` and `Header Search Paths`
* go into **build phases**
    * add `GHMarkdownParser` (for iOS) or `GHMarkdownParser Mac` (for Mac) to **Target Dependencies**
    * add `libGHMarkdownParser.a` (for iOS) or `libGHMarkdownParser_Mac.a` (for Mac) to **Link Binary with Libraries**

## How to use GHMarkdownParser

* import the GHMarkdownParser header

    ```objc
    #import "GHMarkdownParser.h"
    ```

* convert any markdown formatted string into HTML

    ```objc
    NSString *markdown = ...;
    NSString *HTML = markdown.flavoredHTMLStringFromMarkdown;
    ```

* Or for greater control:

    ```objc
    GHMarkdownParser *parser = [[GHMarkdownParser alloc] init];
    parser.options = kGHMarkdownAutoLink; // for example
    parser.githubFlavored = YES;
    NSString *html = [parser HTMLStringFromMarkdownString:markdownString];
    ```
