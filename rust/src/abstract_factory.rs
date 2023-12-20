mod abstract_definitions {
    // Abstract Products
    pub trait Sword {
        fn swing(&self);
    }

    pub trait Gun {
        fn shoot(&self);
    }

    // Abstract Factory (w/ associated types)
    pub trait WeaponFactory {
        type S: Sword;
        type G: Gun;

        fn create_sword(&self) -> Self::S;
        fn create_gun(&self) -> Self::G;
    }

    // Abstract Factory (w/ box pointer)
    pub trait DynWeaponFactory {
        fn create_sword(&self) -> Box<dyn Sword>;
        fn create_gun(&self) -> Box<dyn Gun>;
    }
}

mod texas {
    use super::abstract_definitions::{Gun, Sword, WeaponFactory};

    // Concrete Product
    pub struct TexasSword;

    impl Sword for TexasSword {
        fn swing(&self) {
            println!("[ Sharp swinging sound ]")
        }
    }

    pub struct TexasGun;

    impl Gun for TexasGun {
        fn shoot(&self) {
            println!("[ Bbaak Bbaak ]")
        }
    }

    // Concrete Factory
    pub struct TexasWeaponFactory;

    impl WeaponFactory for TexasWeaponFactory {
        type S = TexasSword;
        type G = TexasGun;

        fn create_sword(&self) -> Self::S {
            TexasSword
        }

        fn create_gun(&self) -> Self::G {
            TexasGun
        }
    }
}

mod child {
    use super::abstract_definitions::{Gun, Sword, WeaponFactory};

    // Concrete Product
    pub struct ChildSword;

    impl Sword for ChildSword {
        fn swing(&self) {
            println!("[ Plastic sound ]")
        }
    }

    pub struct ChildGun;

    impl Gun for ChildGun {
        fn shoot(&self) {
            println!("[ Nerf Nerf ]")
        }
    }

    // Concrete factory
    pub struct ChildWeaponFactory;

    impl WeaponFactory for ChildWeaponFactory {
        type S = ChildSword;
        type G = ChildGun;

        fn create_sword(&self) -> Self::S {
            ChildSword
        }

        fn create_gun(&self) -> Self::G {
            ChildGun
        }
    }
}

mod client {
    use super::abstract_definitions::{Gun, Sword, WeaponFactory};

    // Client code
    pub fn create_weapons(factory: impl WeaponFactory) {
        let sword = factory.create_sword();
        sword.swing();

        let gun = factory.create_gun();
        gun.shoot();
    }
}
