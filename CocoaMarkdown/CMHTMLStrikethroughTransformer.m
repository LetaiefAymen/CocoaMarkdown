//
//  CMHTMLStrikethroughTransformer.m
//  CocoaMarkdown
//
//  Created by Indragie on 1/16/15.
//  Copyright (c) 2015 Indragie Karunaratne. All rights reserved.
//

#import "CMHTMLStrikethroughTransformer.h"
#import "Ono.h"

@implementation CMHTMLStrikethroughTransformer {
    CMUnderlineStyle _style;
    CMColor *_color;
}

- (instancetype)init
{
    return [self initWithStrikethroughStyle:NSUnderlineStyleSingle color:CMColor.blackColor];
}

- (instancetype)initWithStrikethroughStyle:(CMUnderlineStyle)style color:(CMColor *)color
{
    NSParameterAssert(color);
    
    if ((self = [super init])) {
        _style = style;
        _color = color;
    }
    return self;
}

+ (NSString *)tagName { return @"s"; };

- (NSAttributedString *)attributedStringForElement:(ONOXMLElement *)element attributes:(NSDictionary *)attributes
{
    CMAssertCorrectTag(element);
    
    NSMutableDictionary *allAttributes = [attributes mutableCopy];
    allAttributes[NSStrikethroughStyleAttributeName] = @(_style);
    allAttributes[NSStrikethroughColorAttributeName] = _color;
    
    return [[NSAttributedString alloc] initWithString:element.stringValue attributes:allAttributes];
}

@end