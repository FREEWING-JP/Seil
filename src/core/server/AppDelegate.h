// -*- Mode: objc -*-

#import <Cocoa/Cocoa.h>

@class ClientForKernelspace;
@class OutlineView_mixed;
@class PreferencesController;
@class ServerForUserspace;
@class Updater;

@interface AppDelegate : NSObject <NSApplicationDelegate> {
  IBOutlet OutlineView_mixed* outlineView_mixed_;
  IBOutlet PreferencesController* preferencesController_;
  IBOutlet ServerForUserspace* serverForUserspace_;
  IBOutlet Updater* updater_;
}

@property (weak) IBOutlet ClientForKernelspace* clientForKernelspace;

- (IBAction) launchUninstaller:(id)sender;

@end
