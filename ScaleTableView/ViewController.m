//
//  ViewController.m
//  ScaleTableView
//
//  Created by ShawnPan on 15/3/25.
//  Mail : developerpans@163.com
//  Copyright (c) 2015年 ShawnPan. All rights reserved.
//

#import "ViewController.h"
#define Imgwidth 828
#define Imgheight 589
#define ScaleImageViewHeight ([UIScreen mainScreen].bounds.size.width*Imgheight/Imgwidth)
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>
@property (strong, nonatomic) IBOutlet UIImageView *scaleImageView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UIImageView *noScaleImage;
@property (strong, nonatomic) IBOutlet UILabel *nicknameLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
}
- (void)viewWillAppear:(BOOL)animated
{
    self.tableView.contentInset = UIEdgeInsetsMake(ScaleImageViewHeight, 0, 0, 0);
    self.scaleImageView.frame = CGRectMake(0, -ScaleImageViewHeight, self.view.frame.size.width, ScaleImageViewHeight);
    [self.tableView addSubview:self.scaleImageView];
    self.noScaleImage.frame = CGRectMake(20, -50, 48, 48);
    [self.tableView addSubview:self.noScaleImage];
    self.nicknameLabel.frame = CGRectMake(88, -42, 80, 30);
    [self.tableView addSubview:self.nicknameLabel];
}

#pragma - mark UIScrollView Delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
   CGFloat y = scrollView.contentOffset.y;
    if (y < -ScaleImageViewHeight)
    {
        CGRect frame = self.scaleImageView.frame;
        frame.size.height = -y;
        frame.origin.y = y;
        self.scaleImageView.frame = frame;
    }
}

#pragma - mark UITableView DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = [@(indexPath.row) stringValue];
    return cell;
}
@end
