package com.picCut.jspsmart.upload;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletInputStream;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;

public class SmartUpload {
	protected byte[] m_binArray;
	protected HttpServletRequest m_request;
	protected HttpServletResponse m_response;
	protected ServletContext m_application;
	private int m_totalBytes = 0;
	private int m_currentIndex = 0;
	private int m_startData = 0;
	private int m_endData = 0;
	private String m_boundary = new String();
	private long m_totalMaxFileSize = 0L;
	private long m_maxFileSize = 0L;
	private Vector m_deniedFilesList = new Vector();
	private Vector m_allowedFilesList = new Vector();
	private boolean m_denyPhysicalPath = false;
	private boolean m_forcePhysicalPath = false;
	private String m_contentDisposition = new String();
	public static final int SAVE_AUTO = 0;
	public static final int SAVE_VIRTUAL = 1;
	public static final int SAVE_PHYSICAL = 2;
	private Files m_files = new Files();
	private Request m_formRequest = new Request();

	public final void init(ServletConfig servletconfig) throws ServletException {
		this.m_application = servletconfig.getServletContext();
	}

	public void service(HttpServletRequest httpservletrequest,
			HttpServletResponse httpservletresponse) throws ServletException,
			IOException {
		this.m_request = httpservletrequest;
		this.m_response = httpservletresponse;
	}

	public final void initialize(ServletConfig servletconfig,
			HttpServletRequest httpservletrequest,
			HttpServletResponse httpservletresponse) throws ServletException {
		this.m_application = servletconfig.getServletContext();
		this.m_request = httpservletrequest;
		this.m_response = httpservletresponse;
	}

	public final void initialize(PageContext pagecontext)
			throws ServletException {
		this.m_application = pagecontext.getServletContext();
		this.m_request = ((HttpServletRequest) pagecontext.getRequest());
		this.m_response = ((HttpServletResponse) pagecontext.getResponse());
	}

	public final void initialize(ServletContext servletcontext,
			HttpSession httpsession, HttpServletRequest httpservletrequest,
			HttpServletResponse httpservletresponse, JspWriter jspwriter)
			throws ServletException {
		this.m_application = servletcontext;
		this.m_request = httpservletrequest;
		this.m_response = httpservletresponse;
	}

