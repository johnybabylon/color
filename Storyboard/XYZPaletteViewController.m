//
//  XYZPaletteViewController.m
//  Storyboard
//
//  Created by elliott chavis on 12/23/15.
//  Copyright (c) 2015 Robco. All rights reserved.
//

#import "XYZPaletteViewController.h"
#import "XYZColorViewController.h"
#import "XYZColorDescription.h"


@interface XYZPaletteViewController ()

@property (nonatomic) NSMutableArray *colors;

@end


@implementation XYZPaletteViewController

- (NSMutableArray *)colors
{
    if  (!_colors) {
        _colors = [NSMutableArray array];
        
        XYZColorDescription *cd = [[XYZColorDescription alloc] init];
        [_colors addObject:cd];
    }
    return _colors;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView
    numberOfRowsInSection:(NSInteger)section
{
    return [self.colors count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell =
    [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"
                                    forIndexPath:indexPath];
    
    XYZColorDescription *color = self.colors[indexPath.row];
    cell.textLabel.text = color.name;
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"NewColor"]) {
        
        XYZColorDescription *color = [[XYZColorDescription alloc] init];
        [self.colors addObject:color];
        
        UINavigationController *nc = (UINavigationController *)segue.destinationViewController;
        XYZColorViewController *mvc = (XYZColorViewController *)[nc topViewController];
        mvc.colorDescription = color;
    }
    else if ([segue.identifier isEqualToString:@"ExistingColor"]) {
        NSIndexPath *ip = [self.tableView indexPathForCell:sender];
        XYZColorDescription *color = self.colors[ip.row];
        
        XYZColorViewController *cvc = (XYZColorViewController *)segue.destinationViewController;
        cvc.colorDescription = color;
        cvc.existingColor = YES;
    }
}




















@end
