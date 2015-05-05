//
//  FTViewController.m
//  HomeScreen1
//
//  Created by Fergal Tobin on 05/05/2015.
//  Copyright (c) 2015 ___FULLUSERNAME___. All rights reserved.
//
#import "HomeApp.h"
#import "FTViewController.h"
BOOL shakeView=FALSE;


@interface FTViewController ()


@end

@implementation FTViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    [self makeHomeApp] ;
    
    // Was going to have an Array of Object  HomeSCreen Apps - comprising  Image and Text Label
    // Was going  this to create an array of UIButtons and add them as subviews to the view
    // they would each  have a BOOL property to indicate if they shake or not.
    // each subview would be registred to recognize the long tap - but only one function needs to be created to handle all taps.
    
    
    
    // IF I have got the long Tap to register - for some reason Bool value to make them shake them working.
    
    // Dont have the the little circle with the x in the middle implemented yet.
    // I am presuming there is some kind of Badge functionality that can be used or else I will have to create a little circle and two lines in it and add it as a sub view; alternatively use a created image.
    
    // Deleting the icons would be an easy matter of removing hte object from the array of homeApp objects and the array of subviews.
    
    // the highlighying on Selection can be done using UIButton functionality.
    
    
    // need to convert makeHomeApp into a setter for all home apps to be created.
    
    // Need to create an array from here to create orginal screen.
    
    // Need to add functionality to show circle with X - and add gesture recognioser to this subview - and delete appropriate icon if pressed and reset screen to remaining hme screen apps.
  }




-(void) buttonDown
{
    
    NSLog(@"first button Down long pess");
    shakeView=TRUE;
    [self.view setNeedsDisplay];
}


-(void )buttonUp
{
    
}





- (void)handleBtnLongPressGesture:(UILongPressGestureRecognizer *)recognizer {
    
    
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        [self buttonDown];
         shakeView=TRUE;
    }
    
    
    if (recognizer.state == UIGestureRecognizerStateEnded) {
        [self buttonUp];
    }
}





-(void) makeHomeApp {
    
    // _shakeView=NO;
    UIButton *firstButton=[UIButton buttonWithType:UIButtonTypeSystem];
    
    [firstButton setTitle:@"first" forState:UIControlStateNormal];
    firstButton.frame=CGRectMake(40, 70, 60, 60);
    
    firstButton.layer.cornerRadius = 10; // this value vary as per your desire
    // firstButton.clipsToBounds = YES;
    
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(0, 65, 60, 15)];
    label.text=@"hai";
    label.backgroundColor=[UIColor grayColor];
    [firstButton addSubview:label];
    
    //firstButton.text=@"hai";
    firstButton.backgroundColor=[UIColor blueColor];
    //[firstButton addTarget:self action:@selector(firstButtonClicked) forControlEvents: UIControlEventTouchUpInside];
    [self.view addSubview:firstButton];
  
    
    UILongPressGestureRecognizer *btn_LongPress_gesture = [[UILongPressGestureRecognizer alloc]
                                                        initWithTarget:self action:@selector(handleBtnLongPressGesture:)];
    [firstButton addGestureRecognizer:btn_LongPress_gesture];
    
    if (shakeView== TRUE)
    {
        firstButton.transform = CGAffineTransformMakeTranslation(2.0, -2.0);
        [UIView animateWithDuration:0.07
                              delay:0.0
                            options:UIViewAnimationOptionAutoreverse
                         animations:^{
                             UIView.animationRepeatCount = INT64_MAX;
                             firstButton.transform = CGAffineTransformMakeTranslation(-2.0, 2.0);
                         }
                         completion:^(BOOL finished){
                             firstButton.transform = CGAffineTransformIdentity;
                         }];
        
    }
    
}

/*

-( void) ViewDidAppear
{
    if (shakeView==TRUE)
    {
      UIButton *fbutton = [subviews UIButton];
        
        
        1
    firstButton.transform = CGAffineTransformMakeTranslation(2.0, -2.0);
    [UIView animateWithDuration:0.07
                          delay:0.0
                        options:UIViewAnimationOptionAutoreverse
                     animations:^{
                         UIView.animationRepeatCount = INT64_MAX;
                         firstButton.transform = CGAffineTransformMakeTranslation(-2.0, 2.0);
                     }
                     completion:^(BOOL finished){
                         firstButton.transform = CGAffineTransformIdentity;
                     }];
    }
    
}

}

*/
    












- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
