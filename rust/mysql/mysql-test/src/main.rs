fn get_opts() -> MyOpts {
    let opts = MyOpts {
        user: Some("nwiizo".to_string()),
        pass: Some("password".to_string()),
        db_name: Some("dbtest".to_string()),
        ..Default::default()
    };
    return opts;
}

// main
fn main() {

    let opts = get_opts();
    let pool = pool::MyPool::new(opts).unwrap();
    let mut stmt = pool.prepare("select * from test;").unwrap();
    let result = stmt.execute(&[]).unwrap();
    for row in result {
        match row {
            Ok(v) => {
                let name = from_value::<Vec<u8>>(&v[1]);
                let name = String::from_utf8(name).unwrap();
                println!("id: {}, name: {}",  from_value::<i32>(&v[0]), name );
            },
            Err(e) => println!("error! => {:?}", e)
        }
    }

}
