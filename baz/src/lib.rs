pub fn all() {
    #[cfg(feature = "a")]
    a();
    #[cfg(feature = "b")]
    b();
    #[cfg(feature = "c")]
    c();
    #[cfg(feature = "d")]
    d();
}
#[cfg(feature = "a")]
pub fn a() {
    println!("a");
}

#[cfg(feature = "b")]
pub fn b() {
    println!("b");
}

#[cfg(feature = "c")]
pub fn c() {
    println!("c");
}

#[cfg(feature = "d")]
pub fn d() {
    println!("d");
}
