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

@interface HospitalDetailViewController ()

@end

@implementation HospitalDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self setupContentView];
   
}

- (void)getHospitalId:(NSString *)hospitalId {
    [self showHUD];
    [ApiRequest getHospitalInfo:hospitalId completionBlock:^(ApiResponse *response, NSError *error) {
        if(error) {
            [self showMessage:@"Loi" message:error.localizedDescription];
        }else {
            if (response.success) {
                Hospital *hospital = [Hospital initWithResponse:[response.data objectForKey:@"hospitalInfo"]];
            }else {
                [self showMessage:@"Loi" message:response.message];
            }
        }
    }];
}

- (void)displayHospitalInfo:(Hospital *)hospitalId {
    NSMutableArray *objArray = [NSMutableArray new];
    ImageModel *model1 = [ImageModel new];
    model1.images = _hospital.images;
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
    
    [self.contentView addItems:[self getData]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)setUpUserInterface {
    [self showBackButton];
    self.title = self.hospital.name;
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
