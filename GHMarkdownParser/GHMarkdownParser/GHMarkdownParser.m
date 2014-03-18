//
//  GHMarkdownParser.m
//  GHMarkdownParser
//
//  Created by Oliver Letterer on 01.08.11.
//  Copyright 2011 Home. All rights reserved.
//

#import "GHMarkdownParser.h"
#import "markdown.h"

#if !__has_feature(objc_arc)
#error This project requires arc
#endif

// Declared in mkdio.h, but we can't include that after including markdown.
extern void mkd_with_html5_tags(void);



@implementation GHMarkdownParser

+ (void)initialize {
    // Enable recognition of HTML5 tags
    mkd_with_html5_tags();
}

+ (NSString *)HTMLStringFromMarkdownString:(NSString *)markdownString {
    GHMarkdownParser *parser = [[self alloc] init];
    NSString *html = [parser HTMLStringFromMarkdownString:markdownString];
    return html;
}


+ (NSString *)flavoredHTMLStringFromMarkdownString:(NSString *)markdownString {
    GHMarkdownParser *parser = [[self alloc] init];
    parser.githubFlavored = YES;
    NSString *html = [parser HTMLStringFromMarkdownString:markdownString];
    return html;
}


- (NSString *)HTMLStringFromMarkdownString:(NSString *)markdownString {
    NSData *mdData = [markdownString dataUsingEncoding:NSUTF8StringEncoding];
    Document *document;

    if (_githubFlavored) {
        document = gfm_string(mdData.bytes, (int)mdData.length, _options);
    } else {
        document = mkd_string(mdData.bytes, (int)mdData.length, _options);
    }

    if (!document) {
        return nil;
    }

    if (_baseURL) {
        mkd_basename(document, (char*)_baseURL.absoluteString.UTF8String);
    }

    NSString *html = nil;
    if (mkd_compile(document, _options)) {
        char *HTMLUTF8 = NULL;
        int length = mkd_document(document, &HTMLUTF8);
        if (length >= 0) {
            html = [[NSString alloc] initWithBytes:HTMLUTF8
                                            length:length
                                          encoding:NSUTF8StringEncoding];
        }
        mkd_cleanup(document);
    }

    return html;
}

@end
