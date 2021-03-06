package com.foal.question.jersey.command.follow;

import java.util.Date;
import java.util.List;

import com.foal.question.config.QuestionException;
import com.foal.question.jersey.command.ICommand;
import com.foal.question.jersey.resource.tools.Param;
import com.foal.question.jersey.resource.tools.ResultMap;
import com.foal.question.jersey.resource.tools.APIConstants.RetCode;
import com.foal.question.listener.ServiceLocator;
import com.foal.question.pojo.AppUser;
import com.foal.question.pojo.AppUserFollow;
import com.foal.question.service.app.AppUserService;
import com.foal.question.util.StringTools;
import com.google.gson.JsonArray;

public class ListTargetFollowersCommand implements ICommand {

	private AppUserService appUserService = ServiceLocator.getBean(AppUserService.class);

	@Override
	public ResultMap handle(Param param) {
		ResultMap ret = ResultMap.getResultMap();
		String uid = param.getUid();
		String targetUid = param.get("targetUid", "");
		int page = param.getInt("page");
		int pageSize = param.getInt("pageSize");
		AppUser targetUser = appUserService.getAppUserById(targetUid);
		if (targetUser == null) {
			throw new QuestionException(QuestionException.UserNotExist, "目标用户不存在");
		}
		List<AppUserFollow> followList = appUserService.getFollowsByOwner(targetUser.getUid(), page, pageSize);
		if (StringTools.equalsStr(uid, targetUid)) {
			targetUser.setLastLoadFollowersTime(new Date());
			appUserService.updateAppUser(targetUser);
		}
		JsonArray friends = new JsonArray();
		for (AppUserFollow follow : followList) {
			friends.add(follow.getFollower().toJson());
		}
		ret.add("friends", friends);
		ret.setResult(RetCode.Success);
		return ret;
	}

}
