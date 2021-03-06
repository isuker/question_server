package com.foal.question.jersey.command.common;

import com.foal.question.config.QuestionException;
import com.foal.question.jersey.command.ICommand;
import com.foal.question.jersey.resource.tools.Param;
import com.foal.question.jersey.resource.tools.ResultMap;
import com.foal.question.jersey.resource.tools.APIConstants.RetCode;
import com.foal.question.listener.ServiceLocator;
import com.foal.question.pojo.AppUser;
import com.foal.question.service.app.AppUserService;
import com.foal.question.util.StringTools;
import com.google.gson.JsonObject;

public class GetUserinfoCommand implements ICommand {

	private AppUserService appUserService = ServiceLocator.getBean(AppUserService.class);

	@Override
	public ResultMap handle(Param param) {
		ResultMap ret = ResultMap.getResultMap();
		String uid = param.getUid();
		String targetUid = param.get("targetUid");
		if (StringTools.isBlank(targetUid)) {
			throw new QuestionException(QuestionException.UserNotExist, "目标用户不能为空");
		}
		AppUser targetUser = appUserService.getAppUserById(targetUid);
		if (targetUser == null) {
			throw new QuestionException(QuestionException.UserNotExist, "目标用户不存在");
		}
		JsonObject userinfo = targetUser.toJson();
		userinfo.addProperty("signature", targetUser.getSignature());
		userinfo.addProperty("followCount", appUserService.getFollowCountByFollower(targetUid));
		userinfo.addProperty("followerCount", appUserService.getFollowCountByOwner(targetUid));
		ret.add("userinfo", userinfo);
		ret.add("relation", appUserService.getRelation(uid, targetUid));
		ret.setResult(RetCode.Success);
		return ret;
	}

}