	public void upload() throws ServletException, IOException,
			SmartUploadException {
		int i = 0;
		boolean flag = false;
		long l = 0L;
		boolean flag1 = false;
		String s = new String();
		String s2 = new String();
		String s4 = new String();
		String s5 = new String();
		String s6 = new String();
		String s7 = new String();
		String s8 = new String();
		String s9 = new String();
		String s10 = new String();
		boolean flag2 = false;
		this.m_totalBytes = this.m_request.getContentLength();
		this.m_binArray = new byte[this.m_totalBytes];
		int j;
		for (; i < this.m_totalBytes; i += j) {
			try {
				this.m_request.getInputStream();
				j = this.m_request.getInputStream().read(this.m_binArray, i,
						this.m_totalBytes - i);
				if(j==-1)
					throw new SmartUploadException("Unable to upload.");
			} catch (Exception exception) {
				throw new SmartUploadException("Unable to upload.");
			}
		}
		for (; (!flag1) && (this.m_currentIndex < this.m_totalBytes); this.m_currentIndex += 1) {
			if (this.m_binArray[this.m_currentIndex] == 13)
				flag1 = true;
			else
				this.m_boundary += (char) this.m_binArray[this.m_currentIndex];
		}
		if (this.m_currentIndex == 1)
			return;
		for (this.m_currentIndex += 1; this.m_currentIndex < this.m_totalBytes; this.m_currentIndex += 2) {
			String s1 = getDataHeader();
			this.m_currentIndex += 2;
			boolean flag3 = s1.indexOf("filename") > 0;
			String s3 = getDataFieldValue(s1, "name");
			if (flag3) {
				s6 = getDataFieldValue(s1, "filename");
				s4 = getFileName(s6);
				s5 = getFileExt(s4);
				s7 = getContentType(s1);
				s8 = getContentDisp(s1);
				s9 = getTypeMIME(s7);
				s10 = getSubTypeMIME(s7);
			}
			getDataSection();
			if ((flag3) && (s4.length() > 0)) {
				if (this.m_deniedFilesList.contains(s5))
					throw new SecurityException(
							"The extension of the file is denied to be uploaded (1015).");
				if ((!this.m_allowedFilesList.isEmpty())
						&& (!this.m_allowedFilesList.contains(s5.toLowerCase())))
					throw new SecurityException(
							"不支持此格式,请使用"+m_allowedFilesList.toString()+"格式.(1010)");
				if ((this.m_maxFileSize > 0L)
						&& (this.m_endData - this.m_startData + 1 > this.m_maxFileSize))
					throw new SecurityException(
							"图片大小超过限制 (限2M之内): " + s4 + " (1105).");
				l += this.m_endData - this.m_startData + 1;
				if ((this.m_totalMaxFileSize > 0L)
						&& (l > this.m_totalMaxFileSize))
					throw new SecurityException(
							"Total File Size exceeded (1110).");
			}
			if (flag3) {
				File file = new File();
				file.setParent(this);
				file.setFieldName(s3);
				file.setFileName(s4);
				file.setFileExt(s5);
				file.setFilePathName(s6);
				file.setIsMissing(s6.length() == 0);
				file.setContentType(s7);
				file.setContentDisp(s8);
				file.setTypeMIME(s9);
				file.setSubTypeMIME(s10);
				if (s7.indexOf("application/x-macbinary") > 0)
					this.m_startData += 128;
				file.setSize(this.m_endData - this.m_startData + 1);
				file.setStartData(this.m_startData);
				file.setEndData(this.m_endData);
				this.m_files.addFile(file);
			} else {
				String s11 = new String(this.m_binArray, this.m_startData,
						this.m_endData - this.m_startData + 1);
				this.m_formRequest.putParameter(s3, s11);
			}
			if ((char) this.m_binArray[(this.m_currentIndex + 1)] == '-')
				break;
		}
	}

	public int save(String s) throws ServletException, IOException,
			SmartUploadException {
		return save(s, 0);
	}

	public int save(String s, int i) throws ServletException, IOException,
			SmartUploadException {
		int j = 0;
		if (s == null)
			s = this.m_application.getRealPath("/");
		if (s.indexOf("/") != -1) {
			if (s.charAt(s.length() - 1) != '/')
				s = s + "/";
		} else if (s.charAt(s.length() - 1) != '\\')
			s = s + "\\";
		for (int k = 0; k < this.m_files.getCount(); k++) {
			if (!this.m_files.getFile(k).isMissing()) {
				this.m_files.getFile(k).saveAs(
						s + this.m_files.getFile(k).getFileName(), i);
				j++;
			}
		}
		return j;
	}

	public int getSize() {
		return this.m_totalBytes;
	}

	public byte getBinaryData(int i) {
		byte byte0;
		try {
			byte0 = this.m_binArray[i];
		} catch (Exception exception) {
			throw new ArrayIndexOutOfBoundsException(
					"Index out of range (1005).");
		}
		return byte0;
	}

	public Files getFiles() {
		return this.m_files;
	}

	public Request getRequest() {
		return this.m_formRequest;
	}

	public void downloadFile(String s) throws ServletException, IOException,
			SmartUploadException {
		downloadFile(s, null, null);
	}

	public void downloadFile(String s, String s1) throws ServletException,
			IOException, SmartUploadException, SmartUploadException {
		downloadFile(s, s1, null);
	}

	public void downloadFile(String s, String s1, String s2)
			throws ServletException, IOException, SmartUploadException {
		downloadFile(s, s1, s2, 65000);
	}

