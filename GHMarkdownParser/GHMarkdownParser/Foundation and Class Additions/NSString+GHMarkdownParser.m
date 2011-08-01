//
//  NSString+GHMarkdownParser.m
//  GHMarkdownParser
//
//  Created by Oliver Letterer on 01.08.11.
//  Copyright 2011 Home. All rights reserved.
//

#import "NSString+GHMarkdownParser.h"
#import "GHMarkdownParser.h"

@implementation NSString (GHMarkdownParser)

- (NSString *)HTMLStringFromMarkdown {
    return [GHMarkdownParser HTMLStringFromMarkdownString:self];
}

- (NSString *)flavoredHTMLStringFromMarkdown {
    return [GHMarkdownParser flavoredHTMLStringFromMarkdownString:self];
}

@end
