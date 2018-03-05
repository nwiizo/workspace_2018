
fn hello() {
  println!("Hello, World!");
}

// モジュール
mod foo {
  // 外から使うので pub をつける
  pub fn hello() {
    println!("Hello, World!!");
  }

  // モジュールは入れ子にできる
  // やっぱり外から使うので pub をつける
  pub mod bar {
    pub fn hello() {
      println!("Hello, World!!!");
    }
  }
}

mod fizz;
mod buzz;

fn main() {
  hello();
  foo::hello();
  foo::bar::hello();
  fizz::hello();
  fizz::bar::hello();
  buzz::hello();
  buzz::bar::hello(); 
}