	public void downloadFile(String s, String s1, String s2, int i)
			throws ServletException, IOException, SmartUploadException {
		if (s == null)
			throw new IllegalArgumentException("File '" + s
					+ "' not found (1040).");
		if (s.equals(""))
			throw new IllegalArgumentException("File '" + s
					+ "' not found (1040).");
		if ((!isVirtual(s)) && (this.m_denyPhysicalPath))
			throw new SecurityException("Physical path is denied (1035).");
		if (isVirtual(s))
			s = this.m_application.getRealPath(s);
		java.io.File file = new java.io.File(s);
		FileInputStream fileinputstream = new FileInputStream(file);
		long l = file.length();
		boolean flag = false;
		int k = 0;
		byte[] abyte0 = new byte[i];
		if (s1 == null) {
			this.m_response.setContentType("application/x-msdownload");
		} else if (s1.length() == 0)
			this.m_response.setContentType("application/x-msdownload");
		else
			this.m_response.setContentType(s1);
		this.m_response.setContentLength((int) l);
		this.m_contentDisposition = (this.m_contentDisposition != null ? this.m_contentDisposition
				: "attachment;");
		if (s2 == null) {
			this.m_response.setHeader("Content-Disposition",
					this.m_contentDisposition + " filename=" + getFileName(s));
		} else if (s2.length() == 0)
			this.m_response.setHeader("Content-Disposition",
					this.m_contentDisposition);
		else
			this.m_response.setHeader("Content-Disposition",
					this.m_contentDisposition + " filename=" + s2);
		while (k < l) {
			int j = fileinputstream.read(abyte0, 0, i);
			k += j;
			this.m_response.getOutputStream().write(abyte0, 0, j);
		}
		fileinputstream.close();
	}

	public void downloadField(ResultSet resultset, String s, String s1,
			String s2) throws ServletException, IOException, SQLException {
		if (resultset == null)
			throw new IllegalArgumentException(
					"The RecordSet cannot be null (1045).");
		if (s == null)
			throw new IllegalArgumentException(
					"The columnName cannot be null (1050).");
		if (s.length() == 0)
			throw new IllegalArgumentException(
					"The columnName cannot be empty (1055).");
		byte[] abyte0 = resultset.getBytes(s);
		if (s1 == null) {
			this.m_response.setContentType("application/x-msdownload");
		} else if (s1.length() == 0)
			this.m_response.setContentType("application/x-msdownload");
		else
			this.m_response.setContentType(s1);
		this.m_response.setContentLength(abyte0.length);
		if (s2 == null) {
			this.m_response.setHeader("Content-Disposition", "attachment;");
		} else if (s2.length() == 0)
			this.m_response.setHeader("Content-Disposition", "attachment;");
		else
			this.m_response.setHeader("Content-Disposition",
					"attachment; filename=" + s2);
		this.m_response.getOutputStream().write(abyte0, 0, abyte0.length);
	}

	public void fieldToFile(ResultSet resultset, String s, String s1)
			throws ServletException, IOException, SmartUploadException,
			SQLException {
		try {
			if (this.m_application.getRealPath(s1) != null)
				s1 = this.m_application.getRealPath(s1);
			InputStream inputstream = resultset.getBinaryStream(s);
			FileOutputStream fileoutputstream = new FileOutputStream(s1);
			int i;
			while ((i = inputstream.read()) != -1) {
				fileoutputstream.write(i);
			}
			fileoutputstream.close();
		} catch (Exception exception) {
			throw new SmartUploadException(
					"Unable to save file from the DataBase (1020).");
		}
	}

	private String getDataFieldValue(String s, String s1) {
		String s2 = new String();
		String s3 = new String();
		int i = 0;
		boolean flag = false;
		boolean flag1 = false;
		boolean flag2 = false;
		s2 = s1 + "=" + '"';
		i = s.indexOf(s2);
		if (i > 0) {
			int j = i + s2.length();
			int k = j;
			s2 = "\"";
			int l = s.indexOf(s2, j);
			if ((k > 0) && (l > 0))
				s3 = s.substring(k, l);
		}
		return s3;
	}

	private String getFileExt(String s) {
		String s1 = new String();
		int i = 0;
		int j = 0;
		if (s == null)
			return null;
		i = s.lastIndexOf('.') + 1;
		j = s.length();
		s1 = s.substring(i, j);
		if (s.lastIndexOf('.') > 0) {
			return s1;
		}
		return "";
	}

