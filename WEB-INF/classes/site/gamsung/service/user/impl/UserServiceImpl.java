package site.gamsung.service.user.impl;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import site.gamsung.service.auction.AuctionInfoDAO;
import site.gamsung.service.camp.CampReservationDAO;
import site.gamsung.service.common.Search;
import site.gamsung.service.domain.User;
import site.gamsung.service.domain.UserWrapper;
import site.gamsung.service.transfer.TransferDAO;
import site.gamsung.service.user.UserDAO;
import site.gamsung.service.user.UserService;
import site.gamsung.util.user.SHA256Util;
import site.gamsung.util.user.SendMailHtml;
import site.gamsung.util.user.SendMessage;
import site.gamsung.util.user.TempKey;

@Service("userServiceImpl")
public class UserServiceImpl implements UserService{

	///Field
	@Autowired
	@Qualifier("userDAOImpl")
	private UserDAO userDAO;
	
	@Autowired
	@Qualifier("campReservationDAOImpl")
	private CampReservationDAO campDAO;
	
	@Autowired
	@Qualifier("auctionInfoDAO")
	private AuctionInfoDAO auctionDAO;
	
	@Autowired
	@Qualifier("transferDAOImpl")
	private TransferDAO transDAO;
	
	
	public void setUserDAO(UserDAO userDAO) {
		this.userDAO=userDAO;
	}
	
	///Constructor
	public UserServiceImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public void addUser(User user){
	
		String salt = SHA256Util.generateSalt();
		String pw = SHA256Util.getEncrypt(user.getPassword(), salt);
		
		user.setSalt(salt);
		user.setPassword(pw);
		
		userDAO.addUser(user);
		
	}

	@Override
	public User getUser(String id){
		User user = userDAO.getUser(id);
	//	user.setReportTotalCount(userDAO.countReoprt(id));
		return user;
	}

	@Override
	public void updateUser(User user){
		
		userDAO.updateUser(user);
		
	}

	@Override
	public UserWrapper listUser(Search search){
		
		UserWrapper userWrapper = new UserWrapper(userDAO.listUser(search), userDAO.getTotalCount(search));
				
		return userWrapper;
	}
	
	

