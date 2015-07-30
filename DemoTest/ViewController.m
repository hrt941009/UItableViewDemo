//
//  ViewController.m
//  DemoTest
//
//  Created by henyep on 15/7/28.
//  Copyright (c) 2015年 com. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
static const char AC[] = {'0','1','2','3','4','5','6','7','8','9',
    'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z',
    'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'};


static long _idIndex = 0;
static const int ID_LENGTH = 4;//"ZZZZ" = 14776335

/**
 * long转为Tools.AC(数字+字母)表示的短ID
 * @param index 支持最小1,最大Long.MAX_VALUE = 9223372036854775807 = aZl8N0y58M7
 *
 */
static NSString *long2ID(long index)
{
    char aid[ID_LENGTH + 1];
    long i = index;
    int m = 0;
    char c;
    for (int j = ID_LENGTH; j >= 0; j--) {
        if (j == ID_LENGTH) {
            c = '\0';
        }else{
            if (i > 0) {
                m =  (int)(i % sizeof(AC));
                c = AC[m];
                i = (i - m) / sizeof(AC);
            }else{
                c = '0';
            }
        }
        aid[j] = c;
    }
    return [NSString stringWithFormat:@"%s",aid];
}

static NSString *nextID()
{
    _idIndex++;
    if(_idIndex <= 0)_idIndex=1;
    return long2ID(_idIndex);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
 
//    uint8_t buf[1024]={66};
//    NSData *data=[NSData dataWithBytes:buf length:sizeof(buf)];
//    int replytype=0;
//    
//    [data getBytes:&replytype length:sizeof(replytype)];
//    NSLog(@"%d",replytype);
//    NSString *aid=nextID();
//    NSString *test=nextID();
//    NSLog(@"%@  %@",aid,test);
//    NSLog(@"%lu",1%sizeof(AC));
    
    
    self.leftArray=@[
                    @{@"title":@"00",
                      @"list":@[@"aaa",@"aaa1",@"aaa2",@"aaa3",@"aaa",@"aaa1",@"aaa2",@"aaa3"]},
                    @{@"title":@"11",
                      @"list":@[@"aaa",@"aaa1",@"aaa2",@"aaa3",@"aaa",@"aaa1",@"aaa2",@"aaa3"]},
                    @{@"title":@"22",
                      @"list":@[@"aaa",@"aaa1",@"aaa2",@"aaa3",@"aaa",@"aaa1",@"aaa2",@"aaa3"]},
                    @{@"title":@"33",
                      @"list":@[@"aaa",@"aaa1",@"aaa2",@"aaa3",@"aaa",@"aaa1",@"aaa2",@"aaa3"]},
                    @{@"title":@"44",
                      @"list":@[@"aaa",@"aaa1",@"aaa2",@"aaa3",@"aaa",@"aaa1",@"aaa2",@"aaa3"]},
                    @{@"title":@"55",
                      @"list":@[@"aaa",@"aaa1",@"aaa2",@"aaa3",@"aaa",@"aaa1",@"aaa2",@"aaa3"]},
                    @{@"title":@"66",
                      @"list":@[@"aaa",@"aaa1",@"aaa2",@"aaa3",@"aaa",@"aaa1",@"aaa2",@"aaa3"]}
                    ];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (tableView==self.leftTable) {
        return 1;
    }else{
        return self.leftArray.count;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (tableView==self.leftTable) {
        return 40;
    }else{
        return 50;
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSDictionary *item=[self.leftArray objectAtIndex:section];
    if (tableView==self.leftTable) {
        return self.leftArray.count;
    }else{
        return [[item objectForKey:@"list"]count];
    }
}


-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier=@"cell";
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellIdentifier];
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    cell.selectedBackgroundView=[[UIView alloc]initWithFrame:cell.frame];
    cell.selectedBackgroundView.backgroundColor=[UIColor grayColor];
    if (tableView==self.leftTable) {
        cell.textLabel.text=[self.leftArray[indexPath.row] objectForKey:@"title"];
    }else{
        NSDictionary *dic=[self.leftArray objectAtIndex:indexPath.section];
        cell.textLabel.text=[dic objectForKey:@"list"][indexPath.row];
    }
    return cell;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (tableView==self.rightTable) {
        UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 50)];
        view.backgroundColor=[UIColor grayColor];
        UILabel *label=[[UILabel alloc]initWithFrame:view.bounds];
        NSDictionary *item=[self.leftArray objectAtIndex:section];
        label.text=[item objectForKey:@"title"];
        [view addSubview:label];
        return view;
    }else{
        return nil;
    }
}
-(void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section{
    if (tableView==self.rightTable) {
        [self.leftTable selectRowAtIndexPath:[NSIndexPath indexPathForItem:section inSection:0] animated:YES scrollPosition:UITableViewScrollPositionNone
         ];    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