	private String getContentType(String s) {
		String s1 = new String();
		String s2 = new String();
		int i = 0;
		boolean flag = false;
		s1 = "Content-Type:";
		i = s.indexOf(s1) + s1.length();
		if (i != -1) {
			int j = s.length();
			s2 = s.substring(i, j);
		}
		return s2;
	}

	private String getTypeMIME(String s) {
		String s1 = new String();
		int i = 0;
		i = s.indexOf("/");
		if (i != -1) {
			return s.substring(1, i);
		}
		return s;
	}

	private String getSubTypeMIME(String s) {
		String s1 = new String();
		int i = 0;
		boolean flag = false;
		i = s.indexOf("/") + 1;
		if (i != -1) {
			int j = s.length();
			return s.substring(i, j);
		}

		return s;
	}

	private String getContentDisp(String s) {
		String s1 = new String();
		int i = 0;
		int j = 0;
		i = s.indexOf(":") + 1;
		j = s.indexOf(";");
		s1 = s.substring(i, j);
		return s1;
	}

	private void getDataSection() {
		boolean flag = false;
		String s = new String();
		int i = this.m_currentIndex;
		int j = 0;
		int k = this.m_boundary.length();
		this.m_startData = this.m_currentIndex;
		this.m_endData = 0;
		while (i < this.m_totalBytes)
			if (this.m_binArray[i] == (byte) this.m_boundary.charAt(j)) {
				if (j == k - 1) {
					this.m_endData = (i - k + 1 - 3);
					break;
				}
				i++;
				j++;
			} else {
				i++;
				j = 0;
			}
		this.m_currentIndex = (this.m_endData + k + 3);
	}

	private String getDataHeader() throws UnsupportedEncodingException {
		int i = this.m_currentIndex;
		int j = 0;
		boolean flag = false;
		for (boolean flag1 = false; !flag1;) {
			if ((this.m_binArray[this.m_currentIndex] == 13)
					&& (this.m_binArray[(this.m_currentIndex + 2)] == 13)) {
				flag1 = true;
				j = this.m_currentIndex - 1;
				this.m_currentIndex += 2;
			} else {
				this.m_currentIndex += 1;
			}
		}
		String s = new String(this.m_binArray, i, j - i + 1,"utf-8");
		return s;
	}

	private String getFileName(String s) {
		String s1 = new String();
		String s2 = new String();
		int i = 0;
		boolean flag = false;
		boolean flag1 = false;
		boolean flag2 = false;
		i = s.lastIndexOf('/');
		if (i != -1)
			return s.substring(i + 1, s.length());
		i = s.lastIndexOf('\\');
		if (i != -1) {
			return s.substring(i + 1, s.length());
		}
		return s;
	}

	public void setDeniedFilesList(String s) throws ServletException,
			IOException, SQLException {
		String s1 = "";
		if (s != null) {
			String s2 = "";
			for (int i = 0; i < s.length(); i++) {
				if (s.charAt(i) == ',') {
					if (!this.m_deniedFilesList.contains(s2))
						this.m_deniedFilesList.addElement(s2);
					s2 = "";
				} else {
					s2 = s2 + s.charAt(i);
				}
			}
			if (s2 != "")
				this.m_deniedFilesList.addElement(s2);
		} else {
			this.m_deniedFilesList = null;
		}
	}

	public void setAllowedFilesList(String s) {
		String s1 = "";
		if (s != null) {
			String s2 = "";
			for (int i = 0; i < s.length(); i++) {
				if (s.charAt(i) == ',') {
					if (!this.m_allowedFilesList.contains(s2))
						this.m_allowedFilesList.addElement(s2);
					s2 = "";
				} else {
					s2 = s2 + s.charAt(i);
				}
			}
			if (s2 != "")
				this.m_allowedFilesList.addElement(s2);
		} else {
			this.m_allowedFilesList = null;
		}
	}

	public void setDenyPhysicalPath(boolean flag) {
		this.m_denyPhysicalPath = flag;
	}

	public void setForcePhysicalPath(boolean flag) {
		this.m_forcePhysicalPath = flag;
	}

	public void setContentDisposition(String s) {
		this.m_contentDisposition = s;
	}

	public void setTotalMaxFileSize(long l) {
		this.m_totalMaxFileSize = l;
	}

