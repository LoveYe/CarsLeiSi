//
//  ViewController.m
//  CarsLeiSi
//
//  Created by MacBookXcZl on 2017/5/31.
//  Copyright © 2017年 MacBookXcZl. All rights reserved.
//

#import "ViewController.h"
#import "FSSegmentTitleView.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,FSSegmentTitleViewDelegate,UIScrollViewDelegate> {
    
    
    NSMutableArray *_dataArray;
}
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIScrollView *scrollView;
//@property (nonatomic, strong) FSBottomTableViewCell *contentCell;
@property (nonatomic, strong) FSSegmentTitleView *titleView;
@end

@implementation ViewController

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self initData0];
    self.scrollView.backgroundColor = [UIColor whiteColor];
    self.tableView.backgroundColor = [UIColor whiteColor];
    
    // 我修改了这个界面
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _dataArray = [NSMutableArray new];
     self.titleView = [[FSSegmentTitleView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 50) titles:@[@"热 门",@"活 动",@"体 验"] delegate:self indicatorType:FSIndicatorTypeEqualTitle];
    [self.view addSubview:self.titleView];
    
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)initData0 {
    
    [_dataArray removeAllObjects];
    [_dataArray addObjectsFromArray:@[@"0",@"1",@"2"]];
    [self.tableView reloadData];
}
-(void)initData1 {
    
    [_dataArray removeAllObjects];
    [_dataArray addObjectsFromArray:@[@"1",@"2",@"3",@"4"]];
    [self.tableView reloadData];
}
-(void)initData2 {
    
    [_dataArray removeAllObjects];
    [_dataArray addObjectsFromArray:@[@"2",@"3",@"4",@"5",@"6"]];
    [self.tableView reloadData];
}
#pragma mark --tableViedwDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *stave = @"state";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:stave];
    if(!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:stave];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    return cell;
}
#pragma mark LazyLoad
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds)-64-50) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.bounces = YES;
        _tableView.separatorStyle =UITableViewCellSeparatorStyleNone;
        [self.scrollView addSubview:_tableView];
    }
    return _tableView;
}
- (UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64+50, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds)-64-50)];
        _scrollView.delegate = self;
        _scrollView.contentOffset = CGPointMake( 0, 0);
        _scrollView.contentSize = CGSizeMake(CGRectGetWidth(self.view.bounds)*3, CGRectGetHeight(self.view.bounds)-64-50);
        _scrollView.pagingEnabled = YES;
        [self.view addSubview:_scrollView];
    }
    return _scrollView;
}
#pragma mark FSSegmentTitleViewDelegate

- (void)FSSegmentTitleView:(FSSegmentTitleView *)titleView startIndex:(NSInteger)startIndex endIndex:(NSInteger)endIndex
{
    switch (endIndex) {
        case 0:
            NSLog(@"0");
             [self initData0];
            break;
        case 1:
            NSLog(@"1");
             [self initData1];
            break;
        case 2:
            NSLog(@"2");
             [self initData2];
            break;

        default:
            break;
    }
}
#pragma mark scrollViewDelegate

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    NSInteger index = scrollView.contentOffset.x/CGRectGetWidth(self.view.bounds)+0.5;
    NSLog(@"%ld",index);
    if (self.scrollView == scrollView) {
        self.titleView.selectIndex = index;
        _tableView.alpha = 0;
        if(index == 0) {
            
            [UIView animateWithDuration:0.3 animations:^{
                _tableView.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds)-64-50);
                 _tableView.alpha = 1;
            }];
            [self initData0];
        }else  if(index == 1) {
            
            [UIView animateWithDuration:0.3 animations:^{
                _tableView.frame = CGRectMake(1*CGRectGetWidth(self.view.bounds), 0, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds)-64-50);
                 _tableView.alpha = 1;
            }];
            [self initData1];
        }
        else  if(index == 2) {
            
            [UIView animateWithDuration:0.3 animations:^{
                _tableView.frame = CGRectMake(2*CGRectGetWidth(self.view.bounds), 0, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds)-64-50);
                 _tableView.alpha = 1;
            }];
            [self initData2];
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
