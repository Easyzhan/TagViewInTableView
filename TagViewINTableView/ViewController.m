//
//  ViewController.m
//  TagViewINTableView
//
//  Created by VD-Dragon on 17/3/13.
//  Copyright © 2017年 VD-Dragon. All rights reserved.
//
#import "ViewController.h"
#import "PaContentView.h"
@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) PaContentView *pwView;
@property (nonatomic,strong) NSArray *array;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _array = @[@"小米",@"小米",@"小米回家吃饭",@"小米",@"小米回",@"小米回家淡淡的",@"小米家不会不会不会还不会吧",@"小米回和版本会不会不好不好不好不会不会不会吧好不不好家你你你您",@"小米家"];
    
    //    [self.view addSubview:_pwView];
    
    NSLog(@"---ddd = %f",_pwView.frame.size.height);
    
    [self tableView];
}

#pragma mark lazy loading...
-(UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 40;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identify = @"cellIdentify";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identify];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    
    while ([cell.contentView.subviews lastObject] != nil) {
        [(UIView *)[cell.contentView.subviews lastObject] removeFromSuperview];
    }
    
    if (indexPath.row == 4) {
        _pwView = [[PaContentView alloc]initWithFrame:CGRectMake(40, 0, self.view.frame.size.width - 40,450) dataArr:_array];
        _pwView.backgroundColor = [UIColor whiteColor];
        
        
        [_pwView btnClickBlock:^(NSInteger index) {
            
            NSLog(@"%ld",(long)index);
            
        }];
        
        [cell.contentView addSubview:_pwView];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 4) {
        return _pwView.frame.size.height;
    }
    return 40;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}


@end