	@Override
	public void sendEmailAuthNum(String id, String key, String path){
				
		String info = "[????????????] ???????????? ?????????.";
		String text="<img src=\"cid:image\"><div class=\"container\" style=\"width: 1008px;font-family: 'Noto Sans KR', sans-serif; text-align: center; font-weight: 400;\">\r\n"
        		+ "		        <div class=\"gamsung-title\" style=\"height: 100px;font-size: 36px;border-top: 1px solid #ddd;border-bottom: 1px solid #ddd; padding: 15px; box-sizing: border-box; font-weight: 700; margin-bottom: 15px;color: rgb(42, 99, 65);\">????????????</div>\r\n"
        		+ "		        <div class=\"color-text\">???????????????!    ???????????? ?????????!</div>\r\n"
        		+ "		        <div>???????????? ??????????????? ??????????????? ????????? ?????????.</div>\r\n"
        		+ "		        <div>?????? ?????? ??????????????? ??????????????????</div>\r\n"
        		+ "		        <div class=\"number\" style=\"display: inline-block; padding: 5px 10px; margin-top: 20px;border: 1px solid #ddd; border-radius: 5px;\">"+key+"</span>";
//		String text = "???????????????"+key+"?????????.";
//		SendMail sendMail = new SendMail();
//		sendMail.sendMail(id, info, text);
		
		SendMailHtml html=new SendMailHtml();
		try {
			html.sendMailHtml(id, info, text, path);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void sendPhoneAuthNum(String phone, String phKey){
		
		String text = "[????????????] ??????????????? ["+phKey+"] ?????????.";
		
		SendMessage sendMessage = new SendMessage();
		sendMessage.sendMessage(phone, text);	  
	}

	@Override
	public void addLoginDate(User user){
		
		userDAO.addLoginDate(user);
	}

	//update??? ?????? ??? ??? ???????????? ???????????????. Controller?????? ???????????? ???
	@Override
	public void approvalBusinessUser(User user, String path){
		user.setBusinessUserApprovalFlag("Y");
		userDAO.updateUser(user);
		SendMailHtml sendMail = new SendMailHtml();
		String info = "[????????????] ??????????????? ?????????????????????.";
		String text = "<img src=\\\"cid:image\\\"><div class=\"container\" style=\"width: 1008px;font-family: 'Noto Sans KR', sans-serif; text-align: center; font-weight: 400;\">\r\n"
				+ "    <div class=\"gamsung-title\" style=\"height: 100px;font-size: 36px;border-top: 1px solid #ddd;border-bottom: 1px solid #ddd; padding: 15px; box-sizing: border-box; font-weight: 700; margin-bottom: 15px;color: rgb(42, 99, 65);\">????????????</div>\r\n"
				+ "    <div class=\"color-text\">??????????????? ?????????????????????~</div>\r\n"
				+ "    <div>??????????????? ?????????????????????:)</div>\r\n"
				+ "    <div>????????? ???????????? ????????? ????????? ??????????????? ???????????????~</div>\r\n"
				+ "    <a href=\"http://127.0.0.1:8080\"><button type=\"button\"  style=\"animation: gradient1 5s ease infinite;  background: linear-gradient(-45deg, #00ffed 0%, #00bbff 100%);  position: relative;\r\n"
				+ "    border: none;  display: inline-block;  border-radius: 15px;  font-family: 'paybooc-Light', sans-serif;  box-shadow: 0 15px 35px rgb(0 0 0 / 20%);\r\n"
				+ "    text-decoration: none;  font-weight: 600;  transition: 0.25s;  margin: 0;  padding: 0;  box-sizing: border-box;  width: 200px;  height: 70px;  font-size: 20px;\r\n"
				+ "    color: floralwhite; \"> ???????????? ????????????</button></a>";
	    path="D:\\Main\\GamsungPJT\\gamsung\\src\\main\\webapp";
		try {
			sendMail.sendMailHtml(user.getId(), info, text, path);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}


	@Override
	public int checkDuplication(User user){
		
		return userDAO.checkDuplication(user);
	}

	@Override
	public String getSaltById(String id){
		
		return userDAO.getSaltById(id);
	}

	@Override
	public void updateTempPassword(User user, String path){
		
		TempKey tmp = new TempKey();
		String pw = tmp.generateKey(10);
		System.out.println("????????????"+pw);
		String newPwd = SHA256Util.getEncrypt(pw, user.getSalt());
		user.setPassword(newPwd);
		
		userDAO.updateUser(user);
		
		String info="[????????????] ?????????????????? ?????????.";
		
		String text="<img src=\"cid:image\"><div class=\"container\" style=\"width: 1008px;font-family: 'Noto Sans KR', sans-serif; text-align: center; font-weight: 400;\">\r\n"
        		+ "		        <div class=\"gamsung-title\" style=\"height: 100px;font-size: 36px;border-top: 1px solid #ddd;border-bottom: 1px solid #ddd; padding: 15px; box-sizing: border-box; font-weight: 700; margin-bottom: 15px;color: rgb(42, 99, 65);\">????????????</div>\r\n"
        		+ "		        <div class=\"color-text\">???????????? ?????????!</div>\r\n"
        		+ "		        <div>?????? ???????????? ?????????.</div>\r\n"
        		+ "		        <div>????????? ?????? ??????????????? ????????? ??? ??????????????? ????????? ?????????.</div>\r\n"
        		+ "		        <div class=\"number\" style=\"display: inline-block; padding: 5px 10px; margin-top: 20px;border: 1px solid #ddd; border-radius: 5px;\">"+pw+"</span>";
//		String text = "???????????? ?????? ???????????????"+pw+"?????????."+
//		"????????? ??? ??????????????? ??????????????????.";
		try {
			SendMailHtml sendMail = new SendMailHtml();
			sendMail.sendMailHtml(user.getId(), info, text, path);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public String getAccessToken (String code) {
        String accessToken = "";
        String refreshToken = "";
        String reqURL = "https://kauth.kakao.com/oauth/token";

        try {
            URL url = new URL(reqURL);

            HttpURLConnection conn = (HttpURLConnection) url.openConnection();

            //  URL????????? ???????????? ?????? ??? ??? ??????, POST ?????? PUT ????????? ????????? setDoOutput??? true??? ???????????????.
            conn.setRequestMethod("POST");
            conn.setDoOutput(true);

            //	POST ????????? ????????? ???????????? ???????????? ???????????? ?????? ??????
            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
            StringBuilder sb = new StringBuilder();
            sb.append("grant_type=authorization_code");
            sb.append("&client_id=5069ddcbe63e1882c2df7cc176f1a96f");  				//???????????? key
            sb.append("&redirect_uri=http://localhost:8080/user/kakaoCallback");     //????????? ?????? ??????
            sb.append("&code=" + code);
            bw.write(sb.toString());
            bw.flush();

            //    ?????? ????????? 200????????? ??????
            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);

            //    ????????? ?????? ?????? JSON????????? Response ????????? ????????????
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(),"UTF-8"));
            String line = "";
            String result = "";

            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println("response body : " + result);

            //Gson ?????????????????? ????????? ???????????? JSON?????? ?????? ??????
            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);

            accessToken = element.getAsJsonObject().get("access_token").getAsString();
            refreshToken = element.getAsJsonObject().get("refresh_token").getAsString();
            
            System.out.println("access_token : " + accessToken);
            System.out.println("refresh_token : " + refreshToken);

            br.close();
            bw.close();
        } catch (IOException ioe) {
            // TODO Auto-generated catch block
            ioe.printStackTrace();
        } catch(Exception e) {
        	e.printStackTrace();
        }

        return accessToken;
    }
	
	 //??????????????????
    public HashMap<String, Object> getUserInfo (String accessToken) {

        //  ???????????? ????????????????????? ?????? ????????? ?????? ??? ????????? HashMap???????????? ??????
        HashMap<String, Object> userInfo = new HashMap<String, Object>();
        String reqURL = "https://kapi.kakao.com/v2/user/me";
        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");

            //    ????????? ????????? Header??? ????????? ??????
            conn.setRequestProperty("Authorization", "Bearer " + accessToken);

            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);

            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(),"UTF-8"));

            String line = "";
            String result = "";

            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println("response body : " + result);

            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);

            JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
            JsonObject kakaoAccount = element.getAsJsonObject().get("kakao_account").getAsJsonObject();

            String nickname = properties.getAsJsonObject().get("nickname").getAsString();
            String kakaoId=element.getAsJsonObject().get("id").getAsString();
            if(kakaoAccount.getAsJsonObject().get("email")!=null) {
            String email = kakaoAccount.getAsJsonObject().get("email").getAsString();
            userInfo.put("email", email);
            }
            
            userInfo.put("accessToken", accessToken);
            userInfo.put("nickname", nickname);
            userInfo.put("snsId", kakaoId);

        } catch (IOException ioe) {
        	
            // TODO Auto-generated catch block
            ioe.printStackTrace();
        } catch(Exception e) {
        	e.printStackTrace();
        }
        
        return userInfo;
    }

	@Override
	public String findId(String name, String phone){
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", name);
		map.put("phone", phone);

		return userDAO.findId(map);
	}

	@Override
	public User findPassword(User user){
		
		User dbUser=userDAO.getUser(user.getId());
		
		System.out.println("dbUser##########"+dbUser);
		
		if(dbUser != null && !(user.getName().equals(dbUser.getName())&&user.getPhone().equals(dbUser.getPhone()))){
			return null;
		}
			System.out.println("###############user############"+user);
			return dbUser;
	}

	@Override
	public void addSuspensionUser(User user){
		
		System.out.println("???????????? ?????? ???????????????");
		userDAO.addSuspensionUser(user);
		
	}

	@Override
	public boolean addSecessionUser(User user){
		System.out.println("?????? ??????????????? ?????????");
		System.out.println(user);
		try {
			if(campDAO.isSecessionUserReservationCondition(user.getId())&&auctionDAO.isSecessionUserAuctionCondition(user.getId())&& transDAO.isSecessionTransferCondition(user.getId())) {
			System.out.println("????????? ???????????? ?????????"+campDAO.isSecessionUserReservationCondition(user.getId()));
			System.out.println("???????????? ?????? ?????? ???????????? ?????????"+auctionDAO.isSecessionUserAuctionCondition(user.getId()));
			System.out.println("???????????? ?????? ???????????? ???????????? ?????????"+transDAO.isSecessionTransferCondition(user.getId()));
			 userDAO.addSecessionUser(user);
			 return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public User checkIdPassword(User user){
		
		User dbUser = userDAO.getUser(user.getId());
		if(dbUser!=null) {
			String pw = user.getPassword();
			System.out.println("????????????"+pw);
			System.out.println("??????"+dbUser.getSalt());
			String newPwd = SHA256Util.getEncrypt(pw, dbUser.getSalt());
			System.out.println("?????????"+newPwd);
			System.out.println("db?????? ????????? ??????"+dbUser.getPassword());
			if(newPwd.equals(dbUser.getPassword())) {
				return dbUser;
			}
			System.out.println("if??? ?????? ??????"+dbUser);
		}
		
		
		return null;
	}

	@Override
	@Scheduled(cron="0 0 9 * * *")
	public void addDormantUser(){
		
		System.out.println("?????? ?????????");
		List<User> list=userDAO.listUser(new Search());
		
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Calendar cal = Calendar.getInstance();
			cal.add(Calendar.YEAR , -1);
			cal.add(Calendar.DAY_OF_MONTH, +1);
			String TobeConvertedDate = sdf.format(cal.getTime());
			
			Calendar cal2 = Calendar.getInstance();
			cal.add(Calendar.YEAR , -1);
			cal.add(Calendar.DAY_OF_MONTH, -7);
			String SendMailConvertedDate = sdf.format(cal2.getTime());
			
			for(User user : list) {
				System.out.println("for?????? ?????????");
				System.out.println(user);
				
				Date currentDate=user.getCurrentLoginRegDate();
				
				if(currentDate == null) {
					continue;
				}
					String loginDate=currentDate.toString();
					
					System.out.println("????????????");
					if(user.getSecessionRegDate()==null&&user.getSuspensionDate()==null&&user.getDormantConversionDate()==null&&sdf.parse(SendMailConvertedDate).after(sdf.parse(loginDate))){
					SendMailHtml mail=new SendMailHtml();
					String info="[????????????] ???????????? ???????????? ???????????? ?????????.";
					String text ="<img src=\\\"cid:image\\\"><div class=\"container\" style=\"width: 1008px;font-family: 'Noto Sans KR', sans-serif; text-align: center; font-weight: 400;\">\r\n"
							+ "    <div class=\"gamsung-title\" style=\"height: 100px;font-size: 36px;border-top: 1px solid #ddd;border-bottom: 1px solid #ddd; padding: 15px; box-sizing: border-box; font-weight: 700; margin-bottom: 15px;color: rgb(42, 99, 65);\">????????????</div>\r\n"
							+ "    <div class=\"color-text\">??????????????? ?????????????????????~</div>\r\n"
							+ "    <div>??????????????? ???????????? ??? ???????????? ?????? ?????? ?????? ???29???(??????????????? ??????)??? ?????? ???????????? ??????????????? ?????? ?????????????????? ???????????? 7??? ??? ?????????????????? ????????? ???????????????.</div>\r\n"
							+ "    <div>?????????????????? ????????? ?????? ???????????? 7??? ????????? ???????????? ???????????? ????????? ??????????????????~</div>\r\n"
							+ "    <a href=\"http://127.0.0.1:8080\"><button type=\"button\"  style=\"animation: gradient1 5s ease infinite;  background: linear-gradient(-45deg, #00ffed 0%, #00bbff 100%);  position: relative;\r\n"
							+ "    border: none;  display: inline-block;  border-radius: 15px;  font-family: 'paybooc-Light', sans-serif;  box-shadow: 0 15px 35px rgb(0 0 0 / 20%);\r\n"
							+ "    text-decoration: none;  font-weight: 600;  transition: 0.25s;  margin: 0;  padding: 0;  box-sizing: border-box;  width: 200px;  height: 70px;  font-size: 20px;\r\n"
							+ "    color: floralwhite; \"> ???????????? ????????????</button></a>";
					String path="D:\\Main\\GamsungPJT\\gamsung\\src\\main\\webapp";
					mail.sendMailHtml(user.getId(), info, text, path);
					}else if(user.getSecessionRegDate()==null&&user.getSuspensionDate()==null&&user.getDormantConversionDate()==null&&sdf.parse(TobeConvertedDate).after(sdf.parse(loginDate))) {
		            userDAO.addDormantUser(user);
		            }
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
		
			return; 
		}
			
	@Override
	public void updateDormantGeneralUserConvert(String id){
		userDAO.updateDormantGeneralUserConver(id);
		
	}

	//????????? ????????????
	@Override
	public void kakaoLogout(String accessToken) {
		String reqURL = "https://kapi.kakao.com/v1/user/logout"; 
		try {
			URL url = new URL(reqURL); 
			HttpURLConnection conn = (HttpURLConnection) url.openConnection(); 
			conn.setRequestMethod("POST"); 
			conn.setRequestProperty("Authorization", "Bearer " + accessToken); 
			int responseCode = conn.getResponseCode(); 
			System.out.println("responseCode : " + responseCode); 
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream())); 
			String result = ""; 
			String line = ""; 
			while ((line = br.readLine()) != null) {
				result += line;
				} 
			System.out.println(result);
			} catch (IOException e) {
				e.printStackTrace(); 
			}
		}

	@Override
	public void kakaoUnlink(String accessToken) {
		String reqURL = "https://kapi.kakao.com/v1/user/unlink";
		try { 
			URL url = new URL(reqURL); 
			HttpURLConnection conn = (HttpURLConnection) url.openConnection(); 
			conn.setRequestMethod("POST"); 
			conn.setRequestProperty("Authorization", "Bearer " + accessToken);
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String result = ""; String line = ""; 
			while ((line = br.readLine()) != null) { 
				result += line;
				}
			System.out.println(result); 
			} catch (IOException e) { 
			e.printStackTrace();
			}
	}

	@Override
	public UserWrapper reportSuspencionListUser(Search search) {
		
		UserWrapper wrapper = new UserWrapper(userDAO.reportSuspensionListUser(search), userDAO.countReportSuspensionListUser(search));
		
		return wrapper;
	}
	
	@Override
	public UserWrapper dormantListUser(Search search) {
		
		UserWrapper wrapper = new UserWrapper(userDAO.dormantListUser(search), userDAO.countDormantListUser(search));
		
		return wrapper;
	}
	
	@Override
	public UserWrapper secessionListUser(Search search) {
		
		UserWrapper wrapper = new UserWrapper(userDAO.secessionListUser(search), userDAO.countSecessionListUser(search));
		
		return wrapper;
	}

	
	}

