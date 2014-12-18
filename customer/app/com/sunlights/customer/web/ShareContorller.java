package com.sunlights.customer.web;

import com.sunlights.common.MsgCode;
import com.sunlights.common.Severity;
import com.sunlights.common.exceptions.BusinessRuntimeException;
import com.sunlights.common.utils.QRcodeByte;
import com.sunlights.common.utils.ShortURLUtil;
import com.sunlights.common.vo.Message;
import com.sunlights.customer.ActivityConstant;
import com.sunlights.customer.dal.impl.CustomerDaoImpl;
import com.sunlights.customer.factory.ShareInfoServiceFactory;
import com.sunlights.customer.service.ActivityService;
import com.sunlights.customer.service.CustJoinActivityService;
import com.sunlights.customer.service.ShareInfoService;
import com.sunlights.customer.service.impl.ActivityServiceImpl;
import com.sunlights.customer.service.impl.CustJoinActivityServiceImpl;
import com.sunlights.customer.vo.*;
import models.ActivityShareInfo;
import models.Customer;
import models.CustomerSession;
import org.apache.commons.lang3.StringUtils;
import play.Logger;
import play.data.Form;
import play.db.jpa.Transactional;
import play.libs.Json;
import play.mvc.Http;
import play.mvc.Result;

/**
 * Created by Administrator on 2014/12/3.
 */
@Transactional
public class ShareContorller extends ActivityBaseController{
    private ActivityService activityService =new ActivityServiceImpl();
    private CustJoinActivityService custjoinService=new CustJoinActivityServiceImpl();

    private Form<ShareVo> shareParameterForm = Form.form(ShareVo.class);
    /**
     * 分享好友
     *
     * @return
     */
    @Deprecated
    public Result sendFriend() {

        //1、首先获得手机号
        CustomerSession customerSession = getCustomerSession();
        String custNo = customerSession.getCustomerId();//获得客户id
        if(StringUtils.isEmpty(custNo)){
            return notFound("用户登录已经超时,请重新登录");
        }
        String mobile= getMobile(custNo);//获得手机号

        //2、获得短路径及获得分享描述内容
        ActivityParamter activityParamter = getActivityParamter();
        String scene = activityParamter.getScene();
        if(StringUtils.isEmpty(scene)){
            scene= ActivityConstant.ACTIVITY_INVITE_SCENE_CODE;//邀请好友配置场景
        }
        ActivityShareInfo activityShareInfo=activityService.getShareInfoByScene(scene);
        if(activityShareInfo == null){
            return notFound("暂时没有活动");
        }
        String url=activityShareInfo.getShareUrl();//活动路径
        Logger.debug("获得的活动路径url为:"+url);
        String sharetext=activityShareInfo.getContent();//获得分享描述内容
        Logger.debug("获得分享描述内容:"+sharetext);
        String title=activityShareInfo.getTitle();//title
        String imageurl=activityShareInfo.getIocnUrl();
        Long activatyid=activityShareInfo.getActivityId();//活动id
        Logger.debug("活动id:"+activatyid);
        String shorturl= getShortUrl(custNo, activatyid, scene, mobile, url);  //获得短路径
        if(StringUtils.isEmpty(shorturl)){
            return notFound("获取短路径失败");
        }
        //3、将内容存入对象
        ShareVo shareVo=new ShareVo();
        shareVo.setShorturl(shorturl);
        shareVo.setTitle(title);
        shareVo.setContent(sharetext);
        shareVo.setImageurl(imageurl);

        messageUtil.setMessage(new Message(Severity.INFO, MsgCode.SHARE_QUERY_SUCC), shareVo);
        Logger.debug("返回给前端的内容----》:"+messageUtil.toJson());
        return ok(messageUtil.toJson());
    }


    /**
     * 获得byte流图片
     * @return
     */
    public Result getQRcodeToByte(){

        //1、首先获得手机号
        CustomerSession customerSession = getCustomerSession();
        String custNo = customerSession.getCustomerId();//获得客户id
        if(StringUtils.isEmpty(custNo)){
            return notFound("用户登录已经超时,请重新登录");
        }
        String mobile= getMobile(custNo);//获得手机号
        //2、获得短路径
        ActivityParamter activityParamter = getActivityParamter();
        String scene = activityParamter.getScene();
        if(StringUtils.isEmpty(scene)){
            scene= ActivityConstant.ACTIVITY_INVITE_SCENE_CODE;//邀请好友配置场景
        }

        ActivityShareInfo activityShareInfo=activityService.getShareInfoByScene(scene);

        if(activityShareInfo == null){
            return notFound("暂时没有活动");
        }

        String url=activityShareInfo.getShareUrl();//活动路径
        Logger.debug("获得的活动路径url为:"+url);
        Long activatyid=activityShareInfo.getActivityId();//活动id
        String shorturl= getShortUrl(custNo, activatyid, scene, mobile, url);//获得短路径
        if(StringUtils.isEmpty(shorturl)){
            return notFound("获取短路径失败");
        }

        //3、将内容存入对象
        QRcodeByte qrcode = new QRcodeByte();
        byte[] pngData = qrcode.getQRcodeByte(shorturl);//加入短路径如："http://t.cn/RzJWtFA"
        QRcodeVo qRcodeVo=new QRcodeVo();
        qRcodeVo.setQrcodeByte(pngData);
        Logger.debug("图片二进制流:"+qRcodeVo.getQrcodeByte());

        messageUtil.setMessage(new Message(Severity.INFO, MsgCode.ABOUT_QUERY_SUCC), qRcodeVo);
        Logger.debug("返回给前端的内容----:"+messageUtil.toJson());
        return ok(messageUtil.toJson());

    }

