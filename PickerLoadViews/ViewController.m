//
//  ViewController.m
//  PickerLoadViews
//
//  Created by Jose Antonio Gabriel Massana on 05/04/14.
//  Copyright (c) 2014 GabrielMassana. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIPickerViewDelegate, UIPickerViewDataSource, UIActionSheetDelegate>

@property (nonatomic, strong) NSArray *dataPicker;
@property (nonatomic, strong) UIActionSheet *actionSheetPicker;
@property (nonatomic, strong) UIPickerView *picker;

@property (nonatomic, strong) UIView *my1View;
@property (nonatomic, strong) UIView *my2View;
@property (nonatomic, strong) UIView *my3View;
@property (nonatomic, strong) UIView *my4View;
@property (nonatomic, strong) UIView *my5View;
@property (nonatomic, strong) UIView *my6View;
@property (nonatomic, strong) UIView *my7View;
@property (nonatomic, strong) UIView *my8View;

@end

@implementation ViewController

#pragma mark - Life Cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.dataPicker = @[@"View 1",@"View 2",@"View 3",@"View 4",@"View 5",@"View 6",@"View 7",@"View 8"];
    
    self.actionSheetPicker = [[UIActionSheet alloc]initWithTitle:@"" delegate:self cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIPickerViewDelegate

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [self.dataPicker count];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return[NSString stringWithFormat:@"%@",[self.dataPicker objectAtIndex: row]];
}

- (void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    [self setViewForRow:row];
}

#pragma mark - Draw Views Helpers

- (void) setViewForRow: (int) row
{
    if (row == 0)
    {
        if (self.my1View == nil )
        {
            [self drawView:1];
        }
        [self.view bringSubviewToFront:self.my1View];
    }
    else if (row == 1)
    {
        if (self.my2View == nil )
        {
            [self drawView:2];
        }
        [self.view bringSubviewToFront:self.my2View];
    }
    else if (row == 2) {
        if (self.my3View == nil )
        {
            [self drawView:3];
        }
        [self.view bringSubviewToFront:self.my3View];
    }
    else if (row == 3) {
        if (self.my4View == nil )
        {
            [self drawView:4];
        }
        [self.view bringSubviewToFront:self.my4View];
    }
    else if (row == 4) {
        if (self.my5View == nil )
        {
            [self drawView:5];
        }
        [self.view bringSubviewToFront:self.my5View];
    }
    else if (row == 5) {
        if (self.my6View == nil )
        {
            [self drawView:6];
        }
        [self.view bringSubviewToFront:self.my6View];
    }
    else if (row == 6) {
        if (self.my7View == nil )
        {
            [self drawView:7];
        }
        [self.view bringSubviewToFront:self.my7View];
    }
    else if (row == 7) {
        if (self.my8View == nil )
        {
            [self drawView:8];
        }
        [self.view bringSubviewToFront:self.my8View];
    }
}

- (void) drawView: (int) viewNumber
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 100, 320, 100)];
    [view setBackgroundColor:[UIColor redColor]];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 100)];
    [label setText:[NSString stringWithFormat:@"%d",viewNumber]];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setTextColor:[UIColor blackColor]];
    [label setFont:[UIFont fontWithName:@"Helvetica" size:80]];
    [view addSubview:label];
    
    if (viewNumber == 1)
    {
        self.my1View = view;
        [self.view addSubview:self.my1View];
    }
    else if (viewNumber == 2)
    {
        self.my2View = view;
        [self.view addSubview:self.my2View];
    }
    else if (viewNumber == 3)
    {
        self.my3View = view;
        [self.view addSubview:self.my3View];
    }
    else if (viewNumber == 4)
    {
        self.my4View = view;
        [self.view addSubview:self.my4View];
    }
    else if (viewNumber == 5)
    {
        self.my5View = view;
        [self.view addSubview:self.my5View];
    }
    else if (viewNumber == 6)
    {
        self.my6View = view;
        [self.view addSubview:self.my6View];
    }
    else if (viewNumber == 7)
    {
        self.my7View = view;
        [self.view addSubview:self.my7View];
    }
    else if (viewNumber == 8)
    {
        self.my8View = view;
        [self.view addSubview:self.my8View];
    }
}

#pragma mark - Open picker

- (IBAction)goPickerButtonClicked:(id)sender
{
    self.picker = [[UIPickerView alloc] initWithFrame:CGRectMake(0.0, 44.0, 0.0, 0.0)];
    [self.picker setDataSource: self];
    [self.picker setDelegate: self];
    [self.picker setTag:0];
    self.picker.showsSelectionIndicator = YES;
    
    [self.picker setBackgroundColor:[UIColor whiteColor]];
    
    UIToolbar *pickerDateToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    pickerDateToolbar.barStyle = UIBarStyleBlack;
    [pickerDateToolbar sizeToFit];
    
    [pickerDateToolbar setBarTintColor:[UIColor colorWithRed:0.0f/255.0f green:187.0f/255.0f blue:241.0f/255.0f alpha:1.0f]];
    [pickerDateToolbar setTranslucent:NO];
    
    NSMutableArray *barItems = [[NSMutableArray alloc] init];
    
    UIBarButtonItem *flexSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    [barItems addObject:flexSpace];
    
    UIBarButtonItem *doneBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneButtonClicked:)];
    [barItems addObject:doneBtn];
    
    [doneBtn setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys: [UIColor whiteColor],  NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
    
    [pickerDateToolbar setItems:barItems animated:YES];
    
    [self.actionSheetPicker addSubview:pickerDateToolbar];
    [self.actionSheetPicker addSubview:self.picker];
    [self.actionSheetPicker showInView:self.view];
    [self.actionSheetPicker setBounds:CGRectMake(0, 0, 320, 464)];
}

- (void) doneButtonClicked: (id) sender
{
    [self.actionSheetPicker dismissWithClickedButtonIndex:0 animated:YES];

    for (UIView *view in self.actionSheetPicker.subviews)
    {
        [view removeFromSuperview];
    }
}

@end
