package ILogin.imp;

import ILogin.ILoginDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

//@Repository
public class LoginImp {

    private static class LoginImpHelper {
        private static final LoginImp ins = new LoginImp();
    }

    public static LoginImp getInstance() {
        return LoginImpHelper.ins;
    }

//    @Autowired
//    private JdbcTemplate jdbcTemplate;
//    public LoginImp(JdbcTemplate jdbcTemplate) {
//        this.jdbcTemplate = jdbcTemplate;
//    }
//@Override
    public boolean validUser(String username, String password) {
//        String sql = "SELECT COUNT(*) FROM userslogin WHERE username = ? AND password = ?";
//        int count = jdbcTemplate.queryForObject(sql, Integer.class, username, password);
        return true;
    }
}
