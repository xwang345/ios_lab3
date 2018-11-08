//
//  ViewController.m
//  IOS_lab3
//
//  Created by Xiaochen Wang on 2018-11-08.
//  Copyright © 2018 Xiaochen Wang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

int counterNum = 0;


- (IBAction)navButtonClicked1:(UIButton *)sender {


    //COUNTER can be refactored
    if([sender.titleLabel.text isEqualToString:@"Next"]){
        if(counterNum < 3){
            ++counterNum;
        }
        else{
            counterNum = 0;
        }

    }
    
    else if([sender.titleLabel.text isEqualToString:@"Prev"]){
        if(counterNum >0){
            counterNum--;
        }
        else{
            counterNum = 3;
        }
    }
    
    //QUEUE Threading
    self.imageQueue = dispatch_queue_create("Image", NULL);
    dispatch_async(self.imageQueue, ^{
        NSString* url1 = [NSString stringWithFormat:@"https://raniaarbash.000webhostapp.com/%@",[self.URLs objectAtIndex:counterNum]];
        NSURL* url = [NSURL URLWithString:url1];
        NSData* data = [[NSData alloc]initWithContentsOfURL:url];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.myimage.image = [UIImage imageWithData:data];
        });
    });
}

-(NSMutableArray * ) URLs{
    if(_URLs == nil){
        _URLs = [[NSMutableArray alloc] initWithObjects:@"lobster.jpg",@"pasta.png",@"pizza.jpg",@"steak.jpg", nil];
    }
    return _URLs;
}



- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.imageQueue = dispatch_queue_create("Image", NULL);
    dispatch_async(self.imageQueue, ^{
        NSString* url1 = [NSString stringWithFormat:@"https://raniaarbash.000webhostapp.com/%@",[self.URLs objectAtIndex:counterNum]];
        NSURL* url = [NSURL URLWithString:url1];
        NSData* data = [[NSData alloc]initWithContentsOfURL:url];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.myimage.image = [UIImage imageWithData:data];
        });
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end



