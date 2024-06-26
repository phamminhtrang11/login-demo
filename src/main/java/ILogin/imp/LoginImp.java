package ILogin.imp;


public class LoginImp {

    private static class LoginImpHelper {
        private static final LoginImp ins = new LoginImp();
    }

    public static LoginImp getInstance() {
        return LoginImpHelper.ins;
    }

    public boolean validUser(String username, String password) {
//        String sql = "SELECT COUNT(*) FROM userslogin WHERE username = ? AND password = ?";
//        int count = jdbcTemplate.queryForObject(sql, Integer.class, username, password);

        return "trang".equals(username) && "123".equals(password);
    }
}
