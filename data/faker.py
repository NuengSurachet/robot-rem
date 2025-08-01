from faker import Faker
from robot.api.deco import library

@library
class faker_data:
    def __init__(self):
        self.fake = Faker("th_TH")
    
    def get_company_id(self):
        return str(self.fake.random_int(1000, 9999))
    
    def get_company_name_thai(self):
        return self.fake.company()
    
    def get_company_name_eng(self):
        return self.fake.company()
    
    def get_vat(self):
        return str(self.fake.random_int(100000, 999999))
    
    def get_phone(self):
        return self.fake.phone_number()
    
    def get_all_company_data(self):
        """Return dictionary with all company data"""
        return {
            'CompanyID_Value': self.get_company_id(),
            'CompanyNameThai': self.get_company_name_thai(),
            'CompanyNameEng': self.get_company_name_eng(),
            'vat': self.get_vat(),
            'phone': self.get_phone()
        }
