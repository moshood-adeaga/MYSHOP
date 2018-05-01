//
//  checkoutViewViewController.m
//  MYSHOP
//
//  Created by Moshood Adeaga on 01/05/2018.
//  Copyright © 2018 Moshood Adeaga. All rights reserved.
//

#import "checkoutViewViewController.h"

@interface checkoutViewViewController ()
@property (strong, nonatomic) NSDictionary *checkOutDict;
@end

@implementation checkoutViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.checkOutDict = [[NSDictionary alloc]init];
    self.checkOutDict = @{ @"APPLE" : @"0.60", @"ORANGE" : @"0.25"};
    
}

- (IBAction)checkOutButton:(id)sender {
    NSString *itemList = self.itemTextfield.text;
    itemList = [itemList uppercaseString];
    itemList = [itemList stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSArray *listItems = [itemList componentsSeparatedByString:@","];
    listItems = [listItems sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    CGFloat totalCost = 0;
    CGFloat price = 0.0 ;
    int occurrencesApple = 0, occurrencesOrange = 0;
    for (int i = 0; i < listItems.count; i++){
        NSString *priceKey = [NSString stringWithString:[listItems objectAtIndex:i]];
        if ([priceKey isEqualToString:@"APPLE"]){
            price = 0.60;
            occurrencesApple++;
        }
        if ([priceKey isEqualToString:@"ORANGE"]){
            price = 0.25;
            occurrencesOrange++;
        }
        price = ceil(price * 1000.0)/1000.0;
        totalCost += price;
        
        if(occurrencesApple % 2 == 0 && occurrencesApple != 0 && [priceKey isEqualToString:@"APPLE"]){
            totalCost -= 0.60;
        }
        if(occurrencesOrange % 3 == 0 && occurrencesOrange != 0 && [priceKey isEqualToString:@"ORANGE"]){
            totalCost -= 0.25;
        }
        
    }
    NSString *costString = [@(totalCost) stringValue];
    self.priceLabel.text =costString;
}
@end
