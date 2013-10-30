//
//  UIButtonProcessor.m
//  nib2objc
//
//  Created by Adrian on 3/14/09.
//  Adrian Kosmaczewski 2009
//

#import "UIButtonProcessor.h"
#import "NSNumber+Nib2ObjcExtensions.h"
#import "NSDictionary+Nib2ObjcExtensions.h"
#import "NSString+Nib2ObjcExtensions.h"

@implementation UIButtonProcessor

- (void)dealloc
{
    [super dealloc];
}

- (NSString *)getProcessedClassName
{
    return @"UIButton";
}

- (NSString *)constructorString
{
    NSString *style = [[self.input objectForKey:@"buttonType"] buttonTypeString];
    return [NSString stringWithFormat:@"[%@ buttonWithType:%@]", [self getProcessedClassName], style];
}

- (void)processKey:(id)item value:(id)value
{
    if ([item isEqualToString:@"adjustsImageWhenDisabled"])
    {
        if ([value isDefaultValue:YES])
            return;
        [output setObject:[value booleanString] forKey:item];
    }
    else if ([item isEqualToString:@"adjustsImageWhenHighlighted"])
    {
        if ([value isDefaultValue:YES])
            return;
        [output setObject:[value booleanString] forKey:item];
    }
    else if ([item isEqualToString:@"font"])
    {
        [output setObject:[value fontString] forKey:@"titleLabel.font"];
    }
    else if ([item isEqualToString:@"lineBreakMode"])
    {
        if ([value intValue] == 5) // UILineBreakModeMiddleTruncation
            return;
        [output setObject:[value lineBreakModeString] forKey:@"titleLabel.lineBreakMode"];
    }
    else if ([item isEqualToString:@"reversesTitleShadowWhenHighlighted"])
    {
        if ([value isDefaultValue:NO])
            return;
        [output setObject:[value booleanString] forKey:item];
    }
    else if ([item isEqualToString:@"showsTouchWhenHighlighted"])
    {
        if ([value isDefaultValue:NO])
            return;
        [output setObject:[value booleanString] forKey:item];
    }
    else if ([item isEqualToString:@"titleShadowOffset"])
    {
        NSSize size = NSSizeFromString(value);
        if (size.width < 0.01f && size.height < 0.01f)
            return;
        [output setObject:[value sizeString] forKey:@"titleLabel.shadowOffset"];
    }

    // Creation of methods for the titles, instead of properties
    else if ([item isEqualToString:@"normalTitle"])
    {
        if ([value length] == 0)
            return;
        NSString *stringOutput = [NSString stringWithFormat:@"setTitle:%@ forState:UIControlStateNormal", [value quotedAsCodeString]];
        [output setObject:stringOutput forKey:[NSString stringWithFormat:@"__method__%@", item]];
    }
    else if ([item isEqualToString:@"selectedTitle"])
    {
        NSString *stringOutput = [NSString stringWithFormat:@"setTitle:%@ forState:UIControlStateSelected", [value quotedAsCodeString]];
        [output setObject:stringOutput forKey:[NSString stringWithFormat:@"__method__%@", item]];
    }
    else if ([item isEqualToString:@"highlightedTitle"])
    {
        NSString *stringOutput = [NSString stringWithFormat:@"setTitle:%@ forState:UIControlStateHighlighted", [value quotedAsCodeString]];
        [output setObject:stringOutput forKey:[NSString stringWithFormat:@"__method__%@", item]];
    }
    else if ([item isEqualToString:@"disabledTitle"])
    {
        NSString *stringOutput = [NSString stringWithFormat:@"setTitle:%@ forState:UIControlStateDisabled", [value quotedAsCodeString]];
        [output setObject:stringOutput forKey:[NSString stringWithFormat:@"__method__%@", item]];
    }

    // Creation of methods for the title colors, instead of properties
    else if ([item isEqualToString:@"normalTitleColor"])
    {
        NSString *stringOutput = [NSString stringWithFormat:@"setTitleColor:%@ forState:UIControlStateNormal", [value colorString]];
        [output setObject:stringOutput forKey:[NSString stringWithFormat:@"__method__%@", item]];
    }
    else if ([item isEqualToString:@"selectedTitleColor"])
    {
        NSString *stringOutput = [NSString stringWithFormat:@"setTitleColor:%@ forState:UIControlStateSelected", [value colorString]];
        [output setObject:stringOutput forKey:[NSString stringWithFormat:@"__method__%@", item]];
    }
    else if ([item isEqualToString:@"highlightedTitleColor"])
    {
        NSString *stringOutput = [NSString stringWithFormat:@"setTitleColor:%@ forState:UIControlStateHighlighted", [value colorString]];
        [output setObject:stringOutput forKey:[NSString stringWithFormat:@"__method__%@", item]];
    }
    else if ([item isEqualToString:@"disabledTitleColor"])
    {
        NSString *stringOutput = [NSString stringWithFormat:@"setTitleColor:%@ forState:UIControlStateDisabled", [value colorString]];
        [output setObject:stringOutput forKey:[NSString stringWithFormat:@"__method__%@", item]];
    }
    
    // Creation of methods for the title shadow colors, instead of properties
    else if ([item isEqualToString:@"normalTitleShadowColor"])
    {
        NSString *stringOutput = [NSString stringWithFormat:@"setTitleShadowColor:%@ forState:UIControlStateNormal", [value colorString]];
        [output setObject:stringOutput forKey:[NSString stringWithFormat:@"__method__%@", item]];
    }
    else if ([item isEqualToString:@"selectedTitleShadowColor"])
    {
        NSString *stringOutput = [NSString stringWithFormat:@"setTitleShadowColor:%@ forState:UIControlStateSelected", [value colorString]];
        [output setObject:stringOutput forKey:[NSString stringWithFormat:@"__method__%@", item]];
    }
    else if ([item isEqualToString:@"highlightedTitleShadowColor"])
    {
        NSString *stringOutput = [NSString stringWithFormat:@"setTitleShadowColor:%@ forState:UIControlStateHighlighted", [value colorString]];
        [output setObject:stringOutput forKey:[NSString stringWithFormat:@"__method__%@", item]];
    }
    else if ([item isEqualToString:@"disabledTitleShadowColor"])
    {
        NSString *stringOutput = [NSString stringWithFormat:@"setTitleShadowColor:%@ forState:UIControlStateDisabled", [value colorString]];
        [output setObject:stringOutput forKey:[NSString stringWithFormat:@"__method__%@", item]];
    }
    
    else
    {
        [super processKey:item value:value];
    }
}

@end
