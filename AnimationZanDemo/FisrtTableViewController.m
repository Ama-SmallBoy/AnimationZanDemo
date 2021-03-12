//
//  FisrtTableViewController.m
//  AnimationZanDemo
//
//  Created by 星梦 on 2020/3/12.
//  Copyright © 2020 星梦. All rights reserved.
//

#import "FisrtTableViewController.h"
#import "DemoTableViewCell.h"
@interface FisrtTableViewController ()

@end

@implementation FisrtTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"DemoTableViewCell" bundle:nil] forCellReuseIdentifier:@"DemoTableViewCell"];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
      if (section == 0) {
          return 3;
      }else if (section == 1) {
          return 2;
      }else if (section == 2) {
          return 5;
      } else {
          return 10;
      }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 30;
    }else if (indexPath.section == 1) {
        return 20;
    }else if (indexPath.section == 2) {
        return 50;
    } else {
        return 10;
    }
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DemoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DemoTableViewCell" forIndexPath:indexPath];
    
    return cell;
}

@end
