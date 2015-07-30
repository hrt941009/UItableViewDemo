//
//  ViewController.h
//  DemoTest
//
//  Created by henyep on 15/7/28.
//  Copyright (c) 2015年 com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *leftTable;
@property (weak, nonatomic) IBOutlet UITableView *rightTable;
@property(nonatomic,strong)NSArray *leftArray;
@end

