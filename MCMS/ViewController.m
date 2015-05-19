//
//  ViewController.m
//  MCMS
//
//  Created by Maxi Casal on 10/7/14.
//  Copyright (c) 2014 Maxi Casal. All rights reserved.
//

#import "ViewController.h"
#import "MagicCreature.h"
#import "CreatureViewController.h"
#import "BattleViewController.h"
@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property NSMutableArray *creatures;
@property (weak, nonatomic) IBOutlet UITextField *creatureName;
@property (weak, nonatomic) IBOutlet UITableView *creaturesTable;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    MagicCreature *magicCreature = [[MagicCreature alloc] init];
    magicCreature.name = @"Creature";
    magicCreature.detailCreature = @"Green Arrow";
    magicCreature.creatureImage = [UIImage imageNamed: @"Arrow"];
    magicCreature.accesoriesFromCreature = [[NSMutableArray alloc] initWithObjects:@"Bow", @"Arrow", @"Sword", nil];
    MagicCreature *magicCreature2 = [[MagicCreature alloc] init];
    magicCreature2.name = @"Magic creature";
    magicCreature2.detailCreature = @"X-men";
    magicCreature2.creatureImage = [UIImage imageNamed: @"Creature1"];
    magicCreature2.accesoriesFromCreature = [[NSMutableArray alloc] initWithObjects:@"Gun", @"Acid", @"Sword", nil];
    MagicCreature *magicCreature3 = [[MagicCreature alloc] init];
    magicCreature3.name = @"The creature";
    magicCreature3.detailCreature = @"The beast";
    magicCreature3.creatureImage = [UIImage imageNamed: @"Creature2"];
    self.creatures = [NSMutableArray arrayWithObjects:magicCreature,magicCreature2,magicCreature3, nil];
}

- (IBAction)onAddCreaturePressed:(id)sender {
    NSString *name = self.creatureName.text;
    if (name.length != 0) {
        MagicCreature *newCreature = [[MagicCreature alloc]init];
        newCreature.name = name;
        [self.creatures addObject: newCreature];
        [self.creaturesTable reloadData];
        self.creatureName.text = @"";
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.creatures.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCellID" forIndexPath:indexPath];
    
    MagicCreature *creature = self.creatures[indexPath.row];
    cell.textLabel.text = creature.name;
    cell.detailTextLabel.text = creature.detailCreature;
    cell.imageView.image = creature.creatureImage;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
}
- (IBAction)onBattleTimePressed:(id)sender {
}


-(IBAction) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *indexPath = [self.creaturesTable indexPathForSelectedRow];
    CreatureViewController *detailViewController = segue.destinationViewController;
    MagicCreature *selectedCreature = self.creatures[indexPath.row];
    detailViewController.creatureName = selectedCreature.name;
    detailViewController.creatureDetail = selectedCreature.detailCreature;
    detailViewController.creatureImage = selectedCreature.creatureImage;
    detailViewController.creatureAccessories = selectedCreature.accesoriesFromCreature;
}


@end
