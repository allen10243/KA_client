//
//  ACViewController.h
//  Client_Test
//
//  Created by allenhsu on 2015/9/3.
//  Copyright (c) 2015年 Asurada. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface  ACViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *value;

@property (strong, nonatomic) IBOutlet UIPickerView *picker;

@property (strong, nonatomic) NSArray *pickerData;


@end

