//
//  ViewController.m
//  Sam's Second App
//
//  Created by Alex Fine on 6/5/15.
//  Copyright (c) 2015 AlexFine. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    // get current date/time
    NSDate *today = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    // display in 12HR/24HR (i.e. 11:25PM or 23:25) format according to User Settings
    [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
    NSString *currentTime = [dateFormatter stringFromDate:today];
    NSLog(@"User's current time in their preference format:%@",currentTime);
    //[self.clock1 setText: currentTime];
    [self worldclocks];

}

- (void)worldclocks {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd HH:mm:ss Z";
    
    NSLog(@"System time: %@", [dateFormatter stringFromDate:[NSDate date]]);
    [self.clock1 setText: [dateFormatter stringFromDate:[NSDate date]]];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneWithName:@"Asia/Aqtobe"]];
    
    NSString *dateString = [dateFormatter stringFromDate:[NSDate date]];
    NSLog(@"Aqtobe time: %@", dateString);
    [self.clock2 setText: dateString];
    // date will always contain value in GMT +0:00
    NSDate *date = [dateFormatter dateFromString:dateString];
    NSLog(@"New NSDate (NSDate): %@", [dateFormatter stringFromDate:date]);
    
    // converts date into string
    NSLog(@"New NSDate (NSString): %@", [dateFormatter stringFromDate:date]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
