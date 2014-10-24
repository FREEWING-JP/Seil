#import "PreferencesManager.h"
#import "Sparkle/SUUpdater.h"
#import "Updater.h"

@interface Updater () {
  SUUpdater* suupdater_;
}
@end

@implementation Updater

- (id)init {
  self = [super init];

  if (self) {
    suupdater_ = [SUUpdater new];
  }

  return self;
}

- (NSString*)getFeedURL:(NSInteger)checkupdate {
  // ----------------------------------------
  // check nothing.
  if (checkupdate == 0) {
    return nil;
  }

  // ----------------------------------------
  // check beta & stable releases.

  // Once we check appcast.xml, SUFeedURL is stored in a user's preference file.
  // So that Sparkle gives priority to a preference over Info.plist,
  // we overwrite SUFeedURL here.
  if (checkupdate == 2) {
    return @"https://pqrs.org/osx/karabiner/files/seil-appcast-devel.xml";
  }

  return @"https://pqrs.org/osx/karabiner/files/seil-appcast.xml";
}

- (void)check:(BOOL)isBackground {
  NSInteger checkupdate = [preferencesManager_ checkForUpdatesMode];
  NSString* url = [self getFeedURL:checkupdate];

  if (!url) {
    NSLog(@"skip checkForUpdates");
    return;
  }
  [suupdater_ setFeedURL:[NSURL URLWithString:url]];

  NSLog(@"checkForUpdates %@", url);
  if (isBackground) {
    [suupdater_ checkForUpdatesInBackground];
  } else {
    [suupdater_ checkForUpdates:nil];
  }
}

- (IBAction)checkForUpdates:(id)sender {
  [self check:NO];
}

- (IBAction)checkForUpdatesInBackground:(id)sender {
  [self check:YES];
}

- (IBAction)checkForUpdatesStableOnly:(id)sender {
  NSString* url = [self getFeedURL:1];
  [suupdater_ setFeedURL:[NSURL URLWithString:url]];
  NSLog(@"checkForUpdates %@", url);
  [suupdater_ checkForUpdates:nil];
}

- (IBAction)checkForUpdatesWithBetaVersion:(id)sender {
  NSString* url = [self getFeedURL:2];
  [suupdater_ setFeedURL:[NSURL URLWithString:url]];
  NSLog(@"checkForUpdates %@", url);
  [suupdater_ checkForUpdates:nil];
}

@end
