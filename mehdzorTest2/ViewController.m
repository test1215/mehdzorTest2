//
//  ViewController.m
//  mehdzorTest2
//
//  Created by M on 26.02.15.
//  Copyright (c) 2015 M. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topViewHorizontalSpace;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topViewVerticalSpace;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *botViewHorisontalSpace;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *botViewVerticalSpace;

- (IBAction)midViewTapped:(UITapGestureRecognizer *)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureView];
}

- (void)configureView {
    const CGSize screenSize = self.view.bounds.size;
    const CGSize viewSize = CGSizeMake(screenSize.width / 3.0 * 2.0, 40.0);
    
    self.topViewHorizontalSpace.constant = arc4random_uniform(screenSize.width - viewSize.width);
    self.botViewHorisontalSpace.constant = arc4random_uniform(screenSize.width - viewSize.width);
    
    const CGFloat botViewVerticalSpaceConstant = arc4random_uniform(screenSize.height - viewSize.height * 3) + viewSize.height * 2;
    
    if (self.topViewVerticalSpace.constant + viewSize.height * 2 >= botViewVerticalSpaceConstant) {
        self.topViewVerticalSpace.constant = botViewVerticalSpaceConstant - viewSize.height * 2;
    }
    
    self.botViewVerticalSpace.constant = botViewVerticalSpaceConstant;
    self.topViewVerticalSpace.constant = arc4random_uniform(self.botViewVerticalSpace.constant - viewSize.height * 2);
}

#pragma mark - IBActions

- (IBAction)midViewTapped:(UITapGestureRecognizer *)sender
{
    [self configureView];
}

@end
