require("dotenv").config();


module.exports = {
    PORT : process.env.PORT || 3000,
    secret: "auth-secret-key",
}