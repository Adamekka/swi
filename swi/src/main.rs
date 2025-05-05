mod class_diagram;
mod sequence_diagram;

use sequence_diagram::{Product, User};

fn main() {
    let user = User::new();

    let i_phone = Product::Phone("iPhone".to_string());
    let dell = Product::Computer("Dell".to_string());
    let mac_book = Product::Computer("MacBook".to_string());

    let _ = user.add_to_card(i_phone);
    let _ = user.add_to_card(dell);
    let _ = user.add_to_card(mac_book);

    let _ = user.remove_from_cart(Product::Phone("iPhone".to_string()));

    user.save_cart();

    let _ = user.make_order();
}
