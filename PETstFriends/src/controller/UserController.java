package controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import dao.UserDao;
import model.Pet;
import model.User;
import service.UserServiceImpl;

@Controller
public class UserController {

	@Autowired
	UserServiceImpl userService;

	@Autowired
	private UserDao userDao;

	@Autowired
	private MailSender mailSender;

	@RequestMapping(value = "/getUserNn.do")
	@ResponseBody
	public boolean getUserNick(HttpServletRequest req, HttpServletResponse resp) {

		resp.setContentType("text/html; charset=UTF-8");
		String user_nickname = req.getParameter("user_nickname");
		boolean result = userService.getUserbyNn(user_nickname);
		user_nickname = req.getParameter("user_nickname");
		return result;

	}
	
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	@ResponseBody
	public boolean login(String user_id, String user_pass) {

		if (userService.loginUser(user_id, user_pass)) {
			return true;
		} else {
			return false;
		}
	}
	@RequestMapping("/terms_use.do") // 회원 동의약관-회원가입클릭시 바로 여기로
	public String termsUse(HttpServletRequest request, HttpSession session, Model model) {
		if (session.getAttribute("naverUser") != null) {
			model.addAttribute("type", "naver");
		}
		return "user/terms_use";
	}

	// 회원가입폼
	@RequestMapping(value = "/joinUserForm.do")
	public String joinForm() {
		return "user/joinUserForm";
	}

	// 회원가입
	@RequestMapping(value = "/joinUser.do", method = RequestMethod.POST)
	@ResponseBody
	public void join(@RequestParam HashMap<String, Object> params, HttpServletResponse resp) {
		resp.setContentType("text/html; charset=UTF-8");
		userService.joinUser(params);
	}

	// ----------------------------------------------------------------------------------------
	// 아이디체크

	@RequestMapping(value = "/idCheck.do")
	@ResponseBody
	public boolean getUserId(HttpServletRequest req, HttpServletResponse resp) {

		resp.setContentType("text/html; charset=UTF-8");
		String user_id = req.getParameter("user_id");
		boolean result = userService.getUserbyId(user_id);
		return result;
	}

	// --------------------------------------------------------------------------------------------
	// 닉넴체크
	@RequestMapping(value = "/NnCheck.do")
	@ResponseBody
	public boolean getUserNn(HttpServletRequest req, HttpServletResponse resp) {

		resp.setContentType("text/html; charset=UTF-8");
		String user_nickname = req.getParameter("user_nickname");
		boolean result1 = userService.getUserbyNn(user_nickname);

		return result1;
	}

	// 이름체크
	@RequestMapping(value = "/NameCheck.do")
	@ResponseBody
	public boolean getUserName(HttpServletRequest req, HttpServletResponse resp) {

		resp.setContentType("text/html; charset=UTF-8");
		String user_name = req.getParameter("user_name");
		boolean result1 = userService.getUserbyName(user_name);
		return result1;
	}

	@RequestMapping("/main.do") //
	public String termsUse() {
		return "main";
	}

	// ----------------------------------------------------------------------

	public void setMailSender(MailSender mailSender) { // 이메일 인증 받기
		this.mailSender = mailSender;
	}

