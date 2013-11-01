//
//  MainWindow.m
//  Command Line
//
//  Created by wyq on 13-10-25.
//
//

#import "MainWindow.h"
#import "NibProcessor.h"

@implementation MainWindow

- (void)awakeFromNib
{
    _parseCompletely = YES;
    
    NSArray *scaleFactor = [[NSUserDefaults standardUserDefaults] objectForKey:@"scaleFactor"];
    if (scaleFactor)
    {
        [_xScaleFactor setStringValue:scaleFactor[0]];
        [_yScaleFactor setStringValue:scaleFactor[1]];
        [_wScaleFactor setStringValue:scaleFactor[2]];
        [_hScaleFactor setStringValue:scaleFactor[3]];
    }
}

- (BOOL)parseXibToObjc:(NSString *)filePath
{
    NSAssert(filePath != nil, @"*** file path couldn't be nil!! ***");
    
    if (!([filePath hasSuffix:@".xib"] || [filePath hasSuffix:@".nib"]))
    {
        return NO;
    }
    
    NSArray *scaleFactors = @[[_xScaleFactor stringValue],
                     [_yScaleFactor stringValue],
                     [_wScaleFactor stringValue],
                     [_hScaleFactor stringValue]];
    [[NSUserDefaults standardUserDefaults] setObject:scaleFactors forKey:@"scaleFactor"];
    NSLog(@"start..");
    _parseCompletely = NO;
    
    NibProcessor *processor = [[NibProcessor alloc] init];
    processor.codeStyle = NibProcessorCodeStyleProperties;
    processor.input = filePath;
    processor.frameScaleFactors = scaleFactors;
    [processor process];
    [self.outputTextView setString:processor.output];
    processor = nil;
    
    _parseCompletely = YES;
    NSLog(@"finish...");
    
    return YES;
}

@end
