//
//  ViewController.m
//  1st_example
//
//  Created by Eliot Arntz on 2/10/13.
//  Copyright (c) 2013 Jason. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	_textField.delegate = self;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _label.text = @"tasks";
    [self doSomething];
    if (_tasks ==nil){
        _tasks = [[NSMutableArray alloc]initWithCapacity:10];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)button:(id)sender {
    
    NSString *string = _textField.text;
    [_tasks addObject:string];
    NSLog (@"%@",_tasks);
    [_tableView reloadData];
}
-(void)doSomething{
    NSLog(@"hello world");
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField{
   
    [_textField resignFirstResponder];
    return YES;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //the following code is largely standard for UITableView setup. Copy and paste this code
    static NSString *Cellidentifier = @"Cell";
    
    UITableViewCell *cell = (UITableViewCell *) [tableView dequeueReusableCellWithIdentifier:Cellidentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:Cellidentifier];
    }
    
    cell.contentView.backgroundColor = [UIColor whiteColor];
    cell.textLabel.shadowColor = [UIColor blackColor];
    cell.textLabel.textColor = [UIColor blackColor];
    
    cell.textLabel.text = [_tasks objectAtIndex:indexPath.row];
    
    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _tasks.count;
}
							
@end
