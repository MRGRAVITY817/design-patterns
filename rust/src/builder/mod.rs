mod default_builder; // Default implementation
mod derived_builder; // Easy implementation using `derive_builder` crate

#[derive(Debug, PartialEq, Clone, Copy)]
pub enum Gender {
    Male,
    Female,
}

impl Default for Gender {
    fn default() -> Self {
        Gender::Male
    }
}
