#![allow(dead_code)]
use std::sync::{LazyLock, Mutex};

static ESHOP: LazyLock<Mutex<EShop>> = LazyLock::new(|| {
    Mutex::new(EShop {
        available_products: vec![
            Product::Computer("Dell".to_string()),
            Product::Phone("iPhone".to_string()),
        ],
    })
});

static CART: LazyLock<Mutex<ShoppingCart>> =
    LazyLock::new(|| Mutex::new(ShoppingCart { products: vec![] }));

pub struct User;

#[derive(Debug, PartialEq)]
pub enum Product {
    Computer(String),
    Phone(String),
}

struct ShoppingCart {
    products: Vec<Product>,
}

struct EShop {
    available_products: Vec<Product>,
}

impl User {
    pub fn new() -> Self {
        User
    }

    pub fn add_to_card(&self, product: Product) -> Result<(), ()> {
        let mut cart = CART.lock().unwrap();
        cart.add_to_card(product)
    }

    pub fn remove_from_cart(&self, product: Product) -> Result<(), ()> {
        let mut cart = CART.lock().unwrap();
        cart.remove_from_cart(product)
    }

    pub fn save_cart(&self) {
        let cart = CART.lock().unwrap();
        println!("Saving cart: {:?}", cart.products);
    }

    pub fn make_order(&self) -> Result<(), ()> {
        let cart = CART.lock().unwrap();
        if cart.products.is_empty() {
            println!("Cart is empty");
            return Err(());
        }

        println!("Making order with products: {:?}", cart.products);
        Ok(())
    }
}

impl Product {
    fn is_available(&self) -> bool {
        ESHOP
            .lock()
            .unwrap()
            .available_products
            .iter()
            .any(|p| p == self)
    }
}

impl ShoppingCart {
    fn add_to_card(&mut self, product: Product) -> Result<(), ()> {
        if product.is_available() {
            println!("Product {:?} added to cart", product);
            self.products.push(product);
            return Ok(());
        }

        println!("Product {:?} is not available", product);
        Err(())
    }

    fn remove_from_cart(&mut self, product: Product) -> Result<(), ()> {
        if let Some(pos) = self.products.iter().position(|p| p == &product) {
            self.products.remove(pos);
            println!("Product {:?} removed from cart", product);
            return Ok(());
        }

        println!("Product {:?} not found in cart", product);
        Err(())
    }
}
