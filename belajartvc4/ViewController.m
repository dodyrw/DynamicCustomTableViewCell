//
//  ViewController.m
//  belajartvc4
//
//  Created by Dody Rachmat Wicaksono on 10/24/14.
//  Copyright (c) 2014 dodyrw.com. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    arrTitle = @[@"Lorem ipsum dolor sit amet, ultrices vel ante, ligula interdum posuere in mattis aliquam, tristique nonummy lectus pede ut sem,",@"pellentesque dolor nulla accumsan commodo. Pede mi eleifend velit hendrerit, elementum faucibus donec mauris, in eros nascetur imperdiet, eu pretium ultricies purus sed consequat adipiscing. Nulla amet. Elit porttitor lectus, aenean nec nulla arcu enim turpis nunc",@"Urna hac, libero nisl ipsum metus, suscipit ac tempus ut",@"lectus arcu orci quam sit. Suscipit nulla quis fringilla in ac egestas, metus at magna, erat mauris justo. Porttitor pede lectus vivamus sem sit hendrerit, a recusandae eleifend dolor tellus, urna in nibh elit molestie erat sodales, eget non nec tristique sapien ut"];
    arrSubTitle = @[@"Nulla dui condimentum fermentum blandit nulla",@"dolor sed rhoncus quam",@"eget sit Nulla dui condimentum, vitae justo am",@"mattis Nulla dui condimentum, ut suspendi"];

}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrTitle.count;
}

# pragma cell construct

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self customCellAtIndexPath:indexPath];
}

- (CustomCell *)customCellAtIndexPath:(NSIndexPath *)indexPath {
    CustomCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CustomCellIdentifier forIndexPath:indexPath];
    [self configureCustomCell:cell atIndexPath:indexPath];
    return cell;
}

- (void)configureCustomCell:(CustomCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    NSString *title = arrTitle[indexPath.row];
    [cell.titleLabel setText:title];
    
    NSString *subtitle = arrSubTitle[indexPath.row];
    [cell.subtitleLabel setText:subtitle];
}


#pragma cell height

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self heightForCustomCellAtIndexPath:indexPath];
}

- (CGFloat)heightForCustomCellAtIndexPath:(NSIndexPath *)indexPath {
    static CustomCell *sizingCell = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sizingCell = [self.tableView dequeueReusableCellWithIdentifier:CustomCellIdentifier];
    });
    
    [self configureCustomCell:sizingCell atIndexPath:indexPath];
    return [self calculateHeightForConfiguredSizingCell:sizingCell];
}

- (CGFloat)calculateHeightForConfiguredSizingCell:(UITableViewCell *)sizingCell {
    [sizingCell setNeedsLayout];
    [sizingCell layoutIfNeeded];
    
    CGSize size = [sizingCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    return size.height;
}
@end
