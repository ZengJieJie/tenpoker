//
//  SevenViewController.m
//  Tenpapoker
//
//  Created by adin on 2024/4/3.
//

#import "SevenViewController.h"

@interface SevenViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btn1;
@property (weak, nonatomic) IBOutlet UIButton *btn2;
@property (weak, nonatomic) IBOutlet UIButton *btn3;
@property (weak, nonatomic) IBOutlet UIButton *btn4;
@property (weak, nonatomic) IBOutlet UIButton *btn5;
@property (weak, nonatomic) IBOutlet UIButton *btn6;
@property (weak, nonatomic) IBOutlet UIButton *btn7;
@property (strong,nonatomic)NSMutableArray *arraytop;

@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, assign) NSInteger secondsRemaining;
@property (weak, nonatomic) IBOutlet UILabel *timlab;
@property (nonatomic, assign) BOOL isTimerPaused;
@property (strong,nonatomic)NSMutableArray *arrayxiab;

@property (weak, nonatomic) IBOutlet UIImageView *ima4;
@property (weak, nonatomic) IBOutlet UIImageView *ima5;
@property (weak, nonatomic) IBOutlet UIImageView *ima6;
@property (weak, nonatomic) IBOutlet UIImageView *ima3;
@property (weak, nonatomic) IBOutlet UIImageView *ima2;
@property (weak, nonatomic) IBOutlet UIImageView *ima1;


@end

