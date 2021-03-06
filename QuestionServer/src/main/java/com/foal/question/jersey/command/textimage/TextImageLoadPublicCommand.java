package com.foal.question.jersey.command.textimage;

import java.util.List;

import com.foal.question.jersey.command.ICommand;
import com.foal.question.jersey.resource.tools.Param;
import com.foal.question.jersey.resource.tools.ResultMap;
import com.foal.question.jersey.resource.tools.APIConstants.RetCode;
import com.foal.question.listener.ServiceLocator;
import com.foal.question.pojo.AppTextImage;
import com.foal.question.service.app.AppTextImageService;
import com.google.gson.JsonArray;

public class TextImageLoadPublicCommand implements ICommand {

	private AppTextImageService appTextImageService = ServiceLocator.getBean(AppTextImageService.class);

	@Override
	public ResultMap handle(Param param) {
		ResultMap ret = ResultMap.getResultMap();
		String uid = param.getUid();
		int orderBy = param.getInt("orderBy");
		int page = param.getInt("page");
		int pageSize = param.getInt("pageSize");
		List<AppTextImage> recordList = appTextImageService.getPublicRecord(orderBy, page, pageSize);
		JsonArray retJa = new JsonArray();
		for (AppTextImage record : recordList) {
			retJa.add(appTextImageService.getRetRecordJson(record, uid));
		}
		ret.add("text_images", retJa);
		ret.setResult(RetCode.Success);
		return ret;
	}

}
