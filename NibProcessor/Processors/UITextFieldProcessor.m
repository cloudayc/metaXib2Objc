//
//  UITextFieldProcessor.m
//  nib2objc
//
//  Created by Adrian on 3/14/09.
//  Adrian Kosmaczewski 2009
//

#import "UITextFieldProcessor.h"
#import "NSString+Nib2ObjcExtensions.h"
#import "NSNumber+Nib2ObjcExtensions.h"
#import "NSDictionary+Nib2ObjcExtensions.h"

@implementation UITextFieldProcessor

- (void)dealloc
{
    [super dealloc];
}

- (NSString *)getProcessedClassName
{
    return @"UITextField";
}

- (void)processKey:(id)item value:(id)value
{
    if ([item isEqualToString:@"text"])
    {
        [output setObject:[value quotedAsCodeString] forKey:item];
    }
    else if ([item isEqualToString:@"placeholder"])
    {
        [output setObject:[value quotedAsCodeString] forKey:item];
    }
    else if ([item isEqualToString:@"textAlignment"])
    {
        if ([value intValue] == 0)
            return;
        [output setObject:[value textAlignmentString] forKey:item];
    }
    else if ([item isEqualToString:@"textColor"])
    {
        [output setObject:[value colorString] forKey:item];
    }
    else if ([item isEqualToString:@"font"])
    {
        [output setObject:[value fontString] forKey:item];
    }
    else if ([item isEqualToString:@"borderStyle"])
    {
        typedef NS_ENUM(NSInteger, UITextBorderStyle) {
            UITextBorderStyleNone,
            UITextBorderStyleLine,
            UITextBorderStyleBezel,
            UITextBorderStyleRoundedRect
        };
        if ([value intValue] == UITextBorderStyleNone)
            return;
        [output setObject:[value borderStyleString] forKey:item];
    }
    else if ([item isEqualToString:@"clearsOnBeginEditing"])
    {
        if ([value isDefaultValue:NO])
            return;
        [output setObject:[value booleanString] forKey:item];
    }
    else if ([item isEqualToString:@"adjustsFontSizeToFitWidth"])
    {
        if ([value isDefaultValue:YES])
            return;
        [output setObject:[value booleanString] forKey:item];
    }
    else if ([item isEqualToString:@"minimumFontSize"])
    {
        if (fabs([value floatValue] - 17.f) < 0.01f)
            return;
        [output setObject:[value floatString] forKey:item];
    }
    else if ([item isEqualToString:@"textInputTraits.enablesReturnKeyAutomatically"])
    {
        if ([value isDefaultValue:NO])
            return;
        [output setObject:[value booleanString] forKey:@"enablesReturnKeyAutomatically"];
    }
    else if ([item isEqualToString:@"textInputTraits.secureTextEntry"])
    {
        if ([value isDefaultValue:NO])
            return;
        [output setObject:[value booleanString] forKey:@"secureTextEntry"];
    }
    else if ([item isEqualToString:@"textInputTraits.keyboardAppearance"])
    {
        if ([value intValue] == 0)
            return;
        [output setObject:[value keyboardAppearanceString] forKey:@"keyboardAppearance"];
    }
    else if ([item isEqualToString:@"textInputTraits.returnKeyType"])
    {
        if ([value intValue] == 0)
            return;
        [output setObject:[value returnKeyTypeString] forKey:@"returnKeyType"];
    }
    else if ([item isEqualToString:@"textInputTraits.autocapitalizationType"])
    {
        if ([value intValue] == 0)
            return;
        [output setObject:[value autocapitalizationTypeString] forKey:@"autocapitalizationType"];
    }
    else if ([item isEqualToString:@"textInputTraits.autocorrectionType"])
    {
        if ([value intValue] == 0)
            return;
        [output setObject:[value autocorrectionTypeString] forKey:@"autocorrectionType"];
    }
    else if ([item isEqualToString:@"textInputTraits.keyboardType"])
    {
        if ([value intValue] == 0)
            return;
        [output setObject:[value keyboardTypeString] forKey:@"keyboardType"];
    }
    else if ([item isEqualToString:@"clearButtonMode"])
    {
        if ([value intValue] == 0)
            return;
        [output setObject:[value clearButtonModeString] forKey:item];
    }
    else
    {
        [super processKey:item value:value];
    }
}

@end
