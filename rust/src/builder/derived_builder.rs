use super::Gender;
use derive_builder::Builder;

#[derive(Debug, PartialEq, Default, Builder)]
#[builder(setter(into))] // enables &str -> String
pub struct User {
    name: String,
    age: i16,
    gender: Gender,
}

#[test]
fn derived_builder_test() {
    let eunbee = User {
        name: "Eunbee Cho".to_string(),
        age: 29,
        gender: Gender::Female,
    };

    let eunbee_from_builder = UserBuilder::default()
        .name("Eunbee Cho") // this is possible thanks to `#[builder(setter(into))]`
        .age(29 as i16)
        .gender(Gender::Female)
        .build()
        .unwrap();

    assert_eq!(eunbee, eunbee_from_builder);
}
