//
//  LibraryScrollView.m
//  HarmanCommon
//
//  Created by James on 3/12/14.
//  Copyright (c) 2014 Harman. All rights reserved.
//

#import "LibraryScrollView.h"

@implementation LibraryScrollView

- (instancetype)init
{
    if (self = [super init]) {
//        _scrollView.scrollEnabled = NO;
        self.backgroundColor = kClearColor;
        _scrollView.backgroundColor = kClearColor;
        _scrollView.clipsToBounds = YES;
    }
    return self;
}

- (void)relayoutFrameOfSubViews
{
    [super relayoutFrameOfSubViews];
    
    NSInteger pageIndex = _pageIndex;
    _pageIndex = -1;
    
//    [self scrollTo:pageIndex];
    _scrollView.contentSize = CGSizeMake(_scrollView.frame.size.width * _pages.count, 0);
    
    for (NSInteger page = 0 ; page < _pages.count; page++)
    {
        UIViewController *nav = [_pages objectAtIndex:page];
        if (nav.view.superview)
        {
            CGRect rect = _scrollView.bounds;
            rect.origin.x = rect.size.width * page;
            nav.view.frame = rect;
            [nav layoutSubviewsFrame];
        }
    }
    [self scrollTo:pageIndex];
}

- (void)scrollTo:(NSInteger)pageIndex
{
    _pageControlUsed = YES;
    CGFloat pageWidth = _scrollView.frame.size.width;
    CGPoint p = _scrollView.contentOffset;
    p.x = pageIndex * pageWidth;
    _scrollView.contentOffset = p;
    
    if (_pageIndex == pageIndex)
    {
        UIViewController *nav = [_pages objectAtIndex:pageIndex];
        if (nav.view.superview)
        {
            CGRect rect = _scrollView.bounds;
            rect.origin.x = rect.size.width * pageIndex;
            nav.view.frame = rect;
            [nav layoutSubviewsFrame];
        }
    }
    else
    {
        UIViewController *nav = [_pages objectAtIndex:pageIndex];
        
        
        if (nav.view.superview == nil)
        {
            CGRect rect = _scrollView.bounds;
            rect.origin.x = rect.size.width * pageIndex;
            nav.view.frame = rect;
            nav.childSize = rect.size;
            [nav layoutSubviewsFrame];
            [_scrollView addSubview:nav.view];
            
        }
        else
        {
            CGRect rect = _scrollView.bounds;
            rect.origin.x = rect.size.width * pageIndex;
            nav.view.frame = rect;
            [nav layoutSubviewsFrame];
        }
    }
    
    _pageIndex = pageIndex;
    _pageControlUsed = NO;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (_pageControlUsed)
    {
        return;
    }
    
    CGFloat pageWidth = _scrollView.frame.size.width;
    CGPoint offset = _scrollView.contentOffset;
    NSInteger pi = floor(((offset.x - pageWidth/2)/pageWidth)+1);
    
    
    if (_pageIndex == pi)
    {
        return;
    }
    else
    {
//        [self loadPage];
        UIViewController *nav = [_pages objectAtIndex:pi];
        
        
        if (nav.view.superview == nil)
        {
            CGRect rect = _scrollView.bounds;
            rect.origin.x = rect.size.width * pi;
            nav.view.frame = rect;
            nav.childSize = rect.size;
            [nav layoutSubviewsFrame];
            [_scrollView addSubview:nav.view];
            
        }
        else
        {
            CGRect rect = _scrollView.bounds;
            rect.origin.x = rect.size.width * pi;
            nav.view.frame = rect;
            [nav layoutSubviewsFrame];
        }
        _pageIndex = pi;
        
        if ([_delegate respondsToSelector:@selector(onPageScrollView:scrollToPage:)])
        {
            [_delegate onPageScrollView:self scrollToPage:_pageIndex];
        }
    }
}

- (void)loadPage
{
    for (NSInteger page = 0 ; page < _pages.count; page++)
    {
        UIViewController *nav = [_pages objectAtIndex:page];
        
        
        if (nav.view.superview == nil)
        {
            CGRect rect = _scrollView.bounds;
            rect.origin.x = rect.size.width * page;
            nav.view.frame = rect;
            nav.childSize = rect.size;
            [nav layoutSubviewsFrame];
            [_scrollView addSubview:nav.view];

        }
        else
        {
            CGRect rect = _scrollView.bounds;
            rect.origin.x = rect.size.width * page;
            nav.view.frame = rect;
            [nav layoutSubviewsFrame];
        }
    }
}


- (void)roratePages
{
    for (NSInteger page = 0; page < _pages.count; page++)
    {
        UIViewController *nav = [_pages objectAtIndex:page];
        if (nav.view.superview != nil)
        {
            CGRect rect = _scrollView.bounds;
            rect.origin.x = rect.size.width * page;
            nav.view.frame = rect;
            [nav layoutSubviewsFrame];
        }
    }
    
}

- (void)loadPage:(NSInteger)page feedBack:(BOOL)need
{
    if (page < 0)
    {
        return;
    }
    
    if (page >= _pages.count)
    {
        return;
    }
    
    if (_pages.count == 0) {
        return;
    }
    
    UIViewController *nav = [_pages objectAtIndex:page];
    
    
    if (nav.view.superview == nil)
    {
        CGRect rect = _scrollView.bounds;
        rect.origin.x = rect.size.width * page;
        nav.view.frame = rect;
        nav.childSize = rect.size;
        [nav layoutSubviewsFrame];
        [_scrollView addSubview:nav.view];
    }
    else
    {
        CGRect rect = _scrollView.bounds;
        rect.origin.x = rect.size.width * page;
        nav.view.frame = rect;
        [nav layoutSubviewsFrame];
    }
    
    if (need)
    {
        if ([_delegate respondsToSelector:@selector(onPageScrollView:scrollToPage:)])
        {
            [_delegate onPageScrollView:self scrollToPage:page];
        }
    }
    
}


@end
