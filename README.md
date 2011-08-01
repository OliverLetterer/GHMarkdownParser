# GHMarkdownParser
**GHMarkdownParser** is a [GitHub Flavored Markdown](http://github.github.com/github-flavored-markdown/) parser for iOS and based on [discount](https://github.com/Orc/discount).


## How to setup GHMarkdownParser is your project

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
    * add the `GHMarkdownParser` to **Target Dependencies**
    * add `libGHMarkdownParser.a` to **Link Binary with Libraries**

## How to use GHMarkdownParser

* import the GHMarkdownParser header

    ```objecttive-c
    #import "GHMarkdownParser.h"
    ```

* convert any markdown formatted string into HTML

    ```objecttive-c
    NSString *markdown = ...;
    NSString *HTML = markdown.flavoredHTMLStringFromMarkdown;
    ```