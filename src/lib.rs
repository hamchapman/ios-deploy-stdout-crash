#[no_mangle]
pub extern "C" fn try_to_print_to_stdout() {
    println!("Successfully printed from stdout!");
}
