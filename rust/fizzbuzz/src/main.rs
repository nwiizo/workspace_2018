extern crate rayon;
use rayon::prelude::*;

fn fizzbuzz(i: i32) {
    match (i % 3, i % 5) {
        (0, 0) => { println!("FizzBuzz"); },
        (0, _) => { println!("Fizz"); },
        (_, 0) => { println!("Buzz"); },    
        (_, _) => { println!("{} ", i); }
    }
}

fn main() {
    (1..75).into_par_iter().for_each(|n| { fizzbuzz(n);});
}
