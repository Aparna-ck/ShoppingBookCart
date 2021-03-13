package com.app.bookcart.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.app.bookcart.entity.BookCart;
import com.app.bookcart.entity.Order;
import com.app.bookcart.entity.Users;
import com.app.bookcart.service.BookCartService;
import com.app.bookcart.service.UserService;




@Controller
@RequestMapping("/books")
public class BookCartController {

	@Autowired
	private BookCartService bookCartService;

	@Autowired
	private UserService userService;

	@PostMapping("/newUser")
	public String saveUser(@ModelAttribute("users") Users theUser,Model theModel)
	{

		theModel.addAttribute("userss", theUser);
		userService.saveUser(theUser);
		return "userList";
	}

	@GetMapping("/loginUser")
	public String loginUser(Model theModel)
	{
		Users theUser = new Users();
		theModel.addAttribute("users", theUser);
		theModel.addAttribute("message","");
		return "userLogin";

	}


	@GetMapping("/showForm")
	public String showFormForAdd(Model theModel)
	{
		Users theUser = new Users();
		theModel.addAttribute("users", theUser);
		return "registerUser";

	}


	@RequestMapping(path="/list",method=RequestMethod.GET)
	public String listUsers(Model theModel)
	{
		List<Users> theUsers = userService.getUsers();
		theModel.addAttribute("userss", theUsers);
		return "userList";
	}

	@GetMapping("/forgetPassword")
	public String forgetPassword(Model theModel)
	{
		Users theUser = new Users();
		theModel.addAttribute("users", theUser);
		return "resetPassword";
	}

	@PostMapping("/forgetPasswordDetails")
	public String forgetPasswordDetails(@ModelAttribute("users") Users theUser,Model theModel)
	{
		Users userFound = userService.getUser(theUser.getUserId());
		System.out.println("userfound"+userFound);
		if(userFound == null) {
			theModel.addAttribute("message", "Invalid Details");
			return "resetPassword";

		}else {
			userFound.setCity("");
			theModel.addAttribute("user",userFound);
			theModel.addAttribute("message", "");
			return "setPassword";
		}	
	}

	@PostMapping("/newPassword")
	public String newPassword(@ModelAttribute("users") Users theUser,Model theModel)
	{
		Users userFound = userService.getUser(theUser.getUserId());
		userFound.setPassword(theUser.getPassword());
		userService.saveUser(userFound);
		theModel.addAttribute("users",new Users());
		theModel.addAttribute("message", "Password reset successful");
		return "userLogin";
	}

	@PostMapping("/showBooks")
	public String showBooks(@ModelAttribute("users") Users theUser,Model theModel)
	{
		Users userFound = userService.validateUser(theUser);
		if(userFound == null) {
			theModel.addAttribute("message", "WRONG USERID OR PASSSWORD,PLEASE REGISTER");
			return "userLogin";

		}else {
			List<BookCart>  theBooks= bookCartService.getBooks();
			theModel.addAttribute("books", theBooks);
			return "showBooks";
		}

	}

	@GetMapping("/showBooks")
	public String showBook(Model theModel)
	{
		List<BookCart>  theBooks= bookCartService.getBooks();
		theModel.addAttribute("books", theBooks);
		return "showBooks";

	}
	@GetMapping("/chooseBook")
	public String chooseBook(@RequestParam("book_id") int theId,Model theModel)
	{
		BookCart theBooks = bookCartService.getBookCart(theId);
		Order theOrder = new Order();
		theOrder.setBook_id(theId);
		theModel.addAttribute("order", theOrder);
		theModel.addAttribute("books",theBooks);
		return "bookDetails";
	}

	@PostMapping("/getQuantity")
	public String getQuantity(@ModelAttribute("order") Order theOrder,Model theModel) {
		BookCart theBooks = bookCartService.getBookCart(theOrder.getBook_id());
		theModel.addAttribute("order", theOrder);
		theModel.addAttribute("books",theBooks);
		return  "customerForm" ;

	}

	@PostMapping("/confirmPurchase")
	public String confirmPurchase(@ModelAttribute("order") Order theOrder) {
		theOrder.setOrder_id(bookCartService.generateOrderId());
		theOrder.setOrder_date( new Date());
		bookCartService.saveOrder(theOrder);
		return  "orderPurchased" ;

	}
}
