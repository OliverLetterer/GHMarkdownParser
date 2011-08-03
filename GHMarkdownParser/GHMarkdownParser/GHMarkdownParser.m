//
//  GHMarkdownParser.m
//  GHMarkdownParser
//
//  Created by Oliver Letterer on 01.08.11.
//  Copyright 2011 Home. All rights reserved.
//

#import "GHMarkdownParser.h"
#import "markdown.h"

@implementation GHMarkdownParser

+ (NSString *)HTMLStringFromMarkdownString:(NSString *)markdownString {
    NSString *HTMLString = nil;
    
    char *markdownUTF8 = (char*)markdownString.UTF8String;
    Document *document = mkd_string(markdownUTF8, strlen(markdownUTF8), 0);
    if (document && mkd_compile(document, 0)) {
        char *HTMLUTF8 = NULL;
        int length = mkd_document(document, &HTMLUTF8);
        if (length != EOF) {
            HTMLString = [[NSString alloc] initWithBytes:HTMLUTF8
                                                  length:length
                                                encoding:NSUTF8StringEncoding];
        }
        mkd_cleanup(document);
    }
    
    return HTMLString;
}

+ (NSString *)flavoredHTMLStringFromMarkdownString:(NSString *)markdownString {
    NSMutableString *fixedMarkdown = [NSMutableString stringWithCapacity:markdownString.length];
    __block BOOL isCodeBlock = NO;
    [markdownString enumerateLinesUsingBlock:^(NSString *line, BOOL *stop) {
        if ([line rangeOfString:@"```"].location != NSNotFound) {
            isCodeBlock = !isCodeBlock;
        } else {
            if (isCodeBlock) {
                [fixedMarkdown appendFormat:@"      %@\n", line];
            } else {
                [fixedMarkdown appendFormat:@"%@\n", line];
            }
        }
    }];
    
    NSString *HTML = [self HTMLStringFromMarkdownString:fixedMarkdown];
    
    return HTML;
}

@end
