//
//  UIControlProcessor.m
//  nib2objc
//
//  Created by Adrian on 3/14/09.
//  Adrian Kosmaczewski 2009
//

#import "UIControlProcessor.h"
#import "NSString+Nib2ObjcExtensions.h"
#import "NSNumber+Nib2ObjcExtensions.h"

typedef NS_ENUM(NSInteger, UIControlContentVerticalAlignment) {
    UIControlContentVerticalAlignmentCenter  = 0,
    UIControlContentVerticalAlignmentTop     = 1,
    UIControlContentVerticalAlignmentBottom  = 2,
    UIControlContentVerticalAlignmentFill    = 3,
};

typedef NS_ENUM(NSInteger, UIControlContentHorizontalAlignment) {
    UIControlContentHorizontalAlignmentCenter = 0,
    UIControlContentHorizontalAlignmentLeft   = 1,
    UIControlContentHorizontalAlignmentRight  = 2,
    UIControlContentHorizontalAlignmentFill   = 3,
};

@implementation UIControlProcessor

- (void)dealloc
{
    [super dealloc];
}

- (void)processKey:(id)item value:(id)value
{
    if ([item isEqualToString:@"contentHorizontalAlignment"])
    {
        if ([value intValue] == UIControlContentHorizontalAlignmentCenter)
            return;
        [output setObject:[value contentHorizontalAlignmentString] forKey:item];
    }
    else if ([item isEqualToString:@"contentVerticalAlignment"])
    {
        if ([value intValue] == UIControlContentVerticalAlignmentCenter)
            return;
        [output setObject:[value contentVerticalAlignmentString] forKey:item];
    }
    else if ([item isEqualToString:@"enabled"])
    {
        if ([value isDefaultValue:YES])
            return;
        [output setObject:[value booleanString] forKey:item];
    }
    else if ([item isEqualToString:@"highlighted"])
    {
        if ([value isDefaultValue:NO])
            return;
        [output setObject:[value booleanString] forKey:item];
    }
    else if ([item isEqualToString:@"selected"])
    {
        if ([value isDefaultValue:NO])
            return;
        [output setObject:[value booleanString] forKey:item];
    }
    else
    {
        [super processKey:item value:value];
    }
}

@end
