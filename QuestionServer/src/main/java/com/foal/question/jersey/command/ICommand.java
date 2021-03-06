package com.foal.question.jersey.command;

import com.foal.question.jersey.resource.tools.Param;
import com.foal.question.jersey.resource.tools.ResultMap;

public interface ICommand {
	public ResultMap handle(Param param) throws Exception;
	
	public static final short GetVersion = 10001;//获取版本信息
	public static final short Login = 10002;//第三方登录
	public static final short Regist = 10003;//注册
	public static final short LoginLocal = 10004;//本地登录
	public static final short EditPassword = 10005;//编辑密码
	public static final short EditUserInfo = 10006;//编辑用户信息
	public static final short TipOff = 10007;//举报
	public static final short FeedBack = 10008;//反馈
	public static final short GetUserinfo = 10009;//获取用户信息
	public static final short GetUserBaseInfoByUids = 10010;//根据用户uid列表获取用户基础信息（id、名称、头像）列表
	
	public static final short AddFollow = 10101;//添加关注
	public static final short DelFollow = 10102;//取消关注
	public static final short ListTargetFollow = 10103;//加载指定用户的关注列表
	public static final short ListTargetFollowers = 10104;//加载关注指定用户的用户列表
	public static final short LoadMyNewFollowers = 10106;//加载新关注我的用户列表

	public static final short AddComment = 10201;//添加评论
	public static final short DelComment = 10202;//删除评论
	public static final short LoadComment = 10203;//加载评论
	public static final short LoadCommentByCareUser = 10204;//加载用户关心的评论
	public static final short ReadComment = 10205;//阅读评论
	public static final short LoadCommentByOwner = 10206;//根据用户加载评论
	public static final short ReadAllComment = 10207;//把全部未读的相关评论置为已读
	
	public static final short TextImageAdd = 20001;//添加记录
	public static final short TextImageLoadMy = 20002;//加载我的记录
	public static final short TextImageLoadOthers = 20003;//加载指定用户记录
	public static final short TextImageLoadPublic = 20004;//加载公共记录
	public static final short TextImagePraise = 20005;//点赞
	public static final short TextImageDel = 20006;//删除记录
	public static final short TextImageShare = 20007;//分享
	public static final short TextImageLoadPraiseUser = 20008;//加载点赞用户
	public static final short TextImageLoadByFollow = 20009;//根据关注加载
	public static final short TextImageByRecordId = 20010;//根据记录id加载记录信息

	public static final short TextVoiceAdd = 30001;//添加记录
	public static final short TextVoiceLoadMy = 30002;//加载我的记录
	public static final short TextVoiceLoadOthers = 30003;//加载指定用户记录
	public static final short TextVoiceLoadPublic = 30004;//加载公共记录
	public static final short TextVoicePraise = 30005;//点赞
	public static final short TextVoiceDel = 30006;//删除记录
	public static final short TextVoiceShare = 30007;//分享
	public static final short TextVoiceLoadPraiseUser = 30008;//加载点赞用户
	public static final short TextVoiceLoadByFollow = 30009;//根据关注加载
	public static final short TextVoiceByRecordId = 30010;//根据记录id加载记录信息
}
