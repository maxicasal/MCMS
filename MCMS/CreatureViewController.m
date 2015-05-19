
#import "CreatureViewController.h"

@interface CreatureViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *creatureNameLabel;
@property (weak, nonatomic) IBOutlet UIButton *editButton;
@property (weak, nonatomic) IBOutlet UITextField *creatureNameText;
@property (weak, nonatomic) IBOutlet UILabel *creatureDetailLabel;
@property (weak, nonatomic) IBOutlet UIImageView *creatureImageView;
@property NSMutableArray *accessories;
@end

@implementation CreatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.creatureNameLabel.text = self.creatureName;
    self.creatureNameText.text = self.creatureName;
    self.creatureNameText.alpha = 0.0;
    self.creatureDetailLabel.text = self.creatureDetail;
    self.creatureImageView.image = self.creatureImage;
    self.accessories = self.creatureAccessories;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)onEditButtonPressed:(id)sender {
    if ([self.editButton.titleLabel.text isEqualToString:@"Edit"]) {
        [self.editButton setTitle:@"Done" forState:normal];
        self.creatureNameLabel.alpha = 0.0;
        self.creatureNameText.alpha = 1.0;
    }else{
        self.creatureName = self.creatureNameText.text;
        self.creatureNameLabel.text = self.creatureName;
        [self.editButton setTitle:@"Edit" forState:normal];
        self.creatureNameLabel.alpha = 1.0;
        self.creatureNameText.alpha = 0.0;
    }
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.accessories.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyAccessoryID" forIndexPath:indexPath];
    NSString *accessory = self.accessories[indexPath.row];
    cell.textLabel.text = accessory;
    return cell;
}
@end
