//
//  HostViewController.m
//  GSMAlarmSystem
//
//  Created by James on 15-1-24.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "HostViewController.h"
#import <QuartzCore/QuartzCore.h>

@implementation HostTableViewCCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        _title = [[UILabel alloc] init];
        _title.font = kDefaultFont;
        _title.textAlignment = NSTextAlignmentCenter;
        _title.backgroundColor = RGBOF(0xEFEFF0);
        [self.contentView addSubview:_title];
//        _title.layer.borderWidth = 1;
        _title.layer.masksToBounds = YES;
//        _title.layer.borderColor = [kRedColor CGColor];
        _title.layer.cornerRadius = 5;
        
        _next = [[UIImageView alloc] init];
        _next.image = [[UIImage imageNamed:@"next"] imageWithTintColor:kWhiteColor];
        [self.contentView addSubview:_next];
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self relayoutFrameOfSubViews];
}

- (void)relayoutFrameOfSubViews
{
    CGRect rect = self.contentView.bounds;
    _title.frame = CGRectInset(rect, 0, 5);

    [_next sizeWith:CGSizeMake(15, 15)];
    [_next layoutParentVerticalCenter];
    [_next alignParentRightWithMargin:kDefaultMargin];
}

@end

@implementation HostViewController


#if kNeedNavigationBar
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = khost;
    
    [self addEditBarItem];
}

#endif

- (void)addEditBarItem
{
    UIBarButtonItem *edit = [[UIBarButtonItem alloc] initWithTitle:kedit style:UIBarButtonItemStylePlain target:self action:@selector(onEdit)];
    self.navigationItem.rightBarButtonItem = edit;
}

- (void)onEdit
{
    _tableView.editing = !_tableView.editing;
    
    if (_tableView.editing)
    {
        self.navigationItem.rightBarButtonItem.title = kok;
    }
    else
    {
         self.navigationItem.rightBarButtonItem.title = kedit;
    }
    
#if kNeedNavigationBar
#else
    NSString *title = _tableView.editing ? kok : kedit;
    [_editButton setTitle:title forState:UIControlStateNormal];
#endif
}

- (void)configOwnViews
{
    self.data = [[AppSetting sharedInstance] loadMainHost];
}

#if kNeedNavigationBar
- (void)addOwnViews
{
    [super addOwnViews];
    
    _addHost = [[UIButton alloc] init];
    _addHost.backgroundColor = kOrangeColor;
    [_addHost setTitle:kadd_host forState:UIControlStateNormal];
    [_addHost setTitleColor:kWhiteColor forState:UIControlStateNormal];
    [_addHost addTarget:self action:@selector(onAddHost:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_addHost];
}
#else

- (void)addOwnViews
{
    _editButton = [[UIButton alloc] init];
    [_editButton setTitle:kedit forState:UIControlStateNormal];
    [_editButton setTitleColor:kWhiteColor forState:UIControlStateNormal];
    _editButton.backgroundColor = RGBOF(0x727272);
    [_editButton addTarget:self action:@selector(onEdit) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_editButton];
    _editButton.titleLabel.font = kDefaultFont;
    
    
    _contentView = [[UIView alloc] init];
    _contentView.backgroundColor = kWhiteColor;
    [self.view addSubview:_contentView];
    
    
    _contentTitle = [[UILabel alloc] init];
    _contentTitle.textColor = kWhiteColor;
    _contentTitle.backgroundColor = RGBOF(0xC4C4C4);
    _contentTitle.textAlignment = NSTextAlignmentCenter;
    _contentTitle.text = khost;
    _contentTitle.font = kDefaultFont;
    [_contentView addSubview:_contentTitle];
    
    _tableView = [[UITableView alloc] init];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.rowHeight = 40;
    _tableView.backgroundColor = kClearColor;
    [_contentView addSubview:_tableView];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    _addHost = [[UIButton alloc] init];
    _addHost.backgroundColor = RGBOF(0xC4C4C4);
    [_addHost setTitle:kadd_host forState:UIControlStateNormal];
    [_addHost setTitleColor:kWhiteColor forState:UIControlStateNormal];
    [_addHost addTarget:self action:@selector(onAddHost:) forControlEvents:UIControlEventTouchUpInside];
    [_contentView addSubview:_addHost];
    _addHost.titleLabel.font = kDefaultFont;
}


#endif

- (void)onHost:(HostKeyValue *)keyvalue
{
    _tableView.editing = NO;
    [_tableView reloadData];
}

- (void)onAddHost:(UIButton *)button
{
    __weak typeof(self) ws = self;
    AddHostViewController *vc = [[AddHostViewController alloc] initWith:^(HostKeyValue *host) {
        [ws onHost:host];
    }];
    vc.title = [button titleForState:UIControlStateNormal];
    NavigationViewController *nav = [[NavigationViewController alloc] initWithRootViewController:vc];

    [self presentViewController:nav animated:YES completion:^{
        
    }];
}

#if kNeedNavigationBar

- (void)layoutOnIPhone
{
    CGSize size = self.view.bounds.size;
    [_addHost sizeWith:CGSizeMake(size.width, kBottomButtonHeight)];
    [_addHost alignParentBottom];
    
    [_tableView sizeWith:CGSizeMake(size.width, size.height - kBottomButtonHeight)];
    
}
#else

- (void)layoutOnIPhone
{
    [_editButton sizeWith:CGSizeMake(80, 30)];
    [_editButton alignParentLeftWithMargin:10];
    [_editButton alignParentTopWithMargin:30];
    _editButton.layer.cornerRadius = 5;
    
    [_contentView sizeWith:CGSizeMake(self.view.bounds.size.width - 40, 330)];
    [_contentView layoutParentHorizontalCenter];
    [_contentView alignParentTopWithMargin:80];
    
    [_contentTitle sizeWith:CGSizeMake(_contentView.bounds.size.width, 40)];
    
    [_addHost sizeWith:CGSizeMake(_contentView.bounds.size.width - 80, 30)];
    [_addHost alignParentBottomWithMargin:40];
    [_addHost layoutParentHorizontalCenter];
    _addHost.layer.cornerRadius = 5;
    
    
    [_tableView sizeWith:CGSizeMake(_contentView.bounds.size.width - 60, _contentView.bounds.size.height - 120)];
    
    [_tableView layoutParentHorizontalCenter];
    [_tableView layoutBelow:_contentTitle margin:10];
    
}

#endif


#define kMainTableCellIdentifier @"kMainTableCellIdentifier"


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HostTableViewCCell *cell = [tableView dequeueReusableCellWithIdentifier:kMainTableCellIdentifier];
    if (!cell)
    {
        cell = [[HostTableViewCCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kMainTableCellIdentifier];
    }
    
    KeyValue *kv = _data[indexPath.row];
    cell.title.text = kv.key;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    HostKeyValue *kv = _data[indexPath.row];
    [AppSetting sharedInstance].host = kv;
    
    DarshboardViewController *vc = [[DarshboardViewController alloc] init];
    [[AppDelegate sharedAppDelegate] pushViewController:vc];
    
}



- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        HostKeyValue *kv = _data[indexPath.row];
        [[AppSetting sharedInstance] removeHost:kv];
        
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
    }
}


@end