    /**
     * 获得手机号
     * @return
     *
     */
    @Deprecated
    private String getMobile(String custNo){
        //1、首先获得手机号

        Customer customer=new CustomerDaoImpl().getCustomerByCustomerId(custNo);
        String mobile=customer.getMobile();//获得手机号
        Logger.debug("获得的手机号为:"+mobile);
        return mobile;
    }

    /**
     * 获取短链接或生成短链接
     * @param custNo
     * @param activatyid
     * @param scene
     * @param mobile
     * @param url
     * @return
     */
    private String getShortUrl(String custNo,Long activatyid,String scene,String mobile,String url){
        String shorturl=null;
        String getShortUrl=custjoinService.getShortUrl(custNo,activatyid,scene);
        Logger.debug("活动id:"+activatyid+",客户号："+custNo+"，数据库的短链接："+getShortUrl);
        if(StringUtils.isNotEmpty(getShortUrl)){//首先查询有无短链接（无则生成，有则直接拿）
            shorturl=getShortUrl;
            Logger.debug("数据库的短链接:"+shorturl);
            return shorturl;
        }else{
            StringBuffer bf=new StringBuffer();
            String longurl=bf.append(url).append("?mobileNo=").append(mobile).toString();//拼接成长链接
            Logger.debug("拼接后的长链接:"+longurl);
            //通过长链接生成短链接
            shorturl=ShortURLUtil.getShortURL(longurl);
            Logger.debug("生成的短链接:"+shorturl);
            custjoinService.saveShortUrl(custNo,activatyid,scene, shorturl);//保存短链接
            return shorturl;
        }

    }

    /**
     * 分享接口
     *
     * @return
     */
    public Result share() {
        String custNo = "";
        try {
            CustomerSession customerSession = getCustomerSession();
            custNo = customerSession.getCustomerId();//获得客户id
        } catch (Exception e) {
            Logger.debug("没有登录。。");
        }

        ShareVo shareVo = null;
        Http.RequestBody body = request().body();
        if (body.asJson() != null) {
            shareVo = Json.fromJson(body.asJson(), ShareVo.class);
        }

        if (body.asFormUrlEncoded() != null) {
            shareVo = shareParameterForm.bindFromRequest().get();
        }
        String type = shareVo.getType();
        String id = shareVo.getId();
        Logger.debug("type = " + type + " id = " + id);

        Message message = null;
        ShareInfoService shareInfoService = ShareInfoServiceFactory.getShareInfoService(type);
        if(shareInfoService == null) {
            Logger.error("不支持的分享类型");
            message = new Message(Severity.INFO, MsgCode.NOT_SUPPORT_SHARE_TYPE);
            messageUtil.setMessage(message);
            return ok(messageUtil.toJson());
        }

        message = new Message(Severity.INFO, MsgCode.SHARE_QUERY_SUCC);
        try {
            ShareInfoContext context = new ShareInfoContext();
            context.setRefId(id);
            context.setCustNo(custNo);
            context.setType(type);
            ShareInfoVo shareInfoVo = shareInfoService.getShareInfoByType(context);

            shareVo = new ShareVo();
            shareVo.setId(id);
            shareVo.setType(type);
            shareVo.setShorturl(shareInfoVo.getShortUrl());
            shareVo.setContent(shareInfoVo.getContent());
            shareVo.setImageurl(shareInfoVo.getImageUrl());
            shareVo.setTitle(shareInfoVo.getTitle());

            messageUtil.setMessage(message, shareVo);
            Logger.debug("返回给前端的内容----》:" + messageUtil.toJson());
            return ok(messageUtil.toJson());
        } catch (BusinessRuntimeException be) {
            if(MsgCode.LOGIN_TIMEOUT.getCode().equals(be.getErrorCode())) {
                message = new Message(Severity.INFO, MsgCode.LOGIN_TIMEOUT);
                message.setSummary("您还没有登录");
                Logger.error("您还没有登录", be);
            }
        } catch (Exception e) {
            message = new Message(Severity.INFO, MsgCode.ACTIVITY_SYS_ERROR);
            message.setSummary("系统异常");
            Logger.error("系统异常", e);
        }
        messageUtil.setMessage(message);
        return ok(messageUtil.toJson());
    }
}
