//
//  ViewController.m
//  Tenpapoker
//
//  Created by adin on 2024/4/3.
//
#import "GmaViewController.h"
#import "ViewController.h"
#import "SixViewController.h"
#import "SevenViewController.h"
#import "GuizeViewController.h"
@interface ViewController ()
@property (nonatomic, strong) NSMutableArray<UIView *> *cardViews;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    }

- (IBAction)btnclick:(id)sender {

    GmaViewController *gma=[[GmaViewController alloc]init];
    [self presentViewController:gma animated:YES completion:nil];
}
- (IBAction)Sixclick:(id)sender {
    SixViewController *gma=[[ SixViewController alloc]init];
    [self presentViewController:gma animated:YES completion:nil];
}
- (IBAction)Hard:(id)sender {
    
    SevenViewController *gma=[[ SevenViewController alloc]init];
    [self presentViewController:gma animated:YES completion:nil];
    
}

- (IBAction)guizeclikc:(id)sender {

    
    GuizeViewController *gma=[[ GuizeViewController alloc]init];
    [self presentViewController:gma animated:YES completion:nil];
    
}


@end
