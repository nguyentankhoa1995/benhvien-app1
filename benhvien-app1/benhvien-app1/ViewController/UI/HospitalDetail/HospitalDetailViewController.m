//
//  HospitalDetailViewController.m
//  
//
//  Created by 507-8 on 7/31/17.
//
//

#import "HospitalDetailViewController.h"
#import "ThumImageTableViewCell.h"
#import "HospitalNameCell.h"
#import "AddressCell.h"
#import "PhoneNumberCell.h"
#import "MapCell.h"
#import "ImageCell.h"
#import "ThumbImageModels.h"
#import "HospitalNameModel.h"
#import "AddressModel.h"
#import "PhoneNumberModel.h"
#import "MapModel.h"
#import "ImageModel.h"
#import "DirectionViewController.h"

@interface HospitalDetailViewController ()

@end

@implementation HospitalDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupContentView];
    [self getHospitalId:_hospital.hospitalId];
    [self showDirectionButton];
}

- (void)getHospitalId:(NSString *)hospitalId {
    [self showHUD];
    [ApiRequest getHospitalInfo:hospitalId completionBlock:^(ApiResponse *response, NSError *error) {
        [self hideHUD];
        if(error) {
            [self showMessage:@"Lỗi" message:error.localizedDescription];
        }else {
            if (response.success) {
                Hospital *hospitalData = [Hospital initWithResponse:[response.data objectForKey:@"hospitalInfo"]];
                [self displayHospitalInfo:hospitalData];
                self.hospital = hospitalData;
            }else {
                [self showMessage:@"Lỗi" message:response.message];
            }
        }
    }];
}

- (void)displayHospitalInfo:(Hospital *)hospitalId {
    self.contentView.hidden = false;
    NSMutableArray *objArray = [NSMutableArray new];
    ImageModel *model1 = [ImageModel new];
    model1.images = hospitalId.images;
    [objArray addObject:model1];
    
    HospitalNameModel *model2 = [HospitalNameModel new];
    model2.name = hospitalId.name;
    [objArray addObject:model2];
    
    AddressModel *model3 = [AddressModel new];
    model3.street = hospitalId.street;
    [objArray addObject:model3];
    
    PhoneNumberModel *model4 = [PhoneNumberModel new];
    model4.phones = hospitalId.phones;
    [objArray addObject:model4];
    
    ThumbImageModels *model5 = [ThumbImageModels new];
    model5.hospitalDescipton = hospitalId.hospitalDescipton;
    [objArray addObject:model5];
    
    MapModel *model6 = [MapModel new];
    model6.longtitude = hospitalId.longtitude;
    model6.latitude = hospitalId.latitude;
    [objArray addObject:model6];
    
    [self.contentView addItems:objArray];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)showDirectionButton {
    UIBarButtonItem *button = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"direction-icon"] style:UIBarButtonItemStylePlain target:self action:@selector(directionButtonPresed:)];
    self.navigationItem.rightBarButtonItem= button;
    
}

- (IBAction)directionButtonPresed:(id)sender {
    DirectionViewController *vc = (DirectionViewController *)[DirectionViewController instanceFromStoryboardName:@"Home"];
    vc.hospital = _hospital;
    [self.navigationController showViewController:vc sender:nil];
}

- (void)setUpUserInterface {
    [self showBackButton];
    self.title = self.hospital.name;
    [self showDirectionButton];
}

- (void)setupContentView {
    self.contentView.rowHeight = UITableViewAutomaticDimension;
    self.contentView.estimatedRowHeight = 140;
    [self.contentView registerCell:[ImageCell class] forModel:[ImageModel class]];
    [self.contentView registerCell:[HospitalNameCell class] forModel:[HospitalNameModel class]];
    [self.contentView registerCell:[AddressCell class] forModel:[AddressModel class]];
    [self.contentView registerCell:[PhoneNumberCell class] forModel:[PhoneNumberModel class]];
    [self.contentView registerCell:[ThumImageTableViewCell class] forModel:[ThumbImageModels class]];
    [self.contentView registerCell:[MapCell class] forModel:[MapModel class]];
    self.contentView.hidden = true;
}

- (NSArray *)getData {
    NSMutableArray *objArray = [NSMutableArray new];
    ImageModel *model1 = [ImageModel new];
    [objArray addObject:model1];
    
    HospitalNameModel *model2 = [HospitalNameModel new];
    [objArray addObject:model2];
    
    AddressModel *model3 = [AddressModel new];
    [objArray addObject:model3];
    
    PhoneNumberModel *model4 = [PhoneNumberModel new];
    [objArray addObject:model4];
    
    ThumbImageModels *model5 = [ThumbImageModels new];
    [objArray addObject:model5];
    
    MapModel *model6 = [MapModel new];
    [objArray addObject:model6];
    
    return [objArray mutableCopy];
}
@end
