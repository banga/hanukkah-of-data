use std::{error::Error, io};

#[derive(Debug, serde::Deserialize)]
pub struct Customer {
    pub customerid: i64,
    pub name: String,
    pub address: String,
    pub citystatezip: String,
    pub birthdate: String,
    pub phone: String,
    pub timezone: String,
    pub lat: f64,
    pub long: f64,
}

pub fn read_customers() -> Result<Vec<Customer>, Box<dyn Error>> {
    let mut rdr = csv::Reader::from_reader(io::stdin());
    let mut customers = Vec::new();
    for result in rdr.deserialize() {
        // Notice that we need to provide a type hint for automatic
        // deserialization.
        let record: Customer = result?;
        customers.push(record);
    }
    Ok(customers)
}

pub fn string_to_phone_number(s: &str) -> Option<String> {
    let mut phone_number = String::new();
    for char in s.to_ascii_uppercase().chars() {
        let n = match char {
            'A'..='C' => '2',
            'D'..='F' => '3',
            'G'..='I' => '4',
            'J'..='L' => '5',
            'M'..='O' => '6',
            'P'..='S' => '7',
            'T'..='V' => '8',
            'W'..='Z' => '9',
            _ => return None,
        };
        phone_number.push(n);
    }
    Some(phone_number)
}
