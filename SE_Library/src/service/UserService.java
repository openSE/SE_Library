package service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dto.User;
import repository.UserRepository;

public class UserService {
	private final Logger LOGGER = LoggerFactory.getLogger(UserService.class.getName());
	private UserRepository userRepository = null;
	
	public UserService() {
		LOGGER.info("[실행] UserService init");
		userRepository = new UserRepository();
	}
	
	public String login(User user) {
		// id, password 비었는지 검사
		String id = user.getId();
		String password = user.getPassword();
		if (id.equals("") || id == null) {
			return "error";
		}
		if (password.equals("") || password == null) {
			return "error";
		}
		
		String role = userRepository.getUser(id, password);
		
		if (role == null) {
			return "error";
		}
		
		return role;
	}
}
