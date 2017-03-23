package com.util;

import com.vo.fp.CurrencyVO;
import com.web.DTO.CurrencyDTO;
import org.springframework.beans.BeanUtils;
import org.springframework.util.CollectionUtils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * Created by yetao on 17/3/9.
 */
public class ParseBeanUtil {

    private static final String dateFormat="yyyy-MM-dd HH:mm:ss";

    public static CurrencyDTO parseCurrencyVO2DTO(CurrencyVO vo){
        if (vo==null){
            return null;
        }
        CurrencyDTO dto=new CurrencyDTO();
//        BeanUtils.copyProperties(vo,dto);
        dto.setCurrencyName(vo.getCurrencyName());
        dto.setId(vo.getId());
        dto.setIncrementalAmount(vo.getIncrementalAmount());
        dto.setDurationDays(vo.getDurationDays());
        dto.setProductType(vo.getProductType());
        dto.setProfitYield(vo.getProfitYield());
        dto.setPurchaseAmount(vo.getPurchaseAmount());
        dto.setRegisterId(vo.getRegisterId());
        dto.setTradeRate(vo.getTradeRate());
        dto.setDurationDays(vo.getDurationDays());
        dto.setTradeRate(vo.getTradeRate());
        dto.setRecruitmentScale(vo.getRecruitmentScale());
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat(dateFormat);
        dto.setCashingDay(simpleDateFormat.format(vo.getDueDate()));
        dto.setDueDate(simpleDateFormat.format(vo.getDueDate()));
        dto.setFoundingDate(simpleDateFormat.format(vo.getFoundingDate()));
        dto.setSubscriptionEndDate(simpleDateFormat.format(vo.getSubscriptionEndDate()));
        dto.setSubscriptionStartDate(simpleDateFormat.format(vo.getSubscriptionStartDate()));
        return dto;
    }

    public static CurrencyVO parseCurrencyDTO2VO(CurrencyDTO dto) throws ParseException {
        if (dto==null){
            return null;
        }
        CurrencyVO vo=new CurrencyVO();
//        BeanUtils.copyProperties(dto,vo);
        vo.setCurrencyName(dto.getCurrencyName());
        vo.setId(dto.getId());
        vo.setIncrementalAmount(dto.getIncrementalAmount());
        vo.setDurationDays(dto.getDurationDays());
        vo.setProductType(dto.getProductType());
        vo.setProfitYield(dto.getProfitYield());
        vo.setPurchaseAmount(dto.getPurchaseAmount());
        vo.setRegisterId(dto.getRegisterId());
        vo.setTradeRate(dto.getTradeRate());
        vo.setRecruitmentScale(dto.getRecruitmentScale());
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat(dateFormat);
        vo.setCashingDay(simpleDateFormat.parse(dto.getDueDate()));
        vo.setDueDate(simpleDateFormat.parse(dto.getDueDate()));
        vo.setFoundingDate(simpleDateFormat.parse(dto.getFoundingDate()));
        vo.setSubscriptionEndDate(simpleDateFormat.parse(dto.getSubscriptionEndDate()));
        vo.setSubscriptionStartDate(simpleDateFormat.parse(dto.getSubscriptionStartDate()));
        return vo;
    }

    public static List<CurrencyVO> parseCurrencyDTO2VO(List<CurrencyDTO> list) throws ParseException {
        if (CollectionUtils.isEmpty(list)){
            return Collections.emptyList();
        }
        List<CurrencyVO> result=new ArrayList<CurrencyVO>();
        for (CurrencyDTO dto:list) {
            result.add(parseCurrencyDTO2VO(dto));
        }
        return result;
    }

    public static List<CurrencyDTO> parseCurrencyVO2DTO(List<CurrencyVO> list) throws ParseException {
        if (CollectionUtils.isEmpty(list)){
            return Collections.emptyList();
        }
        List<CurrencyDTO> result=new ArrayList<CurrencyDTO>();
        for (CurrencyVO vo:list) {
            result.add(parseCurrencyVO2DTO(vo));
        }
        return result;
    }

}