@implementation SevenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.arraytop = [NSMutableArray arrayWithObjects:@1, @2, @3, @10, @5, @6,@7,nil];
    
    self.arrayxiab = [NSMutableArray arrayWithObjects:@1, @2, @3, @4,@5,@6, nil];
    [self shuffle:self.arrayxiab];
    self.isTimerPaused = NO;
       self.secondsRemaining = 120;
   
       self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                                     target:self
                                                   selector:@selector(tick)
                                                   userInfo:nil
                                                    repeats:YES];
    
    // Do any additional setup after loading the view from its nib.
    
    
    [self.ima1 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%i",[self.arrayxiab[0] intValue]]]];
    [self.ima2 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%i",[self.arrayxiab[1] intValue]]]];
    [self.ima3 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%i",[self.arrayxiab[2] intValue]]]];
    [self.ima4 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%i",[self.arrayxiab[3] intValue]]]];
    [self.ima5 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%i",[self.arrayxiab[4] intValue]]]];
    [self.ima6 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%i",[self.arrayxiab[5] intValue]]]];
}
- (void)pauseTimer {
    self.isTimerPaused = YES;
}

- (void)resumeTimer {
    self.isTimerPaused = NO;
}
- (void)tick {
    if (self.isTimerPaused) {
            return;
        }
    self.secondsRemaining--;
    if (self.secondsRemaining <= 0) {
        
        [self.timer invalidate];
       
        [self showGameOverAlert];
        
        return;
    }
    self.timlab.text=[NSString stringWithFormat:@"%li",(long)self.secondsRemaining];
}

- (void)showGameAlert {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Finish the game"
                                                                   message:@"Take on more difficult challenges"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK"
                                                       style:UIAlertActionStyleDefault
                                                     handler:^(UIAlertAction * _Nonnull action) {
        [self dismissViewControllerAnimated:YES completion:nil];
        
                                                     }];
    
    [alert addAction:okAction];
    [self presentViewController:alert animated:YES completion:nil];
}


- (void)showGameOverAlert {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Game over"
                                                                   message:@"Time has run out"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK"
                                                       style:UIAlertActionStyleDefault
                                                     handler:^(UIAlertAction * _Nonnull action) {
        [self dismissViewControllerAnimated:YES completion:nil];
                                                     }];
    
    [alert addAction:okAction];
    [self presentViewController:alert animated:YES completion:nil];
}
-(void)pdgmaover{
    if(self.arraytop[0]==self.arrayxiab[0]&&self.arraytop[1]==self.arrayxiab[1]&&self.arraytop[3]==self.arrayxiab[2]&&self.arraytop[4]==self.arrayxiab[3]&&self.arraytop[5]==self.arrayxiab[4]&&self.arraytop[6]==self.arrayxiab[5]) {
        [self pauseTimer];
        [self showGameAlert];
        
    }
   
}

- (void)shuffle:(NSMutableArray *)arraydluan {
    NSUInteger count = [arraydluan count];
    for (NSUInteger i = 0; i < count; ++i) {
        NSInteger remainingCount = count - i;
        NSInteger exchangeIndex = i + arc4random_uniform((u_int32_t )remainingCount);
        [arraydluan exchangeObjectAtIndex:i withObjectAtIndex:exchangeIndex];
    }
}
- (IBAction)tapclick:(UIButton *)sender {
    [self pdnbunyuidon:sender.tag];
}





-(void)pdnbunyuidon:(NSInteger) adcint{
    if ([self loadbool:adcint]) {
        if (adcint==1) {
            if (_btn2.tag==10){
                [self.arraytop replaceObjectAtIndex:1 withObject:self.arraytop[0]];
                [self.arraytop replaceObjectAtIndex:0 withObject:@10];
                
                self.btn2.alpha=1;
                self.btn2.tag=2;
                self.btn1.tag=10;
                self.btn1.alpha=0;
            }else if (_btn7.tag==10){
                [self.arraytop replaceObjectAtIndex:6 withObject:self.arraytop[0]];
                [self.arraytop replaceObjectAtIndex:0 withObject:@10];
                
                self.btn7.alpha=1;
                self.btn7.tag=7;
                self.btn1.tag=10;
                self.btn1.alpha=0;
            }
            
        }
        else if (adcint==2) {
            if (_btn1.tag==10){
                [self.arraytop replaceObjectAtIndex:0 withObject:self.arraytop[1]];
                [self.arraytop replaceObjectAtIndex:1 withObject:@10];
                
                self.btn1.tag=1;
                self.btn1.alpha=1;
                self.btn2.tag=10;
                self.btn2.alpha=0;
            }else if (_btn3.tag==10){
                [self.arraytop replaceObjectAtIndex:2 withObject:self.arraytop[1]];
                [self.arraytop replaceObjectAtIndex:1 withObject:@10];
                self.btn3.tag=3;
                self.btn3.alpha=1;
                self.btn2.tag=10;
                self.btn2.alpha=0;
            }
            
        }
        else if (adcint==3) {
            if (_btn2.tag==10){
                [self.arraytop replaceObjectAtIndex:1 withObject:self.arraytop[2]];
                [self.arraytop replaceObjectAtIndex:2 withObject:@10];
                self.btn2.alpha=1;
                self.btn2.tag=2;
                self.btn3.tag=10;
                self.btn3.alpha=0;
            }else if (_btn4.tag==10){
                [self.arraytop replaceObjectAtIndex:3 withObject:self.arraytop[2]];
                [self.arraytop replaceObjectAtIndex:2 withObject:@10];
                self.btn4.alpha=1;
                self.btn4.tag=4;
                self.btn3.tag=10;
                self.btn3.alpha=0;
            }else if (_btn5.tag==10){
                [self.arraytop replaceObjectAtIndex:4 withObject:self.arraytop[2]];
                [self.arraytop replaceObjectAtIndex:2 withObject:@10];
                self.btn5.alpha=1;
                self.btn5.tag=5;
                self.btn3.tag=10;
                self.btn3.alpha=0;
            }else if (_btn7.tag==10){
                [self.arraytop replaceObjectAtIndex:6 withObject:self.arraytop[2]];
                [self.arraytop replaceObjectAtIndex:2 withObject:@10];
                self.btn7.alpha=1;
                self.btn7.tag=7;
                self.btn3.tag=10;
                self.btn3.alpha=0;
            }
            
        }else  if (adcint==4) {
            if (_btn3.tag==10){
                [self.arraytop replaceObjectAtIndex:2 withObject:self.arraytop[3]];
                [self.arraytop replaceObjectAtIndex:3 withObject:@10];
                self.btn3.alpha=1;
                self.btn3.tag=3;
                self.btn4.tag=10;
                self.btn4.alpha=0;
            }else if (_btn5.tag==10){
                [self.arraytop replaceObjectAtIndex:4 withObject:self.arraytop[3]];
                [self.arraytop replaceObjectAtIndex:3 withObject:@10];
                self.btn5.alpha=1;
                self.btn5.tag=5;
                self.btn4.tag=10;
                self.btn4.alpha=0;
            }
            
        }
        else  if (adcint==5) {
            if (_btn3.tag==10){
                [self.arraytop replaceObjectAtIndex:2 withObject:self.arraytop[4]];
                [self.arraytop replaceObjectAtIndex:4 withObject:@10];
                self.btn3.alpha=1;
                self.btn3.tag=3;
                self.btn5.tag=10;
                self.btn5.alpha=0;
            }else if (_btn4.tag==10){
                [self.arraytop replaceObjectAtIndex:3 withObject:self.arraytop[4]];
                [self.arraytop replaceObjectAtIndex:4 withObject:@10];
                self.btn4.alpha=1;
                self.btn4.tag=4;
                self.btn5.tag=10;
                self.btn5.alpha=0;
            }else if (_btn6.tag==10){
                [self.arraytop replaceObjectAtIndex:5 withObject:self.arraytop[4]];
                [self.arraytop replaceObjectAtIndex:4 withObject:@10];
                self.btn6.alpha=1;
                self.btn6.tag=6;
                self.btn5.tag=10;
                self.btn5.alpha=0;
            }
            
        }
        
        else   if (adcint==6) {
            if (_btn5.tag==10){
                [self.arraytop replaceObjectAtIndex:4 withObject:self.arraytop[5]];
                [self.arraytop replaceObjectAtIndex:5 withObject:@10];
                self.btn5.alpha=1;
                self.btn5.tag=5;
                self.btn6.tag=10;
                self.btn6.alpha=0;
            }else if (_btn7.tag==10){
                [self.arraytop replaceObjectAtIndex:6 withObject:self.arraytop[5]];
                [self.arraytop replaceObjectAtIndex:5 withObject:@10];
                self.btn7.alpha=1;
                self.btn7.tag=7;
                self.btn6.tag=10;
                self.btn6.alpha=0;
            }
            
        }
        
        else  if (adcint==7) {
            if (_btn1.tag==10){
                [self.arraytop replaceObjectAtIndex:0 withObject:self.arraytop[6]];
                [self.arraytop replaceObjectAtIndex:6 withObject:@10];
                self.btn1.alpha=1;
                self.btn1.tag=1;
                self.btn7.tag=10;
                self.btn7.alpha=0;
            }else if (_btn6.tag==10){
                [self.arraytop replaceObjectAtIndex:5 withObject:self.arraytop[6]];
                [self.arraytop replaceObjectAtIndex:6 withObject:@10];
                self.btn6.alpha=1;
                self.btn6.tag=6;
                self.btn7.tag=10;
                self.btn7.alpha=0;
            }else if (_btn3.tag==10){
                [self.arraytop replaceObjectAtIndex:2 withObject:self.arraytop[6]];
                [self.arraytop replaceObjectAtIndex:6 withObject:@10];
                self.btn3.alpha=1;
                self.btn3.tag=3;
                self.btn7.tag=10;
                self.btn7.alpha=0;
            }
            
        }
        
        
        if(self.btn1.tag!=10){
            if([self.arraytop[0] intValue]>4){
                [self.btn1 setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%i",[self.arraytop[0] intValue]-1]] forState:UIControlStateNormal];
            }else{
                [self.btn1 setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%i",[self.arraytop[0] intValue]]] forState:UIControlStateNormal];
            }
            
        }
        
        if(self.btn2.tag!=10){
            if([self.arraytop[1] intValue]>4){
                [self.btn2 setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%i",[self.arraytop[1] intValue]-1]] forState:UIControlStateNormal];
            }else{
                [self.btn2 setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%i",[self.arraytop[1] intValue]]] forState:UIControlStateNormal];
            }
            
        }
        
        if(self.btn3.tag!=10){
            if([self.arraytop[2] intValue]>4){
                [self.btn3 setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%i",[self.arraytop[2] intValue]-1]] forState:UIControlStateNormal];
            }else{
                [self.btn3 setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%i",[self.arraytop[2] intValue]]] forState:UIControlStateNormal];
            }
            
        }
        if(self.btn4.tag!=10){
            if([self.arraytop[3] intValue]>4){
                [self.btn4 setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%i",[self.arraytop[3] intValue]-1]] forState:UIControlStateNormal];
            }else{
                [self.btn4 setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%i",[self.arraytop[3] intValue]]] forState:UIControlStateNormal];
            }
            
        }
        
        if(self.btn5.tag!=10){
            if([self.arraytop[4] intValue]>4){
                [self.btn5 setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%i",[self.arraytop[4] intValue]-1]] forState:UIControlStateNormal];
            }else{
                [self.btn5 setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%i",[self.arraytop[4] intValue]]] forState:UIControlStateNormal];
            }
            
        }
        
        
        if(self.btn6.tag!=10){
            if([self.arraytop[5] intValue]>4){
                [self.btn6 setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%i",[self.arraytop[5] intValue]-1]] forState:UIControlStateNormal];
            }else{
                [self.btn6 setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%i",[self.arraytop[5] intValue]]] forState:UIControlStateNormal];
            }
            
        }
        if(self.btn7.tag!=10){
            if([self.arraytop[6] intValue]>4){
                [self.btn7 setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%i",[self.arraytop[6] intValue]-1]] forState:UIControlStateNormal];
            }else{
                [self.btn7 setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%i",[self.arraytop[6] intValue]]] forState:UIControlStateNormal];
            }
            
        }
        
        [self pdgmaover];
    }}


-(BOOL)loadbool:(NSInteger) adc{
    
    if (adc==10) {
        return NO;
    }
    return  YES;
    
}

- (IBAction)sevenbackclick:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
