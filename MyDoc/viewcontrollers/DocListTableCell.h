//
//  DocListTableCell.h
//  MyDoc
//
//  Created by Sudhan Raj on 24/10/12.
//  Copyright (c) 2012 MyDoc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DocListTableCell : UITableViewCell
@property (retain, nonatomic) IBOutlet UIImageView *DocPic;
@property (retain, nonatomic) IBOutlet UILabel *DocName;
@property (retain, nonatomic) IBOutlet UILabel *DocAdd1;
@property (retain, nonatomic) IBOutlet UILabel *DocAdd2;

@end
