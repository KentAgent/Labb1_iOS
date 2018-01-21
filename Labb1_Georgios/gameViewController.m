//
//  gameViewController.m
//  Labb1_Georgios
//
//  Created by Georgios on 2018-01-19.
//  Copyright © 2018 Georgios. All rights reserved.
//

#import "gameViewController.h"

@interface gameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *displayGuess;
@property (weak, nonatomic) IBOutlet UISlider *guessSlider;
@property (weak, nonatomic) IBOutlet UIStepper *guessStepper;
@property (weak, nonatomic) IBOutlet UILabel *displayNumber;
@property (weak, nonatomic) IBOutlet UILabel *displayResult;
@property (weak, nonatomic) IBOutlet UILabel *displayNumberOfGuesses;
@end

@implementation gameViewController

int randomNumber;
int numberOfGuesses = 0;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //Set display to "GUESS THE NUMBER!"
    _displayResult.text = @"GUESS THE NUMBER!";
    
    //Creates random number and typecasts to string
    [self getRandomNumber];
    
    //Update slider and stepper on start
    [self numberRefresh];
    
    //Update number of guesses on start
    [self currentGuesses];
    
    //Typecast random number for display for debugging
    //_displayNumber.text = [NSString stringWithFormat:@"%i", randomNumber];
}

- (IBAction)sliderChanged:(id)sender {
    [self numberRefresh];
}

- (int)sliderIntValue {
    int sliderValueInt = ((int) _guessSlider.value);
    NSLog(@"Value of sliderValueInt: %d", sliderValueInt);
    NSLog(@"Float value of guessSlider.value: %f", _guessSlider.value);
    return sliderValueInt;
}

-(NSString*)getRandomNumber {
    randomNumber = [self generateRandomNumber];
    return _displayNumber.text = [NSString stringWithFormat:@"%i", randomNumber];
}

-(void)numberRefresh {
    self.displayGuess.text = [self currentNumber];
}

-(int)generateRandomNumber {
    int randomNumber = arc4random_uniform(99)+1;
    return randomNumber;
}

-(NSString*)currentNumber {
    NSString *number = [NSString stringWithFormat:@"%i", (int) _guessSlider.value];
    return number;
}

-(void)currentGuesses {
    NSString *guesses = [NSString stringWithFormat:@"%i", numberOfGuesses];
    self.displayNumberOfGuesses.text = guesses;
}

- (IBAction)guessButton:(id)sender {
    if (randomNumber == [self sliderIntValue]) {
        _displayResult.text = @"GGWP!";
        numberOfGuesses = 0;
        [self getRandomNumber];
    } else if (randomNumber < [self sliderIntValue]) {
        _displayResult.text = @"TOO HIGH!";
        numberOfGuesses++;
    } else if (randomNumber > [self sliderIntValue]) {
        _displayResult.text = @"TOO LOW!";
        numberOfGuesses++;
    }
    [self currentGuesses];
}


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
