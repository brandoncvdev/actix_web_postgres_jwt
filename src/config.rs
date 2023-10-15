#[derive(Debug, Clone)]
pub struct Config {
    pub database_url: String,
    pub jwt_secret: String,
    pub jwt_maxage: i64,
    pub port: u16,
}

impl Config {
    pub fn init() -> Config {
        let database_url: String = std::env::var("DATABASE_URL").expect("DATABASE_URL must be set");
        let port_server: String = std::env::var("PORT_SERVER").expect("DATABASE_URL must be set");
        let port_server: u16 = port_server.parse::<u16>().unwrap();
        let jwt_secret = std::env::var("JWT_SECRET_KEY").expect("JWT_SECRET_KEY must be set");
        let jwt_maxage = std::env::var("JWT_MAXAGE").expect("JWT_MAXAGE must be set");

        Config {
            database_url,
            jwt_secret,
            jwt_maxage: jwt_maxage.parse::<i64>().unwrap(),
            port: port_server,
        }
    }
}
