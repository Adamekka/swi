#![allow(dead_code)]
use std::sync::{LazyLock, Mutex};

static ESHOP: LazyLock<Mutex<EShop>> = LazyLock::new(|| {
    Mutex::new(EShop {
        available_products: vec![],
    })
});

static CART: LazyLock<Mutex<ShoppingCart>> =
    LazyLock::new(|| Mutex::new(ShoppingCart { products: vec![] }));

struct User;

#[derive(Debug, PartialEq)]
struct Product;

struct ShoppingCart {
    products: Vec<Product>,
}

struct EShop {
    available_products: Vec<Product>,
}

impl User {
    fn add_to_card(product: Product) -> Result<(), ()> {
        let mut cart = CART.lock().unwrap();
        cart.add_to_card(product)
    }

    fn remove_from_cart(product: Product) -> Result<(), ()> {
        let mut cart = CART.lock().unwrap();
        cart.remove_from_cart(product)
    }

    fn save_cart(&self) {
        let cart = CART.lock().unwrap();
        println!("Saving cart: {:?}", cart.products);
    }

    fn make_order(&self) -> Result<(), ()> {
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
            self.products.push(product);
            println!("Product added to cart");
            return Ok(());
        }

        println!("Product is not available");
        Err(())
    }

    fn remove_from_cart(&mut self, product: Product) -> Result<(), ()> {
        if let Some(pos) = self.products.iter().position(|p| p == &product) {
            self.products.remove(pos);
            println!("Product removed from cart");
            return Ok(());
        }

        println!("Product not found in cart");
        Err(())
    }
}
