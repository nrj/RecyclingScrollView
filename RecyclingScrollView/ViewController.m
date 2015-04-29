//
//  ViewController.m
//  RecyclingScrollView
//
//  Created by Nick Jensen on 4/28/15.
//  Copyright (c) 2015 Nick Jensen. All rights reserved.
//

#import "ViewController.h"
#import "RecyclingScrollView.h"

@interface ViewController () <RecyclingScrollViewDataSource>
@end

@implementation ViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    
    CGRect bounds = [[self view] bounds];
    CGSize itemSize = CGSizeMake(250.0, 250.0);
    CGRect scrollFrame;
    scrollFrame.size = itemSize;
    scrollFrame.origin.x = floor(0.5 * (bounds.size.width - itemSize.width));
    scrollFrame.origin.y = floor(0.1 * (bounds.size.height - itemSize.height));
    
    RecyclingScrollView *scrollView = [[RecyclingScrollView alloc] initWithFrame:scrollFrame];
    [scrollView setDataSource:self];
    [scrollView setItemSize:itemSize];
    [[self view] addSubview:scrollView];
    
    /* === For demonstration purposes only === */
    [[scrollView layer] setBorderWidth:2.0];
    [[scrollView layer] setBorderColor:[[UIColor greenColor] CGColor]];
    [scrollView setShowsHorizontalScrollIndicator:NO];
    [scrollView setClipsToBounds:NO];
    
    UIView *left  = [[UIView alloc] initWithFrame:CGRectMake(0, scrollFrame.origin.y, scrollFrame.origin.x, scrollFrame.size.height)];
    [left setBackgroundColor:[UIColor whiteColor]];
    [left setAlpha:0.6];
    [[self view] addSubview:left];
    
    UIView *right = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(scrollFrame), scrollFrame.origin.y, scrollFrame.origin.x, scrollFrame.size.height)];
    [right setBackgroundColor:[UIColor whiteColor]];
    [right setAlpha:0.6];
    [[self view] addSubview:right];
    /* ======================================== */
}

- (NSInteger)numberOfItemsInRecyclingScrollView:(RecyclingScrollView *)scrollView {
    
    return 10;
}

- (UIView *)recyclingScrollView:(RecyclingScrollView *)scrollView
             cellForItemAtIndex:(NSInteger)index {
    
    UIImageView *cell = [scrollView dequeueReusableCell];
    if (!cell) {
        cell = [[UIImageView alloc] init];
    }
    [cell setImage:[UIImage imageNamed:@"nes"]];
    return cell;
}

@end
