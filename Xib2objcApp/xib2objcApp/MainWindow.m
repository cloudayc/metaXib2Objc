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
}

- (BOOL)parseXibToObjc:(NSString *)filePath
{
    if (!([filePath hasSuffix:@".xib"] || [filePath hasSuffix:@".nib"]))
    {
        return NO;
    }
    NSLog(@"start..");
    _parseCompletely = NO;
//    [_outputTextView setString:@"parsing..."];
    
    NSAssert(filePath != nil, @"*** file path couldn't be nil!! ***");
    
    NibProcessor *processor = [[NibProcessor alloc] init];
    processor.codeStyle = NibProcessorCodeStyleProperties;
    processor.input = filePath;
    [processor process];
    [self.outputTextView setString:processor.output];
    processor = nil;
    
    _parseCompletely = YES;
    NSLog(@"finish...");
    
    return YES;
}

@end
