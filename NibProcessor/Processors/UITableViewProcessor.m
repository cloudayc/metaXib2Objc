//
//  UITableViewProcessor.m
//  nib2objc
//
//  Created by Adrian on 3/15/09.
//  Adrian Kosmaczewski 2009
//

#import "UITableViewProcessor.h"
#import "NSNumber+Nib2ObjcExtensions.h"

@implementation UITableViewProcessor

- (void)dealloc
{
    [super dealloc];
}

- (NSString *)getProcessedClassName
{
    return @"UITableView";
}

- (NSString *)constructorString
{
    NSString *style = [[self.input objectForKey:@"style"] tableViewStyleString];
    NSString *frame = [self frameString];
    return [NSString stringWithFormat:@"[[%@ alloc] initWithFrame:%@ style:%@]", [self getProcessedClassName], frame, style];
}

- (void)processKey:(id)item value:(id)value
{
    if ([item isEqualToString:@"rowHeight"])
    {
        if ([value intValue] == 44)
            return;
        [output setObject:[value description] forKey:item];
    }
    else if ([item isEqualToString:@"sectionFooterHeight"])
    {
        if ([value intValue] == 22)
            return;
        [output setObject:[value description] forKey:item];
    }
    else if ([item isEqualToString:@"sectionHeaderHeight"])
    {
        if ([value intValue] == 22)
            return;
        [output setObject:[value description] forKey:item];
    }
    else if ([item isEqualToString:@"separatorStyle"])
    {
        if ([value intValue] <= 0)
            return;
        [output setObject:[value tableViewCellSeparatorStyleString] forKey:item];
    }
    else if ([item isEqualToString:@"sectionIndexMinimumDisplayRowCount"])
    {
        if ([value intValue] == 0)
            return;
        [output setObject:[value intString] forKey:item];
    }
    else if ([item isEqualToString:@"allowsMultipleSelection"])
    {
        if ([value isDefaultValue:NO])
            return;
        [output setObject:[value booleanString] forKey:item];
    }
    else if ([item isEqualToString:@"allowsMultipleSelectionDuringEditing"])
    {
        if ([value isDefaultValue:NO])
            return;
        [output setObject:[value booleanString] forKey:item];
    }
    else if ([item isEqualToString:@"allowsSelection"])
    {
        if ([value isDefaultValue:YES])
            return;
        [output setObject:[value booleanString] forKey:item];
    }
    else if ([item isEqualToString:@"allowsSelectionDuringEditing"])
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
