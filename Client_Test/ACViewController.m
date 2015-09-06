//
//  ACViewController.m
//  Client_Test
//
//  Created by allenhsu on 2015/9/3.
//  Copyright (c) 2015年 Asurada. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ACViewController.h"
#import "ServiceConnector.h"
#import "JSONDictionaryExtensions.h"

@interface ACViewController ()

@end

@implementation ACViewController
@synthesize value;
@synthesize picker;
@synthesize  pickerData;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    pickerData = @[@"生活", @"飲食", @"玩樂", @"交通"];

    self.picker.dataSource = self;
    self.picker.delegate = self;
}

- (IBAction)submit:(id)sender {
    
    
    if(value.text != nil)
    {
        ServiceConnector *serviceConnector = [[ServiceConnector alloc] init];
        serviceConnector.delegate = self;
        [serviceConnector postTest: value.text and:
        [self.pickerData objectAtIndex:[self.picker selectedRowInComponent:0]]
                                go:@"http://192.168.1.105/upload.php"];

    }
    

}


-(void)requestReturnedData:(NSData *)data{ //activated when data is returned
    
    NSDictionary *dictionary = [NSDictionary dictionaryWithJSONData:data];
    NSString *reply = [dictionary objectForKey:@"response"];
    NSLog(@"%@",reply);

}



//////////////////////////////////////////////////////////////////////////////////
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// The number of columns of data
- (int)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// The number of rows of data
- (int)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return pickerData.count;
}

// The data to return for the row and component (column) that's being passed in
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return pickerData[row];
}

@end