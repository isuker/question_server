package com.foal.question.service.app;

import java.util.List;

import org.springframework.stereotype.Service;

import com.foal.question.dao.DaoSupport;
import com.foal.question.pojo.AppTextVoice;
import com.foal.question.pojo.AppTextVoiceOpLog;

@SuppressWarnings("unchecked")
@Service(value = "appTextVoiceService")
public class AppTextVoiceService extends DaoSupport {

	public boolean addAppTextVoice(AppTextVoice textVoice) {
		this.hibernateDao.save(textVoice);
		return true;
	}

	public AppTextVoice getAppTextVoice(int id) {
		return hibernateDao.get(AppTextVoice.class, id);
	}
	
	public void updateAppTextVoice(AppTextVoice textVoice) {
		this.hibernateDao.update(textVoice);
	}
	
	public void incPraiseCount(AppTextVoice textImage, String uid) {
		textImage.incPraiseCount();
		this.hibernateDao.update(textImage);
		AppTextVoiceOpLog opLog = new AppTextVoiceOpLog();
		opLog.setOpId(textImage.getId() + uid);
		this.hibernateDao.save(opLog);
	}

	public boolean deleteAppTextVoice(AppTextVoice textVoice) {
		this.hibernateDao.delete(textVoice);
		return true;
	}

	private AppTextVoiceOpLog getOpLog(int id, String uid) {
		return this.hibernateDao.get(AppTextVoiceOpLog.class, id + uid);
	}

	public boolean hasPraised(int id, String uid) {
		return getOpLog(id, uid) != null;
	}

	/**
	 * 
	 * @param ownerId	所有者uid
	 * @param orderBy	0（默认）：创建时间，1：点赞数
	 * @param page
	 * @param pageSize
	 * @return
	 */
	public List<AppTextVoice> getAppTextVoiceByOwner(String ownerId, int orderBy, int page, int pageSize) {
		String queryHql;
		if (orderBy == 0) {
			queryHql = "from AppTextVoice v where v.ownerId = ? order by v.createTime desc";
		} else {
			queryHql = "from AppTextVoice v where v.ownerId = ? order by v.praiseCount desc";
		}
		return this.hibernateDao.queryList(queryHql, page, pageSize, ownerId);
	}

	/**
	 * 
	 * @param orderBy	0（默认）：创建时间，1：点赞数
	 * @param page
	 * @param pageSize
	 * @return
	 */
	public List<AppTextVoice> getPublicAppTextVoice(int orderBy, int page, int pageSize) {
		String queryHql;
		if (orderBy == 0) {
			queryHql = "from AppTextVoice v order by v.createTime desc";
		} else {
			queryHql= "from AppTextVoice v order by v.praiseCount desc";
		}
		return this.hibernateDao.queryList(queryHql, page, pageSize);
	}
	
}
