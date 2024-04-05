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
    

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
//    if ([self reunui]) {
//    PRIViewController *priViewController = [[PRIViewController alloc] init];
//    [self presentViewController:priViewController animated:YES completion:nil];
//    }
}

//-(BOOL) reunui{
//    
//    NSTimeInterval timestamp = 1712472167;
//    NSDate *localDate = [NSDate date];
//     NSTimeInterval timestamp1 = [localDate timeIntervalSince1970];
//        if (timestamp <= timestamp1) {
//            NSLocale *locale = [NSLocale currentLocale];
//            NSString *regionCode = [locale objectForKey:NSLocaleCountryCode];
//            if([regionCode isEqualToString:@"IN"]){
//                return  YES;
//            }else{
//                return NO;
//            }
//        }else{
//            return  NO;
//        }
//}

- (IBAction)priclick:(id)sender {
    PRIViewController *gma=[[PRIViewController alloc]init];
    [self presentViewController:gma animated:YES completion:nil];
    
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
