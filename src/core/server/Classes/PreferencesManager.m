#import "NotificationKeys.h"
#import "PreferencesKeys.h"
#import "PreferencesManager.h"

@interface PreferencesManager () {
  NSMutableDictionary* default_;
}
@end

@implementation PreferencesManager

// ----------------------------------------
+ (void)initialize {
  NSDictionary* dict = @{
    kCheckForUpdates : @YES,
    kShowIconInDock : @NO,
    kResumeAtLogin : @YES,
  };
  [[NSUserDefaults standardUserDefaults] registerDefaults:dict];
}

// ----------------------------------------
- (void)setDefault {
#include "setDefault.h"
}

// ----------------------------------------
- (id)init {
  self = [super init];

  if (self) {
    default_ = [NSMutableDictionary new];
    [self setDefault];
  }

  return self;
}

// ----------------------------------------------------------------------
- (int)value:(NSString*)name {
  NSString* identifier = @"sysctl";

  NSDictionary* dict = [[NSUserDefaults standardUserDefaults] dictionaryForKey:identifier];
  if (dict) {
    NSNumber* number = dict[name];
    if (number) {
      return [number intValue];
    }
  }
  return [self defaultValue:name];
}

- (int)defaultValue:(NSString*)name {
  NSNumber* number = default_[name];
  if (number) {
    return [number intValue];
  } else {
    return 0;
  }
}

- (void)setValue:(int)newval forName:(NSString*)name {
  [self setValue:newval forName:name notificationUserInfo:nil];
}

- (void)setValue:(int)newval forName:(NSString*)name notificationUserInfo:(NSDictionary*)notificationUserInfo {
  NSString* identifier = @"sysctl";

  NSMutableDictionary* md = nil;

  NSDictionary* dict = [[NSUserDefaults standardUserDefaults] dictionaryForKey:identifier];
  if (dict) {
    md = [NSMutableDictionary dictionaryWithDictionary:dict];
  } else {
    md = [NSMutableDictionary new];
  }
  if (!md) return;

  int defaultvalue = 0;
  NSNumber* defaultnumber = default_[name];
  if (defaultnumber) {
    defaultvalue = [defaultnumber intValue];
  }

  if (newval == defaultvalue) {
    [md removeObjectForKey:name];
  } else {
    md[name] = @(newval);
  }

  [[NSUserDefaults standardUserDefaults] setObject:md forKey:identifier];
  // [[NSUserDefaults standardUserDefaults] synchronize];

  [[NSNotificationCenter defaultCenter] postNotificationName:kPreferencesChangedNotification object:nil];
}

// ----------------------------------------------------------------------
- (BOOL)isCheckForUpdates {
  return [[NSUserDefaults standardUserDefaults] boolForKey:kCheckForUpdates];
}

@end
