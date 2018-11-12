//
//  ViewController.m
//  SDAutoLayoutTest
//
//  Created by 王小林 on 9/11/18.
//  Copyright © 2018 王小林. All rights reserved.
//

#import "ViewController.h"
#import "XLKnowLedgeInfo.h"
#import "XLKnowLegeTableViewCell.h"
#import "SDAutoLayout.h"

#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,XLKnowLegeTableViewCellCustemDeleget>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *dataSource;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView=[[UITableView alloc]initWithFrame:self.view.bounds style:(UITableViewStyleGrouped)];
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    [self.view addSubview:self.tableView];
    self.dataSource=@[].mutableCopy;
    [self setData];
}
#pragma mark UITableViewDeleget

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellDe=@"decell";
    XLKnowLegeTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellDe];
    if (!cell) {
        cell=[[XLKnowLegeTableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:cellDe];
    }
    cell.info=self.dataSource[indexPath.section];
    cell.custemDeleget=self;
    
    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1 ;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataSource.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 5;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XLKnowLedgeInfo * model = self.dataSource[indexPath.section];
    
    return [self.tableView cellHeightForIndexPath:indexPath model:model keyPath:@"info" cellClass:[XLKnowLegeTableViewCell class]  contentViewWidth:SCREEN_WIDTH];
//    return 165+SCREEN_WIDTH*0.4;
}
-(void)setData{
    
    NSArray *titleArr=@[@"80年了，我们从未忘记！今天，为死难同胞默哀",@"彩虹网络卡福利费绿调查开房",@" 此步设置用于实现cell的frame缓存，"];
    NSArray *desArr=@[@"产品推介 | 品质生活，蔡司与你相伴，看见真实之美产品推介 | 品质生活，蔡司与你相伴，看见真实之美",@"| 品质生活，蔡司与你相伴，看见真实之美",@"testView为视图内最下方的子视图，bottomMargin为子视图离父视图bottom的距离",@"单行Label的视图,如下，在文本单行",@""];
    
    for (int i=0; i<10; i++) {
        XLKnowLedgeInfo *info=[[XLKnowLedgeInfo alloc]init];
        info.title=titleArr[arc4random()%3];
        info.descriptions=desArr[arc4random()%5];;
        info.img_cover=@"http://www.jingrenclub.com/data/attached/article_cover/1533923533310567637.png";
        info.zan_num=@"9";
        info.zaned=@"0";
        info.short_title=@"关于投诉片，退换货的...";
        info.author=@"Club";
        info.url=@"/api.php?m=default&c=article&a=info&aid=82";
        info.add_time=@"2017-12-13";
        [self.dataSource addObject:info];
    }
    [self.tableView reloadData];
}

-(void)zanClick:(XLKnowLedgeInfo*)info{}
-(void)pinglunClick:(XLKnowLedgeInfo*)info{}
@end
