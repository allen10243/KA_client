//
//  NUViewController.m
//  Client_Test
//
//  Created by allenhsu on 2015/8/13.
//  Copyright (c) 2015年 Asurada. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NUViewController.h"
#import "ServiceConnector.h"
#import "JSONDictionaryExtensions.h"

@interface NUViewController ()

@end

@implementation NUViewController
@synthesize NU_TF1;
@synthesize NU_TF2;
@synthesize NU_TF3;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)submit:(id)sender {
    
    
    if(NU_TF1.text!= nil & NU_TF2.text!= nil & NU_TF3.text != nil)
    {
        ServiceConnector *serviceConnector = [[ServiceConnector alloc] init];
        serviceConnector.delegate = self;
        [serviceConnector postTest: NU_TF1.text and: NU_TF2.text go:@"http://192.168.1.105/newuser.php"];
    }
    
}

@end
