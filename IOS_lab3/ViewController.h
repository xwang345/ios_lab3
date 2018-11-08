//
//  ViewController.h
//  IOS_lab3
//
//  Created by Xiaochen Wang on 2018-11-08.
//  Copyright © 2018 Xiaochen Wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *myimage;
@property (weak, nonatomic) IBOutlet UIButton *prev;
@property (weak, nonatomic) IBOutlet UIButton *next;
@property (strong , nonatomic) NSMutableArray * URLs;
@property (strong, nonatomic) dispatch_queue_t imageQueue;

@end

