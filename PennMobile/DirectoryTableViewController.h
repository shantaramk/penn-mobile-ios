//
//  DirectoryTableViewController.h
//  PennMobile
//
//  Created by Sacha Best on 9/23/14.
//  Copyright (c) 2014 PennLabs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"
#import "PersonTableViewCell.h"

@interface DirectoryTableViewController : UITableViewController <UISearchBarDelegate>

@property NSArray *people;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

-(NSSet *)searchForName:(NSString *)name;

@end
