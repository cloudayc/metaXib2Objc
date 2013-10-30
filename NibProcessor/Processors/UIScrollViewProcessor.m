//
//  UIScrollViewProcessor.m
//  nib2objc
//
//  Created by Adrian on 3/15/09.
//  Adrian Kosmaczewski 2009
//

#import "UIScrollViewProcessor.h"
#import "NSNumber+Nib2ObjcExtensions.h"

@implementation UIScrollViewProcessor

- (void)dealloc
{
    [super dealloc];
}

- (NSString *)getProcessedClassName
{
    return @"UIScrollView";
}

- (void)processKey:(id)item value:(id)value
{
    if ([item isEqualToString:@"indicatorStyle"])
    {
        typedef NS_ENUM(NSInteger, UIScrollViewIndicatorStyle) {
            UIScrollViewIndicatorStyleDefault,     // black with white border. good against any background
            UIScrollViewIndicatorStyleBlack,       // black only. smaller. good against a white background
            UIScrollViewIndicatorStyleWhite        // white only. smaller. good against a black background
        };
        if ([value intValue] == UIScrollViewIndicatorStyleDefault)
            return;
        [output setObject:[value scrollViewIndicatorStyleString] forKey:item];
    }
    else if ([item isEqualToString:@"showsHorizontalScrollIndicator"])
    {
        if ([value isDefaultValue:YES])
            return;
        [output setObject:[value booleanString] forKey:item];
    }
    else if ([item isEqualToString:@"showsVerticalScrollIndicator"])
    {
        if ([value isDefaultValue:YES])
            return;
        [output setObject:[value booleanString] forKey:item];
    }
    else if ([item isEqualToString:@"scrollEnabled"])
    {
        if ([value isDefaultValue:YES])
            return;
        [output setObject:[value booleanString] forKey:item];
    }
    else if ([item isEqualToString:@"pagingEnabled"])
    {
        if ([value isDefaultValue:NO])
            return;
        [output setObject:[value booleanString] forKey:item];
    }
    else if ([item isEqualToString:@"directionalLockEnabled"])
    {
        if ([value isDefaultValue:NO])
            return;
        [output setObject:[value booleanString] forKey:item];
    }
    else if ([item isEqualToString:@"bounces"])
    {
        if ([value isDefaultValue:YES])
            return;
        [output setObject:[value booleanString] forKey:item];
    }
    else if ([item isEqualToString:@"alwaysBounceHorizontal"])
    {
        if ([value isDefaultValue:NO])
            return;
        [output setObject:[value booleanString] forKey:item];
    }
    else if ([item isEqualToString:@"alwaysBounceVertical"])
    {
        if ([value isDefaultValue:NO])
            return;
        [output setObject:[value booleanString] forKey:item];
    }
    else if ([item isEqualToString:@"maximumZoomScale"])
    {
        if (fabs([value floatValue] - 1.f) < 0.01f)
            return;
        [output setObject:[value floatString] forKey:item];
    }
    else if ([item isEqualToString:@"minimumZoomScale"])
    {
        if (fabs([value floatValue] - 1.f) < 0.01f)
            return;
        [output setObject:[value floatString] forKey:item];
    }
    else if ([item isEqualToString:@"bouncesZoom"])
    {
        if ([value isDefaultValue:YES])
            return;
        [output setObject:[value booleanString] forKey:item];
    }
    else if ([item isEqualToString:@"delaysContentTouches"])
    {
        if ([value isDefaultValue:YES])
            return;
        [output setObject:[value booleanString] forKey:item];
    }
    else if ([item isEqualToString:@"canCancelContentTouches"])
    {
        if ([value isDefaultValue:YES])
            return;
        [output setObject:[value booleanString] forKey:item];
    }
    else
    {
        [super processKey:item value:value];
    }
}

@end
