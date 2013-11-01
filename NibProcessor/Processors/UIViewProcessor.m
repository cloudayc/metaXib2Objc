//
//  UIViewProcessor.m
//  nib2objc
//
//  Created by Adrian on 3/13/09.
//  Adrian Kosmaczewski 2009
//

#import "UIViewProcessor.h"
#import "NSString+Nib2ObjcExtensions.h"
#import "NSNumber+Nib2ObjcExtensions.h"

@implementation UIViewProcessor

- (void)dealloc
{
    [super dealloc];
}

#pragma mark -
#pragma mark Private methods

- (NSString *)getProcessedClassName
{
    return @"UIView";
}

- (NSString *)frameString
{
    NSString *rect = [NSString rectStringFromPoint:[self.input objectForKey:@"frameOrigin"] size:[self.input objectForKey:@"frameSize"] scaleFactors:self.scaleFactors];
    return rect;
}

- (NSString *)constructorString
{
    return [NSString stringWithFormat:@"[[%@ alloc] initWithFrame:%@]", [self getProcessedClassName], [self frameString]];
}

- (void)processKey:(id)item value:(id)value
{
    // Subclasses can override this method for their own properties.
    // In those cases, call [super processUnknownProperty:item value:value];
    // to be sure that mother classes do their work too.

    id object = nil;
    if ([item isEqualToString:@"class"])
    {
        object = [self getProcessedClassName];
    }
    else if ([item isEqualToString:@"ibExternalExplicitLabel"])
    {
        if (value == nil)
            return;
        object = value;
        item = @"instanceName";
    }
    else if ([item isEqualToString:@"autoresizesSubviews"])
    {
        if ([value isDefaultValue:YES])
            return;
        object = [value booleanString];
    }
    else if ([item isEqualToString:@"contentStretch"])
    {
        if ([value isEqualToString:@"{{0, 0}, {1, 1}}"])
            return;
        object = [NSString stringWithFormat:@"CGRectFromString(@\"%@\")", value];
    }
    else if ([item isEqualToString:@"alpha"])
    {
        if (fabs([value floatValue] - 1.f) < 0.01f)
            return;
        object = [value floatString];
    }
    else if ([item isEqualToString:@"hidden"])
    {
        if ([value isDefaultValue:NO])
            return;
        object = [value booleanString];
    }
    else if ([item isEqualToString:@"opaqueForDevice"])
    {
        if ([value isDefaultValue:YES])
            return;
        object = [value booleanString];
        item = @"opaque";
    }
    else if ([item isEqualToString:@"clipsSubviews"])
    {
        if ([value isDefaultValue:NO])
            return;
        object = [value booleanString];
        item = @"clipsToBounds";
    }
    else if ([item isEqualToString:@"clearsContextBeforeDrawing"])
    {
        if ([value isDefaultValue:YES])
            return;
        object = [value booleanString];
    }
    else if ([item isEqualToString:@"userInteractionEnabled"])
    {
        if ([value isDefaultValue:YES])
            return;
        object = [value booleanString];
    }
    else if ([item isEqualToString:@"multipleTouchEnabled"])
    {
        if ([value isDefaultValue:NO])
            return;
        object = [value booleanString];
    }
    else if ([item isEqualToString:@"tag"])
    {
        if ([value intValue] == 0)
            return;
        object = [value intString];
    }
    else if ([item isEqualToString:@"backgroundColor"])
    {
        object = [value colorString];
    }
    else if ([item isEqualToString:@"contentMode"])
    {
        if ([value intValue] == 0)
            return;
        object = [value contentModeString];
    }
    else if ([item isEqualToString:@"autoresizingMask"])
    {
        // TODO:just ignore this item for the time being
        return;
        enum
        {
            UIViewAutoresizingNone                 = 0,
            UIViewAutoresizingFlexibleRightMargin  = 1 << 2,
            UIViewAutoresizingFlexibleBottomMargin = 1 << 5
        };
        if ([value intValue] ==
            (UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin))
            return;
        
        object = [value autoresizingMaskString];
    }
    if (object != nil)
    {
        [output setObject:object forKey:item];
    }
}

@end
