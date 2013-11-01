//
//  MainWindow.h
//  Command Line
//
//  Created by wyq on 13-10-25.
//
//

#import <Cocoa/Cocoa.h>

@interface MainWindow : NSWindow
{
    IBOutlet NSTextField *_tipLabel;
    
    
    IBOutlet NSTextField *_xScaleFactor;
    IBOutlet NSTextField *_yScaleFactor;
    IBOutlet NSTextField *_wScaleFactor;
    IBOutlet NSTextField *_hScaleFactor;
}

@property (atomic) IBOutlet NSTextView *outputTextView;

@property (nonatomic) BOOL parseCompletely;

- (BOOL)parseXibToObjc:(NSString *)filePath;

@end
