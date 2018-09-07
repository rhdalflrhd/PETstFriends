package controller;

import java.awt.Dialog.ModalExclusionType;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import model.Notice;
import service.NoticeServiceImpl;

@Controller
public class NoticeController {

	@Autowired
	NoticeServiceImpl nService;
	
	@RequestMapping("showNoticeList.do")
	public ModelAndView showNoticeList (@RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue="10") int numb,
			@RequestParam(defaultValue="0") int type, @RequestParam(required=false) String keyword, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("type", type);
		params.put("keyword", keyword);
		params.put("page", page);
		params.put("numb", numb);
		params.put("user_id", session.getAttribute("user_id"));
		if (type == 1) {
		params.put("title", keyword);
		} else if (type == 2) {
		params.put("content", keyword);
		} else if (type == 3) {
		params.put("title", keyword);
		params.put("content", keyword);
		}
		HashMap<String, Object> result = nService.showNoticeList(params);
		mav.addAllObjects(params);
		mav.addAllObjects(result);
		mav.setViewName("notice/customerCenter_notice");
		
		return mav;
		
	}
	
	
	@RequestMapping("showNoticeBoard.do")
	public ModelAndView showNoticeBoard(@RequestParam(required=false) HashMap<String, Object> params, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.addAllObjects(params);
		int notice_boardno =  Integer.parseInt((String) params.get("notice_boardno"));
		mav.addObject("admin_check", session.getAttribute("admin_check"));
		mav.addObject("noticeBoard", nService.showNoticeBoard(notice_boardno));
		mav.setViewName("notice/customerCenter_showNoticeBoard");
		return mav;
	}
	
	@RequestMapping("writeNoticeBoardForm.do")
	public String writeNoticeBoardForm() {
		return "notice/customerCenter_writeNoticeForm";
	}
	
	@RequestMapping(value = "writeNoticeBoard.do", method = RequestMethod.POST)
	public String writeNoticeBoard(@RequestParam String notice_title,
			@RequestParam String editor, Model model, HttpSession session) {
		Notice notice = new Notice();
		notice.setNotice_adminId((String) session.getAttribute("user_id"));
		notice.setNotice_content(editor);
		notice.setNotice_title(notice_title);
		nService.writeNoticeBoard(notice);
		model.addAttribute("notice_boardno", notice.getNotice_boardno());
		return "redirect:showNoticeBoard.do";
	}
	
	
	
	@RequestMapping("deleteNoticeBoard.do")
	public String deleteNoticeBoard(@RequestParam int notice_boardno) {
		
		nService.deleteNoticeBoard(notice_boardno);
		return "redirect:showNoticeList.do";//에이작스??? 그냥???
		
	}
	
	@RequestMapping("modifyNoticeBoardForm.do")
	public String modifyNoticeBoardForm(@RequestParam HashMap<String, Object> params, Model model) {
		int notice_boardno = Integer.parseInt((String) params.get("notice_boardno"));
		model.addAttribute("notice",nService.getNoticeBoard(notice_boardno));
		model.addAllAttributes(params);
		return "notice/customerCenter_noticeModifyForm";
	}
	@RequestMapping(value="modifyNoticeBoard.do", method = RequestMethod.POST)
	public String modifyNoticeBoard(@RequestParam HashMap<String, Object> params, HttpSession session, Model model) {
		String notice_adminId = (String) session.getAttribute("user_id");
		params.put("notice_adminId", notice_adminId);
		System.out.println(params.get("notice_title"));
		System.out.println(params.get("editor"));
		nService.modifyBoard(params);
		model.addAllAttributes(params);
		return "redirect:showNoticeBoard.do";
	}
	
	@RequestMapping("aaaa.do")
	public String aa()
	{
		return "notice/customerdd";
	}
	
	//================================================

	// 다중파일업로드
			@RequestMapping(value = "multiplePhotoUpload.do")
			public void multiplePhotoUpload(HttpServletRequest request, HttpServletResponse response) {
				try {
			         //파일정보
			         String sFileInfo = "";
			         //파일명을 받는다 - 일반 원본파일명
			         String filename = request.getHeader("file-name");
			         //파일 확장자
			         String filename_ext = filename.substring(filename.lastIndexOf(".")+1);
			         //확장자를소문자로 변경
			         filename_ext = filename_ext.toLowerCase();
			         //파일 기본경로
			         String dftFilePath = request.getSession().getServletContext().getRealPath("/");
			         //파일 기본경로 _ 상세경로
			         String filePath = dftFilePath + "resource" + File.separator + "photoUpload" + File.separator;
			        
			         File file = new File(filePath);
			         if(!file.exists()) {
			            file.mkdirs();
			         }
			         String realFileNm = "";
			         SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
			         String today= formatter.format(new java.util.Date());
			         realFileNm = today+UUID.randomUUID().toString() + filename.substring(filename.lastIndexOf("."));
			         String rlFileNm = filePath + realFileNm;
			         ///////////////// 서버에 파일쓰기 /////////////////
			         InputStream is = request.getInputStream();
			         OutputStream os=new FileOutputStream(rlFileNm);
			         int numRead;
			         byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
			         while((numRead = is.read(b,0,b.length)) != -1){
			            os.write(b,0,numRead);
			         }
			         if(is != null) {
			            is.close();
			         }
			         os.flush();
			         os.close();
			         ///////////////// 서버에 파일쓰기 /////////////////
			         // 정보 출력
			         sFileInfo += "&bNewLine=true";
			         // img 태그의 title 속성을 원본파일명으로 적용시켜주기 위함
			         sFileInfo += "&sFileName="+ filename;;
			         sFileInfo += "&sFileURL="+"http://localhost:8080/PETstFriends/"
			         		+ "resource/photoUpload/"+realFileNm;
			         PrintWriter print = response.getWriter();

			         print.print(sFileInfo);
			         print.flush();
			         print.close();
			    } catch (Exception e) {
			        e.printStackTrace();
			    }
			}
//	    // 다중파일업로드
//	    @RequestMapping(value = "multiplePhotoUpload.do", method = RequestMethod.POST)
//	    @ResponseBody
//	    public String multiplePhotoUpload(HttpServletRequest request) {
//	        // 파일정보
//	        StringBuffer sb = new StringBuffer();
//	        try {
//	            // 파일명을 받는다 - 일반 원본파일명
//	            String oldName = request.getHeader("file-name");
//	            // 파일 기본경로 _ 상세경로
//	            String filePath = "C:/Users/5CLASS-184/git/PETstFriends/PETstFriends/WebContent/naverEditor/WebContent/resources/photoUpload/";
//	            String saveName = sb.append(new SimpleDateFormat("yyyyMMddHHmmss")
//	                          .format(System.currentTimeMillis()))
//	                          .append(UUID.randomUUID().toString())
//	                          .append(oldName.substring(oldName.lastIndexOf("."))).toString();
//	            InputStream is = request.getInputStream();
//	            OutputStream os = new FileOutputStream(filePath + saveName);
//	            int numRead;
//	            byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
//	            while ((numRead = is.read(b, 0, b.length)) != -1) {
//	                os.write(b, 0, numRead);
//	            }
//	            os.flush();
//	            os.close();
//	            // 정보 출력
//	            sb = new StringBuffer();
//	            sb.append("&bNewLine=true")
//	              .append("&sFileName=").append(oldName)
//	              .append("&sFileURL=").append("naverEditor/WebContent/resources/photoUpload/")
//	        .append(saveName);
//	        } catch (Exception e) {
//	            e.printStackTrace();
//	        }
//	        return sb.toString();
//	    }
}