	public void setMaxFileSize(long l) {
		this.m_maxFileSize = l;
	}

	public String getPhysicalPath(String s, int i) throws IOException {
		String s1 = new String();
		String s2 = new String();
		String s3 = new String();
		boolean flag = false;
		s3 = System.getProperty("file.separator");
		if (s == null)
			throw new IllegalArgumentException(
					"There is no specified destination file (1140).");
		if (s.equals(""))
			throw new IllegalArgumentException(
					"There is no specified destination file (1140).");
		if (s.lastIndexOf("\\") >= 0) {
			s1 = s.substring(0, s.lastIndexOf("\\"));
			s2 = s.substring(s.lastIndexOf("\\") + 1);
		}
		if (s.lastIndexOf("/") >= 0) {
			s1 = s.substring(0, s.lastIndexOf("/"));
			s2 = s.substring(s.lastIndexOf("/") + 1);
		}
		s1 = s1.length() != 0 ? s1 : "/";
		java.io.File file = new java.io.File(s1);
		if (file.exists())
			flag = true;
		if (i == 0) {
			if (isVirtual(s1)) {
				s1 = this.m_application.getRealPath(s1);
				if (s1.endsWith(s3))
					s1 = s1 + s2;
				else
					s1 = s1 + s3 + s2;
				return s1;
			}
			if (flag) {
				if (this.m_denyPhysicalPath) {
					throw new IllegalArgumentException(
							"Physical path is denied (1125).");
				}
				return s;
			}

			throw new IllegalArgumentException(
					"This path does not exist (1135).");
		}

		if (i == 1) {
			if (isVirtual(s1)) {
				s1 = this.m_application.getRealPath(s1);
				if (s1.endsWith(s3))
					s1 = s1 + s2;
				else
					s1 = s1 + s3 + s2;
				return s1;
			}
			if (flag) {
				throw new IllegalArgumentException(
						"The path is not a virtual path.");
			}
			throw new IllegalArgumentException(
					"This path does not exist (1135).");
		}
		if (i == 2) {
			if (flag) {
				if (this.m_denyPhysicalPath) {
					throw new IllegalArgumentException(
							"Physical path is denied (1125).");
				}
				return s;
			}
			if (isVirtual(s1)) {
				throw new IllegalArgumentException(
						"The path is not a physical path.");
			}
			throw new IllegalArgumentException(
					"This path does not exist (1135).");
		}

		return null;
	}

	public void uploadInFile(String s) throws IOException, SmartUploadException {
		int i = 0;
		int j = 0;
		boolean flag = false;
		if (s == null)
			throw new IllegalArgumentException(
					"There is no specified destination file (1025).");
		if (s.length() == 0)
			throw new IllegalArgumentException(
					"There is no specified destination file (1025).");
		if ((!isVirtual(s)) && (this.m_denyPhysicalPath))
			throw new SecurityException("Physical path is denied (1035).");
		i = this.m_request.getContentLength();
		this.m_binArray = new byte[i];
		int k;
		for (; j < i; j += k) {
			try {
				k = this.m_request.getInputStream().read(this.m_binArray, j,
						i - j);
			} catch (Exception exception) {
				throw new SmartUploadException("Unable to upload.");
			}
		}
		if (isVirtual(s))
			s = this.m_application.getRealPath(s);
		try {
			java.io.File file = new java.io.File(s);
			FileOutputStream fileoutputstream = new FileOutputStream(file);
			fileoutputstream.write(this.m_binArray);
			fileoutputstream.close();
		} catch (Exception exception1) {
			throw new SmartUploadException(
					"The Form cannot be saved in the specified file (1030).");
		}
	}

	private boolean isVirtual(String s) {
		if (this.m_application.getRealPath(s) != null) {
			java.io.File file = new java.io.File(this.m_application
					.getRealPath(s));
			return file.exists();
		}

		return false;
	}
}

/*
 * Location: C:\Users\Administrator\Desktop\WebRoot\WEB-INF\classes\ Qualified
 * Name: com.jspsmart.upload.SmartUpload JD-Core Version: 0.6.2
 */