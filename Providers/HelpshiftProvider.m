//
//  HelpshiftProvider.m
//  ARAnalytics
//
//  Created by John Arnold on 23 April 2013.
//

#import <Foundation/Foundation.h>
#import "HelpshiftProvider.h"
#import "Helpshift.h"

@implementation HelpshiftProvider
#ifdef AR_HELPSHIFT_EXISTS

- (id)initWithAppID:(NSString *)appID domainName:(NSString *)domainName apiKey:(NSString *)apiKey {
    NSAssert([Helpshift class], @"Helpshift is not included");

    [Helpshift installForAppID:appID domainName:domainName apiKey:apiKey];

    return [super init];
}

- (void)identifyUserWithID:(NSString *)userID andEmailAddress:(NSString *)email {
    if (userID) {
        [Helpshift setUserIdentifier:userID];
    }
    
    if (email) {
        [Helpshift setUseremail:email];
    }
}

- (void)event:(NSString *)event withProperties:(NSDictionary *)properties {
    [Helpshift leaveBreadCrumb:event];
}

- (void)remoteLog:(NSString *)parsedString {
    [Helpshift leaveBreadCrumb:parsedString];
}

#endif
@end