	@RequestMapping(value = "/emailAuth.do", produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String emailAuth(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();

		String user_email = request.getParameter("user_email");
		String authNum = "";

		System.out.println(user_email);
		authNum = randomNum();
		// 가입승인에 사용될 인증키 난수 발생
		sendEmail(user_email, authNum);
		// 이메일전송
		String str = authNum;
		return str;
	}

	private String randomNum() {
		StringBuffer buffer = new StringBuffer();
		for (int i = 0; i <= 6; i++) {
			int n = (int) (Math.random() * 10);
			buffer.append(n);
		}
		return buffer.toString();
	}

	public void sendEmail(String user_email, String authNum) {
		// 이메일 발송 메소드
		SimpleMailMessage mailMessage = new SimpleMailMessage();
		mailMessage.setSubject("회원가입 안내 .[이메일 제목]");
		mailMessage.setFrom("ok7sw7@gmail.com");
		mailMessage.setText("[이메일 내용]회원가입을 환영합니다. 인증번호를 확인해주세요. [ " + authNum + " ]");
		mailMessage.setTo(user_email);
		System.out.println(mailMessage);
		try {
			mailSender.send(mailMessage);

		} catch (Exception e) {
			System.out.println(e);
		}
	} // 이메일 인증 받기 끝

	// 이메일중복확인
	@RequestMapping(value = "/emailCheck.do")
	@ResponseBody
	public boolean getUserEmail(HttpServletRequest req, HttpServletResponse resp) {
		resp.setContentType("text/html; charset=UTF-8");
		String user_email = req.getParameter("user_email");
		boolean result = userService.getUserbyEmail(user_email);
		user_email = req.getParameter("user_email");

		return result;

	}

	
	//id찾기
			@RequestMapping(value = "/FindUserIdForm.do")
			public String FindUserIdForm() {	

				return "FindUserIdForm";
			
			}

			@RequestMapping(value = "/FindUserId.do", method = RequestMethod.POST)
			@ResponseBody
			public void FindUserId(@RequestParam HashMap<String, Object> params,HttpServletResponse resp) {
				String user_id = userService.getUserFindbyId(params);
				 try {
					resp.getWriter().println(user_id);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			
			@RequestMapping(value = "/FindUserIdConfirmForm.do")
			
			public void FindUserIdConfirmForm(@RequestParam String user_id, Model model) {	

				User user = userDao.selectUserbyId(user_id);
				
				model.addAttribute("user_id", user_id);
				model.addAttribute("user_name", user.getUser_name());
				model.addAttribute("user_joinDate", user.getUser_joinDate());
					
				
			}
			
			
	//----------------------------------------------------------
			
			//pw찾기
			@RequestMapping(value = "/FindUserPwForm.do")
			public String FindUserPwForm() {	

				return "user/FindUserPwForm";
			
			}

			@RequestMapping(value = "/FindUserPw.do", method = RequestMethod.POST)
			@ResponseBody
			public boolean FindUserPw(@RequestParam HashMap<String, Object> params,HttpServletRequest req, HttpServletResponse resp) {

				return  userService.getUserFindbyPw(params);
				
			}
			@RequestMapping(value = "/ChangeUserPwForm.do")
			public String ChangeUserPwForm(HttpServletRequest req, HttpServletResponse resp,  Model model) {				
				String  user_id= req.getParameter("user_id");
				model.addAttribute("user_id",user_id);
				return "user/ChangeUserPwForm";
			
			}

			
			@RequestMapping(value = "/ChangeUserPw.do", method = RequestMethod.POST)
			@ResponseBody
			public void ChangeUserPw(@RequestParam HashMap<String, Object> params,HttpServletResponse resp,HttpServletRequest req,HttpSession session) {
				resp.setContentType("text/html; charset=UTF-8");
				String user_id =req.getParameter("user_id");
				params.put("user_id", user_id); 
				userService.updateUser_pass(params);
				
			}
	
			@RequestMapping("userPwCheck.do")              // 나의 정보 수정 클릭하면 비번체크하는 폼으로 보내주기
			public String UserPwCheck(HttpSession session, Model model) {

				return "user/myInFo_PWCheck";

			}
			
			
			@RequestMapping("usermain.do")            // 메인 
			public String Useramin(HttpSession session, Model model) {

				return "user/main";

			}
			
			@RequestMapping("getUserId.do")     // 비번확인 후 마이페이지 보내줌 (아직 비번체크x 해야됨 )                                      
			public String UserUpdateForm(HttpSession session, Model model, String user_pass) {
					 String user_id = (String)session.getAttribute("user_id");
//					 if (user_pass.equals(userService.getUserPass(user_pass))) {
//						 HashMap<String, Object> params = new HashMap<String, Object>();
							model.addAttribute("params", userService.selectUser(user_id));
							return "user/myInFo_Modification";
//					 }
			//	
//					 else {
//						return "user/myInFo_PWCheck";
//					 }
				}
			
			
			@RequestMapping(value = "/petList.do")                      // 펫 리스트 보여주기
			@ResponseBody
			public void petList(HttpServletRequest req, HttpServletResponse resp) {

				resp.setContentType("text/html; charset=UTF-8");
				List<Pet> arr = userService.selectPetAll("sohyun");

				Gson gson = new Gson();

				try {
					if (arr.size() == 0) {
						String result = gson.toJson("0");
						resp.getWriter().println(result);
					} else {
						String result = gson.toJson(userService.selectPetAll("sohyun"));
						resp.getWriter().println(result);
					}
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			@RequestMapping(value = "/nicknameCheck.do") // 닉네임 중복검사
			@ResponseBody
			public boolean getUserbyNn(HttpServletRequest req, HttpServletResponse resp) {

				resp.setContentType("text/html; charset=UTF-8");
				String user_nickname = req.getParameter("user_nickname");

				boolean result = userService.getUserbyNn(user_nickname);

				user_nickname = req.getParameter("user_nickname");

				return result;

			}
			
			@RequestMapping(value = "/passCheck.do") // 비밀번호 일치 검사
			@ResponseBody
			public boolean getUserPw(HttpServletRequest req, HttpServletResponse resp) {
				resp.setContentType("text/html; charset=UTF-8");
				String user_pass = req.getParameter("user_pass");
				boolean result = userService.getUserPass(user_pass);
				user_pass = req.getParameter("user_pass");
				return result;

			}
			
			@RequestMapping(value = "/insertPet.do") // 내정보수정에서 수정하기 누르면 회원수정/펫 추가/ 펫 수정
			@ResponseBody
			public String updatePet(@RequestParam HashMap<String, Object> params, HttpServletResponse resp,
					HttpServletRequest req, HttpSession session) {
				System.out.println("insertPet.do로 들어옴");
				resp.setContentType("text/html; charset=UTF-8");
				resp.setContentType("application/json");

				String user_id = "sohyun";
				params.put("user_id", user_id);
				System.out.println(params);
				userService.updateUser(params);
				
				String jsonStr = (String) params.get("jsonData");
		        JsonParser parser = new JsonParser();
				JsonElement element = parser.parse(jsonStr);
				JsonArray jArray = element.getAsJsonArray();
				JsonObject jOb = new JsonObject();

				for (int i = 0; i < jArray.size(); i++) {
					int petno[] = new int[jArray.size()];

					jOb = jArray.get(i).getAsJsonObject();

					petno[i] = jOb.get("pet_no").getAsInt();
					System.out.println(petno[i]);

					if (petno[i] == 0) {
						userService.insertPet(params);
					}

					else {
						userService.updatePet(params);
					}

				}
				String msg = "";
				return msg;
			}
			
			@RequestMapping("deleteUserForm.do") // 탈퇴하기 누르면 비번확인폼으로이동
			public String userDeleteForm() {

				return "user/myInFo_MembershipDelete";
			}
			@RequestMapping(value = "/deleteUser.do")// 탈퇴전비밀번호 일치 검사 (비번체크해서 삭제해야되는데 아직 안됨)
			@ResponseBody 
			public boolean deleteUser(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
				resp.setContentType("text/html; charset=UTF-8");
				String user_pass = req.getParameter("user_pass");
				String user_id = req.getParameter("user_id");
				String user_idch = (String) session.getAttribute("user_id");

				if (user_id.equals(user_idch)) {
					userService.deleteUser(user_idch, user_pass);
				}
				boolean result = userService.getUserPass(user_pass);
				user_pass = req.getParameter("user_pass");
				return result;

			}
			
			@RequestMapping(value = "/deletePet.do") // 마이페이지에서 펫 삭제하기
			@ResponseBody
			public String deletePet(@RequestParam HashMap<String, Object> params, HttpServletResponse resp,
					HttpServletRequest req, HttpSession session) {

				resp.setContentType("text/html; charset=UTF-8");
				String pet_name =req.getParameter("pet_name");
				System.out.println(pet_name);
				params.put("pet_name", pet_name);

				userService.deletePet(pet_name);

				String msg = "";
				return msg;

			}
			
			
			@RequestMapping(value = "myWritesList.do", method = RequestMethod.GET)  // 내가 쓴 게시글 
			public ModelAndView myWrites(Model model, @RequestParam(defaultValue = "1") int page,
					@RequestParam(required = false) String keyword, @RequestParam(defaultValue = "0") int type,
					@RequestParam(required = false) String startDate, @RequestParam(required = false) String endDate) {

				ModelAndView mav = new ModelAndView();
				HashMap<String, Object> params = new HashMap<String, Object>();
				params.put("type", type);
				params.put("keyword", keyword);
				params.put("page", page);
				if (startDate != null && endDate != null
						&& !(startDate.equals("") || startDate.equals("0") || startDate.equals("null"))
						&& !(endDate.equals("") || endDate.equals("null") || endDate.equals("0"))) {
					params.put("startDate", startDate);
					params.put("endDate", endDate);
				}
				if (type == 1) {
					params.put("title", keyword);
				} else if (type == 2) {
					params.put("content", keyword);
				} else if (type == 3) {
					params.put("title", keyword);
					params.put("content", keyword);
				} else if (type == 4) {
					params.put("name", keyword);
				}

				HashMap<String, Object> result = userService.myWrites("sohyun", page, params);
		        System.out.println(result);
				mav.addAllObjects(result);
				mav.addAllObjects(params);
				mav.setViewName("user/myInfo_MyWrites");
				return mav;

			}


			
			@RequestMapping(value = "myinquiry.do",method = RequestMethod.GET)        // 내가 문의한 글                                 
			public  ModelAndView MyInquiry(Model model, @RequestParam(defaultValue = "1") int page,
					@RequestParam(required = false) String keyword, @RequestParam(defaultValue = "0") int type,
					@RequestParam(required = false) String startDate, @RequestParam(required = false) String endDate) {
				// String user_id = (String)session.getAttribute("user_id");
				
				ModelAndView mav = new ModelAndView();
				HashMap<String, Object> params = new HashMap<String, Object>();
				params.put("type", type);
				params.put("keyword", keyword);
				params.put("page", page);
				params.put("user_id", "sohyun");
				if (startDate != null && endDate != null
						&& !(startDate.equals("") || startDate.equals("0") || startDate.equals("null"))
						&& !(endDate.equals("") || endDate.equals("null") || endDate.equals("0"))) {
					params.put("startDate", startDate);
					params.put("endDate", endDate);
				}
				if (type == 1) {
					params.put("title", keyword);
				} else if (type == 2) {
					params.put("content", keyword);
				} else if (type == 3) {
					params.put("title", keyword);
					params.put("content", keyword);
				} else if (type == 4) {
					params.put("name", keyword);
				}
		   
				HashMap<String, Object> result = userService.myInquiry(params,"sohyun", page);
		  

				mav.addAllObjects(result);
				mav.addAllObjects(params);
				mav.setViewName("user/myINFO_QNALIST");
				System.out.println(mav);
				return mav;

				

			}

			
			
			@RequestMapping(value = "myLikesList.do",method = RequestMethod.GET)      // 내가 좋아요 한 글                               
			public  ModelAndView MyLikes(Model model, @RequestParam(defaultValue = "1") int page,
					@RequestParam(required = false) String keyword, @RequestParam(defaultValue = "0") int type,
					@RequestParam(required = false) String startDate, @RequestParam(required = false) String endDate) {
				// String user_id = (String)session.getAttribute("user_id");
				
				ModelAndView mav = new ModelAndView();
				HashMap<String, Object> params = new HashMap<String, Object>();
				params.put("type", type);
				params.put("keyword", keyword);
				params.put("page", page);
				params.put("user_id", "sohyun");
				if (startDate != null && endDate != null
						&& !(startDate.equals("") || startDate.equals("0") || startDate.equals("null"))
						&& !(endDate.equals("") || endDate.equals("null") || endDate.equals("0"))) {
					params.put("startDate", startDate);
					params.put("endDate", endDate);
				}
				if (type == 1) {
					params.put("title", keyword);
				} else if (type == 2) {
					params.put("content", keyword);
					
				} else if (type == 3) {
					params.put("title", keyword);
					params.put("content", keyword);
				} else if (type == 4) {
					params.put("name", keyword);
				}
		   
				HashMap<String, Object> result = userService.selectmyLikes(params, "sohyun", page);
		       System.out.println(result);

				mav.addAllObjects(result);
				mav.addAllObjects(params);
				mav.setViewName("user/myINFO_Likes");
				System.out.println(mav);
				return mav;

				

			}
			
			
			@RequestMapping(value = "myMeetingApply.do",method = RequestMethod.GET)            //  내가 참여한 모임 
			public  ModelAndView MyMeetingApply(Model model, @RequestParam(defaultValue = "1") int page,
					@RequestParam(required = false) String keyword, @RequestParam(defaultValue = "0") int type,
					@RequestParam(required = false) String startDate, @RequestParam(required = false) String endDate) {
				// String user_id = (String)session.getAttribute("user_id");
				
				ModelAndView mav = new ModelAndView();
				HashMap<String, Object> params = new HashMap<String, Object>();
				params.put("type", type);
				params.put("keyword", keyword);
				params.put("page", page);
				params.put("user_id", "sohyun");
				if (startDate != null && endDate != null
						&& !(startDate.equals("") || startDate.equals("0") || startDate.equals("null"))
						&& !(endDate.equals("") || endDate.equals("null") || endDate.equals("0"))) {
					params.put("startDate", startDate);
					params.put("endDate", endDate);
				}
				if (type == 1) {
					params.put("title", keyword);
				} else if (type == 2) {
					params.put("content", keyword);
					
				} else if (type == 3) {
					params.put("title", keyword);
					params.put("content", keyword);
				} else if (type == 4) {
					params.put("name", keyword);
				}
		   
				HashMap<String, Object> result = userService.selectMyMeetingApply(params, "sohyun", page);
		       

				mav.addAllObjects(result);
				mav.addAllObjects(params);
				mav.setViewName("user/myINFO_meetings");
				System.out.println(mav);
				return mav;

				

			}
			
		     
			@RequestMapping(value = "/view.do" ,method = RequestMethod.GET)    // 내가 쓴 문의글에서 제목 클릭하면 해당 게시글 보여주기 
			public String view(Model model, @RequestParam int qnA_boardno, @RequestParam(defaultValue = "1") int page,
					@RequestParam(required = false) String keyword, @RequestParam(defaultValue = "0") int type,
					@RequestParam(required = false) String startDate, @RequestParam(required = false) String endDate) {
				SimpleDateFormat simple = new SimpleDateFormat("yyyy-MM-dd");
				String date = simple.format(userService.viewmyInquiry(qnA_boardno).getQnA_writeDate());
				model.addAttribute("date", date);
				model.addAttribute("qna", userService.viewmyInquiry(qnA_boardno));
				model.addAttribute("qnA_boardno", qnA_boardno);
				model.addAttribute("type", type);
				model.addAttribute("keyword", keyword);
				model.addAttribute("page", page);
				model.addAttribute("startDate", startDate);
				model.addAttribute("endDate", endDate);
				System.out.println(model.addAttribute("qna", userService.viewmyInquiry(qnA_boardno)));
				
				return "user/view";

		}
			
			
	// 회원관리

	@RequestMapping("showUserList.do")
	public ModelAndView showUserList(@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "10") int numb, @RequestParam(required = false) String keyword) {
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("page", page);
		params.put("numb", numb);
		if(keyword != null)
			params.put("keyword", keyword);
		HashMap<String, Object> result = userService.showUserList(params);
		mav.addAllObjects(params);
		mav.addAllObjects(result);
		mav.setViewName("manager/customerCenter_MemberHandling");
		return mav;

	}

	@RequestMapping("stopUser.do")
	@ResponseBody
	public int stopUser(int user_no, @RequestParam int stopdate) {
		System.out.println("옴");
		return userService.stopUser(user_no, stopdate);
	}

//	@RequestMapping("stopCancelUser.do")
//	public int stopCancelUser(String user_id, @RequestParam(defaultValue = "1") int stopdate) {
//		return userService.stopUser(user_id, stopdate);
//	}
	
	@RequestMapping("logout.do")
	public String logout(HttpSession session) {
		session.removeAttribute("user_id");
		return "redirect:main.do";
	}
}
