//
//  DocListTableCell.m
//  MyDoc
//
//  Created by Sudhan Raj on 24/10/12.
//  Copyright (c) 2012 MyDoc. All rights reserved.
//

#import "DocListTableCell.h"

@implementation DocListTableCell
@synthesize DocPic, DocName, DocAdd1, DocAdd2;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc {
}
@end
