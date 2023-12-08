use std::error::Error;

use hanukkah_of_data::{read_customers, string_to_phone_number};

fn main() -> Result<(), Box<dyn Error>> {
    let customers = read_customers()?;
    for customer in customers {
        let last_name = customer.name.split_ascii_whitespace().last().unwrap();
        if let Some(phone_number) = string_to_phone_number(last_name) {
            if phone_number == customer.phone.replace('-', "") {
                println!("{} {} {}", phone_number, customer.phone, customer.name);
            }
        }
    }
    Ok(())
}
