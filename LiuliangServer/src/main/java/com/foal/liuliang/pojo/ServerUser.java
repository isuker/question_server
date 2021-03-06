package com.foal.liuliang.pojo;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "t_server_user")
@Cache(region = "yonderHibernateCache", usage = CacheConcurrencyStrategy.READ_WRITE)
public class ServerUser implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -765325582266116562L;
	private String userId;
	private int userType;
	private String username;
	private String encryptedPassword;
	private String assistantPassword;
	private String name;
	private String phone;
	private String email;
	private Date createTime;
	private Date modifyTime;
	private Date lastLoginTime;
	private ServerUser parent;
	private int status;
	private String lastLoginIp;
	private int score;
	private int scoreUsed;
	private Date vipEndTime;
	private String userqq;

	private String roleName;

	public class UserType {
		public static final int AdminUser = 1;//管理员
		public static final int ShopUser = 2;//商户
	}

	public class Status {
		public static final int Normal = 1;//正常
		public static final int Freeze = 2;//冻结
	}

	@GenericGenerator(name = "generator", strategy = "uuid")
	@Id
	@GeneratedValue(generator = "generator")
	@Column(name = "user_id_")
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Column(name = "user_type_")
	public int getUserType() {
		return userType;
	}

	public void setUserType(int userType) {
		this.userType = userType;
	}

	@Column(name = "status_")
	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	@Column(name = "username_")
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	@Column(name = "phone_")
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Column(name = "email_")
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name = "create_time_")
	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	@Column(name = "modify_time_")
	public Date getModifyTime() {
		return modifyTime;
	}

	public void setModifyTime(Date modifyTime) {
		this.modifyTime = modifyTime;
	}

	@Column(name = "last_login_time_")
	public Date getLastLoginTime() {
		return lastLoginTime;
	}

	public void setLastLoginTime(Date lastLoginTime) {
		this.lastLoginTime = lastLoginTime;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "parent_id_")
	public ServerUser getParent() {
		return parent;
	}

	public void setParent(ServerUser parent) {
		this.parent = parent;
	}

	@Column(name = "encrypted_password_")
	public String getEncryptedPassword() {
		return encryptedPassword;
	}

	public void setEncryptedPassword(String encryptedPassword) {
		this.encryptedPassword = encryptedPassword;
	}

	@Column(name = "assistant_password_")
	public String getAssistantPassword() {
		return assistantPassword;
	}

	public void setAssistantPassword(String assistantPassword) {
		this.assistantPassword = assistantPassword;
	}

	@Column(name = "name_")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "last_login_ip_")
	public String getLastLoginIp() {
		return lastLoginIp;
	}

	public void setLastLoginIp(String lastLoginIp) {
		this.lastLoginIp = lastLoginIp;
	}

	@Column(name = "score_")
	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public void incScore(int incScore) {
		this.score += incScore;
	}

	public void costScore(int costScore) {
		this.score -= costScore;
	}

	@Column(name = "score_used_")
	public int getScoreUsed() {
		return scoreUsed;
	}

	public void setScoreUsed(int scoreUsed) {
		this.scoreUsed = scoreUsed;
	}

	public void incScoreUsed(int incScoreUsed) {
		this.scoreUsed += incScoreUsed;
	}

	@Column(name = "vip_end_time_")
	public Date getVipEndTime() {
		return vipEndTime;
	}

	public void setVipEndTime(Date vipEndTime) {
		this.vipEndTime = vipEndTime;
	}

	public boolean checkVIPValid() {
		//验证vip是否在有效期内
		if (this.getVipEndTime() == null) {
			return false;
		}
		return new Date().getTime() <= this.getVipEndTime().getTime();
	}

	@Column(name = "user_qq_")
	public String getUserqq() {
		return userqq;
	}

	public void setUserqq(String userqq) {
		this.userqq = userqq;
	}

	@Transient
	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((assistantPassword == null) ? 0 : assistantPassword.hashCode());
		result = prime * result + ((createTime == null) ? 0 : createTime.hashCode());
		result = prime * result + ((email == null) ? 0 : email.hashCode());
		result = prime * result + ((encryptedPassword == null) ? 0 : encryptedPassword.hashCode());
		result = prime * result + ((lastLoginIp == null) ? 0 : lastLoginIp.hashCode());
		result = prime * result + ((lastLoginTime == null) ? 0 : lastLoginTime.hashCode());
		result = prime * result + ((modifyTime == null) ? 0 : modifyTime.hashCode());
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + ((parent == null) ? 0 : parent.hashCode());
		result = prime * result + ((phone == null) ? 0 : phone.hashCode());
		result = prime * result + ((roleName == null) ? 0 : roleName.hashCode());
		result = prime * result + score;
		result = prime * result + scoreUsed;
		result = prime * result + status;
		result = prime * result + ((userId == null) ? 0 : userId.hashCode());
		result = prime * result + ((username == null) ? 0 : username.hashCode());
		result = prime * result + ((userqq == null) ? 0 : userqq.hashCode());
		result = prime * result + ((vipEndTime == null) ? 0 : vipEndTime.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ServerUser other = (ServerUser) obj;
		if (assistantPassword == null) {
			if (other.assistantPassword != null)
				return false;
		} else if (!assistantPassword.equals(other.assistantPassword))
			return false;
		if (createTime == null) {
			if (other.createTime != null)
				return false;
		} else if (!createTime.equals(other.createTime))
			return false;
		if (email == null) {
			if (other.email != null)
				return false;
		} else if (!email.equals(other.email))
			return false;
		if (encryptedPassword == null) {
			if (other.encryptedPassword != null)
				return false;
		} else if (!encryptedPassword.equals(other.encryptedPassword))
			return false;
		if (lastLoginIp == null) {
			if (other.lastLoginIp != null)
				return false;
		} else if (!lastLoginIp.equals(other.lastLoginIp))
			return false;
		if (lastLoginTime == null) {
			if (other.lastLoginTime != null)
				return false;
		} else if (!lastLoginTime.equals(other.lastLoginTime))
			return false;
		if (modifyTime == null) {
			if (other.modifyTime != null)
				return false;
		} else if (!modifyTime.equals(other.modifyTime))
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (parent == null) {
			if (other.parent != null)
				return false;
		} else if (!parent.equals(other.parent))
			return false;
		if (phone == null) {
			if (other.phone != null)
				return false;
		} else if (!phone.equals(other.phone))
			return false;
		if (roleName == null) {
			if (other.roleName != null)
				return false;
		} else if (!roleName.equals(other.roleName))
			return false;
		if (score != other.score)
			return false;
		if (scoreUsed != other.scoreUsed)
			return false;
		if (status != other.status)
			return false;
		if (userId == null) {
			if (other.userId != null)
				return false;
		} else if (!userId.equals(other.userId))
			return false;
		if (username == null) {
			if (other.username != null)
				return false;
		} else if (!username.equals(other.username))
			return false;
		if (userqq == null) {
			if (other.userqq != null)
				return false;
		} else if (!userqq.equals(other.userqq))
			return false;
		if (vipEndTime == null) {
			if (other.vipEndTime != null)
				return false;
		} else if (!vipEndTime.equals(other.vipEndTime))
			return false;
		return true;
	}

}
