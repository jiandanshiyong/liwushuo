//
//  PopoverSortView.m
//  LWS
//
//  Created by 张凯 on 16/8/20.
//  Copyright © 2016年 zk. All rights reserved.
//

#import "PopoverSortView.h"
#import "DEFINE.h"
#import "PopoverSortCell.h"

@interface PopoverSortView()<UITableViewDataSource, UITableViewDelegate>
@property(nonatomic, strong) UIImageView * bgImageView;
@property(nonatomic, strong) UITableView * tableView;

@property(nonatomic, strong) NSArray * dataArray;
@property(nonatomic, assign) NSInteger markSelectCellRow; //选中的cell

@end

@implementation PopoverSortView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    self.dataArray = @[@"默认排序",@"按热度排序", @"价格从低到高", @"价格从高到低"];
    self.markSelectCellRow = 0;
    
    self.hidden = true;
    [self addSubview:self.bgImageView];
    
    [self addSubview:self.tableView];
}


#pragma mark - action

- (void)show{
    // 更改anchorPoint后，position(frame)会改变
    CGPoint oldposition = self.layer.position;
    CGPoint oldanchorPoint = self.layer.anchorPoint;
    
    CGPoint newanchorPoint = CGPointMake(0.5, 0);
    CGFloat newpositionX = oldposition.x + (newanchorPoint.x - oldanchorPoint.x)  * self.bounds.size.width;
    CGFloat newpositionY = oldposition.y + (newanchorPoint.y - oldanchorPoint.y)  * self.bounds.size.height;
    
    self.hidden = NO;
    CGAffineTransform transform = CGAffineTransformMakeScale(1.0, 0.0);
    self.layer.anchorPoint = CGPointMake(0.5, 0);
    self.layer.position = CGPointMake(newpositionX, newpositionY);
    
    [UIView animateWithDuration:0.2 animations:^{
        self.transform = CGAffineTransformIdentity;
    }];
}

- (void)hide{   //先变小，再隐藏
    [UIView animateWithDuration:0.2
                     animations:^{
                         self.transform = CGAffineTransformMakeScale(1.0, 0.00001);
                     } completion:^(BOOL finished) {
                         self.hidden = YES;
                     }];
}


#pragma mark - 懒加载

- (UIImageView *)bgImageView{
    if (_bgImageView == nil) {
        _bgImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"popover_background_right"]];
        _bgImageView.frame = self.bounds;
    }
    
    return _bgImageView;
}

- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 10, self.yzWidth, self.yzHeight - 14) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource =self;
        _tableView.sectionHeaderHeight = 0.0001;
        _tableView.sectionFooterHeight = 0.0001;
        _tableView.backgroundView = nil;
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.separatorInset = UIEdgeInsetsZero;
        _tableView.layoutMargins = UIEdgeInsetsZero;
        _tableView.separatorColor = UICOLOR_RGB(120, 120, 120, 1.0);
        
        [_tableView registerNib:[UINib nibWithNibName:@"PopoverSortCell" bundle:nil] forCellReuseIdentifier:@"PopoverSortCell"];
        _tableView.tableFooterView = [[UIView alloc] init];
    }
    return _tableView;
}


#pragma mark - UITableViewDataSource, UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    PopoverSortCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PopoverSortCell"];
    
    cell.layoutMargins = UIEdgeInsetsZero;
    cell.preservesSuperviewLayoutMargins = NO;
    cell.textLab.text = self.dataArray[indexPath.row];
    cell.selectBtn.hidden = (indexPath.row == self.markSelectCellRow ? NO : YES);
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row < self.dataArray.count) {
        self.markSelectCellRow = indexPath.row;
        [self.tableView reloadData];
    }else{
        [self hide];
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44.0;
}

@end
