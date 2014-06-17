//
//  main.m
//  KeyboardSwitcher
//
//  Created by Maksim Bunkow on 18.06.14.
//  Copyright (c) 2014 Bimawa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Carbon/Carbon.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        NSArray* sources = CFBridgingRelease(TISCreateInputSourceList((__bridge CFDictionaryRef)@{ (__bridge NSString*)kTISPropertyInputSourceID : [NSString stringWithUTF8String:argv[1]] }, FALSE));
        TISInputSourceRef source = (__bridge TISInputSourceRef)sources[0];
        OSStatus status = TISSelectInputSource(source);
        if (status != noErr)
            NSLog(@"Error!!");
    }

    return 0;
}