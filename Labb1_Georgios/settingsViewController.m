//
//  settingsViewController.m
//  Labb1_Georgios
//
//  Created by Georgios on 2018-01-17.
//  Copyright © 2018 Georgios. All rights reserved.
//

#import "settingsViewController.h"
#import "ViewController.h"

//static UIColor *color;

@interface settingsViewController ()
@property (weak, nonatomic) IBOutlet UISlider *redAdjust;
@property (weak, nonatomic) IBOutlet UISlider *greenAdjust;
@property (weak, nonatomic) IBOutlet UISlider *blueAdjust;
@property (weak, nonatomic) IBOutlet UILabel *displayColor;

@end

@implementation settingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self colorRefresh];
}

- (IBAction)slidersChanged:(id)sender {
    [self colorRefresh];
}

- (void)colorRefresh {
    self.displayColor.textColor = [self currentColor];
}

- (UIColor*)currentColor {
    return [UIColor colorWithRed:self.redAdjust.value green:self.greenAdjust.value blue:self.blueAdjust.value alpha:1.0];
}

//Save current color as global tint
- (IBAction)saveCurrentColor:(id)sender {
    [[UIView appearance] setTintColor:[self currentColor]];
}


//- (NSString *)hexStringFromColor:(UIColor *)color {
//    const CGFloat *components = CGColorGetComponents(color.CGColor);
//
//    CGFloat r = components[0];
//    CGFloat g = components[1];
//    CGFloat b = components[2];
//
//    return [NSString stringWithFormat:@"#%02lX%02lX%02lX",
//            lroundf(r * 255),
//            lroundf(g * 255),
//            lroundf(b * 255)];
//}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
