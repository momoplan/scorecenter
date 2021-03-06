package com.ruyicai.scorecenter.dao;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.EntityManager;
import javax.persistence.LockModeType;
import javax.persistence.PersistenceContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.ruyicai.scorecenter.domain.TuserinfoScore;
import com.ruyicai.scorecenter.exception.RuyicaiException;
import com.ruyicai.scorecenter.service.MemcachedService;
import com.ruyicai.scorecenter.util.ErrorCode;

@Component
public class TuserinfoScoreDao {

	@PersistenceContext
	private EntityManager entityManager;

	@Autowired
	private MemcachedService<TuserinfoScore> memcachedService;

	public TuserinfoScore findTuserinfoScore(String id, boolean lock) {
		return entityManager.find(TuserinfoScore.class, id, lock ? LockModeType.PESSIMISTIC_WRITE : LockModeType.NONE);
	}

	public TuserinfoScore findTuserinfoScore(String id) {
		TuserinfoScore tuserinfoScore = findTuserinfoScoreFromCache(id);
		if (tuserinfoScore != null) {
			return tuserinfoScore;
		} else {
			TuserinfoScore tuserinfoScore2 = entityManager.find(TuserinfoScore.class, id);
			if (tuserinfoScore2 != null) {
				memcachedService.set("TuserinfoScore" + id, tuserinfoScore2);
			}
			return tuserinfoScore2;
		}
	}

	public TuserinfoScore findTuserinfoScoreFromCache(String id) {
		return memcachedService.get("TuserinfoScore" + id);
	}

	public TuserinfoScore findScoreIfNotExist(String userno) {
		TuserinfoScore score = findTuserinfoScore(userno);
		if (score == null) {
			return createTuserinfoScore(userno);
		} else {
			return score;
		}
	}

	@Transactional
	public TuserinfoScore createTuserinfoScore(String userno) {
		TuserinfoScore score = new TuserinfoScore();
		score.setUserno(userno);
		score.setScore(BigDecimal.ZERO);
		score.setCreateTime(new Date());
		this.persist(score);
		return score;
	}

	@Transactional
	public TuserinfoScore addScore(String userno, BigDecimal addScore) {
		TuserinfoScore score = findTuserinfoScore(userno, true);
		if (score == null) {
			score = createTuserinfoScore(userno);
		}
		if (addScore.compareTo(BigDecimal.ZERO) > 0) {
			score.setScore(score.getScore().add(addScore));
			score.setLastModifyTime(new Date());
			merge(score);
		}
		return score;
	}

	@Transactional
	public TuserinfoScore deductScore(String userno, BigDecimal deductScore) {
		if (deductScore.compareTo(BigDecimal.ZERO) <= 0) {
			throw new RuyicaiException(ErrorCode.PARAMTER_ERROR);
		}
		TuserinfoScore tuserinfoScore = findTuserinfoScore(userno, true);
		if (tuserinfoScore == null) {
			throw new RuyicaiException(ErrorCode.ScoreCenter_NOT_ENOUGH);
		}
		if (deductScore.compareTo(BigDecimal.ZERO) <= 0) {
			throw new IllegalArgumentException("The argument deductScore less than zero");
		}
		if (tuserinfoScore.getScore().compareTo(deductScore) < 0) {
			throw new RuyicaiException(ErrorCode.ScoreCenter_NOT_ENOUGH);
		}
		tuserinfoScore.setScore(tuserinfoScore.getScore().subtract(deductScore));
		tuserinfoScore.setLastModifyTime(new Date());
		merge(tuserinfoScore);
		return tuserinfoScore;
	}

	@Transactional
	public TuserinfoScore merge(TuserinfoScore tuserinfoScore) {
		TuserinfoScore merged = this.entityManager.merge(tuserinfoScore);
		this.entityManager.flush();
		memcachedService.set("TuserinfoScore" + tuserinfoScore.getUserno(), tuserinfoScore);
		return merged;
	}

	@Transactional
	public void persist(TuserinfoScore tuserinfoScore) {
		this.entityManager.persist(tuserinfoScore);
		memcachedService.set("TuserinfoScore" + tuserinfoScore.getUserno(), tuserinfoScore);
	}
}
