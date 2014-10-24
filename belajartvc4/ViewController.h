//
//  ViewController.h
//  belajartvc4
//
//  Created by Dody Rachmat Wicaksono on 10/24/14.
//  Copyright (c) 2014 dodyrw.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomCell.h"

static NSString * const CustomCellIdentifier = @"RWBasicCell";

@interface ViewController : UITableViewController{
    NSArray *arrTitle, *arrSubTitle;
}

@end
