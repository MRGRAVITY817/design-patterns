use chrono::NaiveDate;

// Prototype pattern is a built-in feature in Rust,
// by deriving `Clone` trait.
#[derive(Clone, PartialEq, Eq, Debug)]
struct Robot {
    name: String,
    serial_id: String,
    production_date: NaiveDate,
    expiration_date: NaiveDate,
}

#[test]
fn test_robot_clone() {
    let robot = Robot {
        name: "A Robot".to_string(),
        serial_id: "serial-id".to_string(),
        production_date: NaiveDate::default(),
        expiration_date: NaiveDate::default(),
    };

    let cloned_robot = robot.clone();

    assert_eq!(robot, cloned_robot);
}
