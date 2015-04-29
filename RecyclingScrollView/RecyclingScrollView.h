//
//  RecyclingScrollView.h
//  RecyclingScrollView
//
//  Created by Nick Jensen on 4/28/15.
//  Copyright (c) 2015 Nick Jensen. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RecyclingScrollViewDataSource;

@interface RecyclingScrollView : UIScrollView {
    UIView*       contentView;
    NSRange       renderedRange;
    NSMutableSet* reusableCells;
}

@property (nonatomic, assign) id <RecyclingScrollViewDataSource>dataSource;
@property (nonatomic, assign) CGSize itemSize;

- (id)dequeueReusableCell;

@end


@protocol RecyclingScrollViewDataSource <NSObject>

- (NSInteger)numberOfItemsInRecyclingScrollView:(RecyclingScrollView *)scrollView;
- (UIView *)recyclingScrollView:(RecyclingScrollView *)scrollView
             cellForItemAtIndex:(NSInteger)index;
@end