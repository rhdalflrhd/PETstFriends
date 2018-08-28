package controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

public class DownloadView extends AbstractView {

	private File file;

	public DownloadView(File file) {
		// TODO Auto-generated constructor stub

		setContentType("applicationContext/download; UTF-8");
		this.file = file;
	}

	@Override
	protected void renderMergedOutputModel(Map<String, Object> arg0, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub

		response.setContentType(getContentType());
		response.setContentLength((int) file.length());

		String userAgent = request.getHeader("User-Agent");
		boolean ie = userAgent.indexOf("MSIE") > -1;

		String fileName = null;

		if (ie) {
			fileName = URLEncoder.encode(file.getName(), "UTF-8");
		} else {
			fileName = new String(file.getName().getBytes("UTF-8"));
		}

		response.setHeader("Content-Disposition", "attachment; filename=\" " + fileName + "\"; ");

		response.setHeader("Content-Transfer-Encoding", "binary");
		OutputStream out = response.getOutputStream();
		FileInputStream fis = null;

		try {
			fis = new FileInputStream(file);
			FileCopyUtils.copy(fis, out);

		} catch (Exception e) {
			// TODO: handle exception
//			e.printStackTrace();
			System.out.println("오류남3");
		} finally {
			if (fis != null)
				try {
					fis.close();
				} catch (Exception e) {
					// TODO: handle exception
//					e.printStackTrace();
			System.out.println("오류남4");
				}
		}
		out.flush();

	}

}
