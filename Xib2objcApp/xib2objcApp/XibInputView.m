//
//  XibInputView.m
//  Command Line
//
//  Created by wyq on 13-10-25.
//
//

#import "XibInputView.h"
#import "MainWindow.h"
#import "AppDelegate.h"

@interface XibInputView()

@property (nonatomic, strong) NSString *filePath;

@end

@implementation XibInputView

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self registerForDraggedTypes:[NSArray arrayWithObjects:NSTIFFPboardType,NSFilenamesPboardType, nil]];
    }
    return self;
}

- (NSDragOperation)draggingEntered:(id )sender
{
    self.layer.borderColor = [NSColor cyanColor].CGColor;
    if ((NSDragOperationGeneric & [sender draggingSourceOperationMask]) == NSDragOperationGeneric)
    {
        return NSDragOperationGeneric;
        
    } 
    return NSDragOperationNone;
    
}
- (void)draggingExited:(id <NSDraggingInfo>)sender
{
    self.layer.borderColor = [NSColor grayColor].CGColor;
//    NSLog(@"%s", __func__);
}

- (BOOL)prepareForDragOperation:(id )sender
{
    return YES;
}

- (BOOL)performDragOperation:(id <NSDraggingInfo>)sender
{
    MainWindow *mainWindow = ((AppDelegate *)[NSApplication sharedApplication].delegate).window;
    if (!mainWindow.parseCompletely)
    {
//        [NSAlert alertWithMessageText:@"parsing" defaultButton:@"comfirm" alternateButton:nil otherButton:nil informativeTextWithFormat:nil];
        return NO;
    }
    NSPasteboard *zPasteboard = [sender draggingPasteboard];
    NSArray *zImageTypesAry = [NSArray arrayWithObjects:
                               NSFilenamesPboardType,
                               nil];
    
    NSString *zDesiredType = [zPasteboard availableTypeFromArray:zImageTypesAry];
    
    if ([zDesiredType isEqualToString:NSFilenamesPboardType])
    {
        NSArray *zFileNamesAry = [zPasteboard propertyListForType:@"NSFilenamesPboardType"];
        NSString *zPath = [zFileNamesAry objectAtIndex:0];
        self.filePath = zPath;
        
        NSLog(@"%s", __func__);
        [mainWindow parseXibToObjc:_filePath];
        self.layer.borderColor = [NSColor grayColor].CGColor;
        return YES;
    }
    
    self.layer.borderColor = [NSColor grayColor].CGColor; 
    return NO;
    
}

- (void)drawRect:(NSRect)dirtyRect
{
	[super drawRect:dirtyRect];
    
    [[NSColor lightGrayColor] setFill];
    NSRectFill(dirtyRect);
	
    [self setWantsLayer:YES];
    self.layer.borderColor = [NSColor grayColor].CGColor;
    self.layer.borderWidth = 2.f;
}

@end
