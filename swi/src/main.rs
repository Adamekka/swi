#[derive(Debug)]
struct Product;

#[derive(Debug)]
struct User {
    id: usize,
    name: String,
    password: String,
    email: String,
}

impl User {
    fn register(&mut self, password: String) -> bool {
        todo!();
    }

    fn login(&mut self, password: String) -> bool {
        todo!();
    }

    fn change_password(&mut self, old_password: String, new_password: String) -> bool {
        todo!();
    }

    fn search_product(&self, name: String) -> Product {
        todo!();
    }

    fn make_order(&mut self) {
        todo!();
    }
}

fn main() {}
