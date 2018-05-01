//
//  checkoutViewViewController.h
//  MYSHOP
//
//  Created by Moshood Adeaga on 01/05/2018.
//  Copyright © 2018 Moshood Adeaga. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface checkoutViewViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *itemTextfield;
- (IBAction)checkOutButton:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

@end
