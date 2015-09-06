//
//  ViewController.m
//  Client_Test
//
//  Created by allenhsu on 2015/8/7.
//  Copyright (c) 2015年 Asurada. All rights reserved.
//

#import "ViewController.h"
#import "ServiceConnector.h"
#import "JSONDictionaryExtensions.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize account_TF;
@synthesize password_TF;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)submit:(id)sender {
    
    ServiceConnector *serviceConnector = [[ServiceConnector alloc] init];
    serviceConnector.delegate = self;
    [serviceConnector postTest:account_TF.text and:password_TF.text go:@"http://192.168.1.105/test.php"];
    
    
    
}
-(void)requestReturnedData:(NSData *)data{ //activated when data is returned
    
    NSDictionary *dictionary = [NSDictionary dictionaryWithJSONData:data];
//    output.text = dictionary.JSONString; // set the textview to the raw string value of the data recieved
    
   // NSLog(@"%@",dictionary);
  //  NSLog(@"%@",data);
    NSString *reply = [dictionary objectForKey:@"response"];
    
  //   NSLog(@"%@",reply);

    
    if([reply isEqualToString:@"correct"])
    {
        //NSLog(@"same!");
        [self performSegueWithIdentifier:@"next" sender:self];
    
    }
}


@end
