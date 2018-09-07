package controller;

import java.io.IOException;
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
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;

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
	public boolean login(HttpSession session, String user_id, String user_pass) {

		if (userService.loginUser(user_id, user_pass)) {
			session.setAttribute("user_id", user_id);
			//추가요====
			if(userService.selectUser(user_id).getUser_adminCheck()==1) {
				session.setAttribute("adminCheck", 1);
			}
			//여기까지????
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

	// 회원가입 수정함??????
	@RequestMapping(value = "/joinUser.do", method = RequestMethod.POST)
	@ResponseBody
	public void join(MultipartHttpServletRequest multi, HttpServletResponse resp, HttpSession session) {
		resp.setContentType("text/html; charset=UTF-8");
		userService.joinUser(multi);
		session.setAttribute("id", multi.getParameter("user_id"));
	}
	//회원가입 펫 수정함??????
	@RequestMapping(value = "/joinUserPet.do", method = RequestMethod.POST)
	@ResponseBody
	public void joinPet(@RequestParam HashMap<String, Object> params, HttpServletResponse resp, HttpSession session) {
		resp.setContentType("text/html; charset=UTF-8");
		System.out.println(session.getAttribute("id"));
		String user_id = (String) session.getAttribute("id");
		params.put("user_id", user_id);
		userService.joinUserPet(params);
		session.removeAttribute("id");
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
				System.out.println("ChangeUserPw.do 들어옴");
				resp.setContentType("text/html; charset=UTF-8");
				String user_id =req.getParameter("user_id");
				params.put("user_id", user_id); 
				userService.updateUser_pass(params);
				
			}
	
			
			@RequestMapping("userPwCheck.do")              // 나의 정보 수정 클릭하면 비번체크하는 폼으로 보내주기
			public String UserPwCheck(HttpSession session, Model model) {
				System.out.println("userPwCheck.do 들어옴");
				String user_id = (String)session.getAttribute("user_id");
				String user_pass = (String) userService.selectUser(user_id).getUser_pass();
				model.addAttribute("user_pass", user_pass);
				model.addAttribute("user_id", user_id);
				return "user/myInFo_PWCheck";

			}
			
			@RequestMapping("usermain.do")            // 메인 
			public String Useramin(HttpSession session, Model model) {
				System.out.println("usermain.do 들어옴");
				return "user/main";

			}
			

//			@RequestMapping("getUserId.do") // ★ 9월6일자 변경사항★(소현) 비번확인 후 마이페이지 보내줌
//			public String UserUpdateForm(HttpServletRequest req, HttpServletResponse resp, Model model,
//					@RequestParam String user_id, @RequestParam String user_pass) {
//
//				if (userService.selectUser(user_id).getUser_pass().equals(user_pass)) {
//
//					model.addAttribute("params", userService.selectUser(user_id));
//
//					return "user/myInFo_Modification";
//				} else
//
//					return "user/myInFo_PWCheck";
//			}

			@RequestMapping("getUserId.do")     // 비번확인 후 마이페이지 보내줌 (아직 비번체크x 해야됨 )                                      
			public String UserUpdateForm(@RequestParam String user_id, HttpServletResponse resp, Model model) {
						System.out.println("getUserId.do 들어옴");
				model.addAttribute(userService.selectUser(user_id));
				System.out.println("getUserId.do확인용: "+userService.selectUser(user_id));
//				model.addAttribute("params", userService.selectUser(user_id));
						return "user/myInFo_Modification" ;		
				}
						
			
			@RequestMapping(value = "/petList.do") // ★ 9월6일자 변경사항★(소현) // 펫 리스트 보여주기
			@ResponseBody
			public void petList(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
				String user_id = (String) session.getAttribute("user_id");
				resp.setContentType("text/html; charset=UTF-8");
				List<Pet> arr = userService.selectPetAll(user_id);

				Gson gson = new Gson();

				try {
					if (arr.size() == 0) {
						String result = gson.toJson("0");
						resp.getWriter().println(result);
					} else {
						String result = gson.toJson(userService.selectPetAll(user_id));
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
			
			@RequestMapping(value = "/passCheck.do") // 비밀번호 일치 검사    9월7일 !꼭
			@ResponseBody
			public boolean getUserPw(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
				System.out.println("passCheck.do 들어옴");
				String user_id = (String) session.getAttribute("user_id");
				resp.setContentType("text/html; charset=UTF-8");
				String user_pass = req.getParameter("user_pass");
				String userpassCheck = userService.getUserPass(user_id);
				System.out.println("맵퍼로부터 넘어온 비밀번호 확인: " +userpassCheck);
				boolean result;
				if(user_pass.equals(userpassCheck)) {
					result = false; //펄스여야 비밀번호 일치임 ㅇㅇ
				}else {
					result = true;
				}
				return result;

			}
			
			@RequestMapping(value = "/insertPet.do", method = RequestMethod.POST) // ★ 9월6일자 변경사항★(소현) 내정보수정에서 수정하기 누르면 회원수정/펫																			// 추가/ 펫 수정
			@ResponseBody
			public String updatePet(@RequestParam HashMap<String, Object> params, HttpServletResponse resp,
					HttpServletRequest req, HttpSession session) {
				resp.setContentType("text/html; charset=UTF-8");
				resp.setContentType("application/json");
				String user_id = (String) session.getAttribute("user_id");
				System.out.println(user_id + "유저아이디");
				params.put("user_id", user_id);
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

				if (Integer.parseInt((String) params.get("user_havePet")) == 0)
					userService.deletePetAll(user_id);
				String msg = "";
				return msg;
			}
			
			@RequestMapping("deleteUserForm.do") // ★ 9월6일자 변경사항★(소현) 탈퇴하기 누르면 비번확인폼으로이동
			public String userDeleteForm(HttpSession session, Model model) {
				System.out.println("deleteUserForm.do 들어옴");
				String user_id = (String) session.getAttribute("user_id");
				model.addAttribute("user_id", user_id);
				return "user/myInFo_MembershipDelete";
			}
			
			@RequestMapping(value = "/deleteUser.do") // ★ 9월6일자 변경사항★(소현) 탈퇴전비밀번호 일치 검사
			@ResponseBody
			public boolean deleteUser(HttpServletRequest req, HttpServletResponse resp, HttpSession session,
					@RequestParam String user_id, @RequestParam String user_pass) {
				System.out.println("deleteUser.do 들어옴");
				resp.setContentType("text/html; charset=UTF-8");

				if (userService.selectUser(user_id).getUser_pass().equals(user_pass)) {
					System.out.println(userService.selectUser(user_id).getUser_pass());
					userService.deleteUser(user_id);
					return true;
				}

				else
					return false;
			}
			
			
			@RequestMapping(value = "/deletePet.do") // ★ 9월6일자 변경사항★(소현) 마이페이지에서 펫 삭제하기
			@ResponseBody
			public String deletePet(@RequestParam HashMap<String, Object> params, HttpServletResponse resp,
					HttpServletRequest req, HttpSession session) {
				System.out.println("deletePet.do 들어옴");
				resp.setContentType("text/html; charset=UTF-8");
				int pet_no = Integer.parseInt(req.getParameter("pet_no"));
				params.put("pet_no", pet_no);

				userService.deletePet(pet_no);

				String msg = "";
				return msg;

			}
			
			@RequestMapping(value = "myWritesList.do", method = RequestMethod.GET) // ★ 9월6일자 변경사항★(소현) 내가 쓴 게시글
			public ModelAndView myWrites(Model model, @RequestParam(defaultValue = "1") int page,
					@RequestParam(required = false) String keyword, @RequestParam(defaultValue = "0") int type,
					@RequestParam(required = false) String startDate, @RequestParam(required = false) String endDate,
					HttpSession session) {
				System.out.println("myWritesList.do 들어옴");
				String user_id = (String) session.getAttribute("user_id");
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

				HashMap<String, Object> result = userService.myWrites(user_id, page, params);
				System.out.println(result);
				mav.addAllObjects(result);
				mav.addAllObjects(params);
				mav.setViewName("user/myInfo_MyWrites");
				return mav;

			}

			@RequestMapping(value = "myinquiry.do", method = RequestMethod.GET) // ★ 9월6일자 변경사항★(소현) 내가 문의한 글
			public ModelAndView MyInquiry(Model model, @RequestParam(defaultValue = "1") int page,
					@RequestParam(required = false) String keyword, @RequestParam(defaultValue = "0") int type,
					@RequestParam(required = false) String startDate, @RequestParam(required = false) String endDate,
					HttpSession session) {
				System.out.println("myinquiry.do 들어옴");
				String user_id = (String) session.getAttribute("user_id");
				ModelAndView mav = new ModelAndView();
				HashMap<String, Object> params = new HashMap<String, Object>();
				params.put("type", type);
				params.put("keyword", keyword);
				params.put("page", page);
				params.put("user_id", user_id );
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

				HashMap<String, Object> result = userService.myInquiry(params, user_id, page);

				mav.addAllObjects(result);
				mav.addAllObjects(params);
				mav.setViewName("user/myINFO_QNALIST");
				System.out.println(mav);
				return mav;

			}

			@RequestMapping(value = "myLikesList.do", method = RequestMethod.GET) // ★ 9월6일자 변경사항★(소현) 내가 좋아요 한 글
			public ModelAndView MyLikes(Model model, @RequestParam(defaultValue = "1") int page,
					@RequestParam(required = false) String keyword, @RequestParam(defaultValue = "0") int type,
					@RequestParam(required = false) String startDate, @RequestParam(required = false) String endDate,
					HttpSession session) {
				System.out.println("myLikesList.do 들어옴");
				String user_id = (String) session.getAttribute("user_id");

				ModelAndView mav = new ModelAndView();
				HashMap<String, Object> params = new HashMap<String, Object>();
				params.put("type", type);
				params.put("keyword", keyword);
				params.put("page", page);
				params.put("user_id", user_id);
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

				HashMap<String, Object> result = userService.selectmyLikes(params, user_id, page);
				System.out.println(result);

				mav.addAllObjects(result);
				mav.addAllObjects(params);
				mav.setViewName("user/myINFO_Likes");
				System.out.println(mav);
				return mav;

			}

			@RequestMapping(value = "myMeetingApply.do", method = RequestMethod.GET) // ★ 9월6일자 변경사항★(소현) 내가 참여한 모임
			public ModelAndView MyMeetingApply(Model model, @RequestParam(defaultValue = "1") int page,
					@RequestParam(required = false) String keyword, @RequestParam(defaultValue = "0") int type,
					@RequestParam(required = false) String startDate, @RequestParam(required = false) String endDate,
					HttpSession session) {
				System.out.println("myMeetingApply.do 들어옴");
				String user_id = (String) session.getAttribute("user_id");

				ModelAndView mav = new ModelAndView();
				HashMap<String, Object> params = new HashMap<String, Object>();
				params.put("type", type);
				params.put("keyword", keyword);
				params.put("page", page);
				params.put("user_id", user_id);
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

				HashMap<String, Object> result = userService.selectMyMeetingApply(params, user_id, page);

				mav.addAllObjects(result);
				mav.addAllObjects(params);
				mav.setViewName("user/myINFO_meetings");
				System.out.println(mav);
				return mav;

	}

	@RequestMapping(value = "/allview.do", method = RequestMethod.GET) // ★ 9월6일자 추가사항★(소현) 마이페이지 글목록에서 제목 클릭 시 게시글로
	// 넘어가는 함수
	public String view2(Model model, @RequestParam int boardno, @RequestParam int boardname) {
		System.out.println("allview.do 들어옴");
		System.out.println("보드네임" + boardname);
		System.out.println("보드넘버" + boardno);

		if (boardname == 3 || boardname == 4 || boardname == 5 || boardname == 6) {
			model.addAttribute("boardname", boardname);
			model.addAttribute("boardno", boardno);

			return "redirect:selectOneBoard.do";
		} else if (boardname == 2) {

//			model.addAttribute("meeting_boardname", boardname);
//			model.addAttribute("meeting_boardno", boardno);
			return "redirect:meetingview.do?meeting_boardno="+boardno;
		} else if (boardname == 7 || boardname == 8 || boardname == 9) {
			model.addAttribute("boardname", boardname);
			model.addAttribute("boardno", boardno);

			return "redirect:ReadTipBoard.do";
		}

		else
			return "";

	}

	// 회원관리
	//수정함??????????
	@RequestMapping("showUserList.do")
	public ModelAndView showUserList(@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "10") int numb, @RequestParam(required = false) String keyword) {
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("page", page);
		params.put("numb", numb);
		if (keyword != null)
			params.put("keyword", keyword);
		HashMap<String, Object> result = userService.showUserList(params);
		mav.addAllObjects(params);
		mav.addAllObjects(result);
		mav.setViewName("manager/customerCenter_MemberHandling");
		return mav;

	}
	
	//수정함???
	@RequestMapping("stopUser.do")
	@ResponseBody
	public int stopUser(int user_no, @RequestParam(defaultValue = "10") int stopdate) {
		return userService.stopUser(user_no, stopdate);
	}

	//수정함??
	@RequestMapping("stopCancelUser.do")
	@ResponseBody
	public int stopCancelUser(int user_no, @RequestParam(defaultValue = "1") int stopdate) {
		return userService.stopUser(user_no, stopdate);
	}
	
	@RequestMapping("logout.do")
	public String logout(HttpSession session) {
		System.out.println("logout.do 들어옴");	
		session.removeAttribute("user_id");
		return "redirect:main.do";
	}
	
	@RequestMapping("downloadPropic.do") // ★ 9월6일자 추가사항★(소현)
	public View download(String user_id) {
		System.out.println("downloadPropic.do 들어옴");	
		View view = new DownloadView(userService.getAttachFile(user_id));
		return view;
	}

	@RequestMapping(value = "updatePropic.do", method = RequestMethod.POST) // ★ 9월6일자 추가사항★(소현)
	@ResponseBody
	public void updatePropic(MultipartHttpServletRequest multi, HttpServletResponse resp, HttpSession session) {
		System.out.println("updatePropic.do 들어옴");
		resp.setContentType("text/html; charset=UTF-8");
		String user_id = multi.getParameter("user_id");
		System.out.println(user_id + "유저아이디");
		userService.updateUserPropic(multi);
		session.setAttribute("id", multi.getParameter("user_id"));
	}
}
