use std::sync::Mutex;

// Static Mutex instance can be ...
// 1. Constructed only once
// 2. Accessed globally
// ...which can be a singleton.
static NUMBERS: Mutex<Vec<i32>> = Mutex::new(Vec::new());

fn add_number(number: i32) {
    NUMBERS.lock().unwrap().push(number);
}

#[test]
fn test_add_three_numbers() {
    add_number(1);
    add_number(1);
    add_number(1);

    assert_eq!(NUMBERS.lock().unwrap().len(), 3)
}
