use super::Gender;

#[derive(Debug, PartialEq, Default)]
pub struct User {
    name: String,
    age: i16,
    gender: Gender,
}

impl User {
    pub fn builder() -> UserBuilder {
        UserBuilder::default()
    }
}

#[derive(Default)]
pub struct UserBuilder {
    name: String,
    age: i16,
    gender: Gender,
}

impl UserBuilder {
    pub fn new() -> UserBuilder {
        UserBuilder {
            name: "".to_string(),
            age: 0,
            gender: Gender::Male,
        }
    }

    pub fn name(mut self, name: &str) -> UserBuilder {
        self.name = name.to_string();
        self
    }

    pub fn age(mut self, age: i16) -> UserBuilder {
        self.age = age;
        self
    }

    pub fn gender(mut self, gender: Gender) -> UserBuilder {
        self.gender = gender;
        self
    }

    // If we can get away with not consuming the Builder here, that is an advantage.
    // It means we can use the FooBuilder as a template for constructing many Users.
    pub fn build(self) -> User {
        User {
            name: self.name,
            age: self.age,
            gender: self.gender,
        }
    }
}

#[test]
fn builder_default_test() {
    let hoon = User {
        name: "Hoon Wee".to_string(),
        age: 29,
        gender: Gender::Male,
    };

    let hoon_from_builder = UserBuilder::new()
        .name("Hoon Wee")
        .age(29)
        .gender(Gender::Male)
        .build();

    assert_eq!(hoon, hoon_from_builder);
}
