package com.util;

import com.DTO.*;
import com.constants.PInvestmentPortfolioEnum;
import com.vo.fp.*;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.BeanUtils;
import org.springframework.util.CollectionUtils;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * Created by yetao on 17/3/9.
 */
public class ParseBeanUtil {

    private static Logger logger = Logger.getLogger(ParseBeanUtil.class);

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
        dto.setPurchaseChannel(vo.getPurchaseChannel());
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat(dateFormat);
        dto.setCashingDay(simpleDateFormat.format(vo.getDueDate()));
        dto.setDueDate(simpleDateFormat.format(vo.getDueDate()));
        dto.setFoundingDate(simpleDateFormat.format(vo.getFoundingDate()));
        dto.setSubscriptionEndDate(simpleDateFormat.format(vo.getSubscriptionEndDate()));
        dto.setSubscriptionStartDate(simpleDateFormat.format(vo.getSubscriptionStartDate()));
        return dto;
    }

    public static CurrencyVO parseCurrencyDTO2VO(CurrencyDTO dto)  {
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
        vo.setPurchaseChannel(dto.getPurchaseChannel());
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat(dateFormat);
        try {
            vo.setCashingDay(simpleDateFormat.parse(dto.getDueDate()));
            vo.setDueDate(simpleDateFormat.parse(dto.getDueDate()));
            vo.setFoundingDate(simpleDateFormat.parse(dto.getFoundingDate()));
            vo.setSubscriptionEndDate(simpleDateFormat.parse(dto.getSubscriptionEndDate()));
            vo.setSubscriptionStartDate(simpleDateFormat.parse(dto.getSubscriptionStartDate()));
        } catch (Exception e) {
            logger.error("date parse failed",e);
        }
        return vo;
    }

    public static List<CurrencyVO> parseCurrencyDTO2VO(List<CurrencyDTO> list)  {
        if (CollectionUtils.isEmpty(list)){
            return Collections.emptyList();
        }
        List<CurrencyVO> result=new ArrayList<CurrencyVO>();
        for (CurrencyDTO dto:list) {
            result.add(parseCurrencyDTO2VO(dto));
        }
        return result;
    }

    public static List<CurrencyDTO> parseCurrencyVO2DTO(List<CurrencyVO> list)  {
        if (CollectionUtils.isEmpty(list)){
            return Collections.emptyList();
        }
        List<CurrencyDTO> result=new ArrayList<CurrencyDTO>();
        for (CurrencyVO vo:list) {
            result.add(parseCurrencyVO2DTO(vo));
        }
        return result;
    }

    public static FundDTO parseFundVO2DTO(FundVO vo){
        if (vo==null){
            return null;
        }
        FundDTO dto=new FundDTO();
        dto.setPurchaseAmount(vo.getPurchaseAmount());
        dto.setAccumulatedValue(vo.getAccumulatedValue() );
        dto.setExpectedYield(vo.getExpectedYield());
        dto.setCustodian(vo.getCustodian());
        dto.setRegisterId(vo.getRegisterId());
        dto.setFundName(vo.getFundName());
        dto.setFundType(vo.getFundType());
        dto.setBondRate(vo.getBondRate());
        dto.setShareRate(vo.getShareRate());
        dto.setCurrencyRate(vo.getCurrencyRate());
        dto.setId(vo.getId());
//        dto.setMonthValue(vo.getMonthValue());
        dto.setNetassetValue(vo.getNetassetValue());
        dto.setObjective(vo.getObjective());
        dto.setPlanType(vo.getPlanType());
        dto.setPurchaseAmount(vo.getPurchaseAmount());
        dto.setFundType(vo.getFundType());
        dto.setTotalRecruitment(vo.getTotalRecruitment());
        dto.setId(vo.getId());
        dto.setTrustee(vo.getTrustee());
//        dto.setWeekValue(vo.getWeekValue());
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat(dateFormat);
        dto.setFoundingDate(simpleDateFormat.format(vo.getFoundingDate()));
        dto.setEndDate(simpleDateFormat.format(vo.getEndDate()));
        dto.setDuration(simpleDateFormat.format(vo.getDuration()));
        dto.setStartDate(simpleDateFormat.format(vo.getStartDate()));
        return dto;
    }

    public static FundVO parseFundDTO2VO(FundDTO dto)  {
        if (dto==null){
            return null;
        }
        FundVO vo=new FundVO();
        vo.setPurchaseAmount(dto.getPurchaseAmount());
        vo.setAccumulatedValue(dto.getAccumulatedValue() );
        vo.setCustodian(dto.getCustodian());
        vo.setRegisterId(dto.getRegisterId());
        vo.setFundName(dto.getFundName());
        vo.setFundType(dto.getFundType());
        vo.setExpectedYield(dto.getExpectedYield());
        vo.setId(dto.getId());
//        vo.setMonthValue(dto.getMonthValue());
        vo.setNetassetValue(dto.getNetassetValue());
        vo.setObjective(dto.getObjective());
        vo.setPlanType(dto.getPlanType());
        vo.setCurrencyRate(dto.getCurrencyRate());
        vo.setBondRate(dto.getBondRate());
        vo.setShareRate(dto.getShareRate());
        vo.setPurchaseAmount(dto.getPurchaseAmount());
        vo.setFundType(dto.getFundType());
        vo.setTotalRecruitment(dto.getTotalRecruitment());
        vo.setId(dto.getId());
        vo.setTrustee(dto.getTrustee());
//        vo.setWeekValue(dto.getWeekValue());
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat(dateFormat);
        try {
            vo.setFoundingDate(simpleDateFormat.parse(dto.getFoundingDate()));
            vo.setEndDate(simpleDateFormat.parse(dto.getEndDate()));
            vo.setDuration(simpleDateFormat.parse(dto.getDuration()));
            vo.setStartDate(simpleDateFormat.parse(dto.getStartDate()));
        } catch (Exception e) {
            logger.error("parse date failed",e);
        }
        return vo;
    }

    public static List<FundVO> parseFundDTO2VO(List<FundDTO> list)  {
        if (CollectionUtils.isEmpty(list)){
            return Collections.emptyList();
        }
        List<FundVO> result=new ArrayList<FundVO>();
        for (FundDTO dto:list) {
            result.add(parseFundDTO2VO(dto));
        }
        return result;
    }

    public static List<FundDTO> parseFundVO2DTO(List<FundVO> list)  {
        if (CollectionUtils.isEmpty(list)){
            return Collections.emptyList();
        }
        List<FundDTO> result=new ArrayList<FundDTO>();
        for (FundVO vo:list) {
            result.add(parseFundVO2DTO(vo));
        }
        return result;
    }

    public static CustomerDTO parseCustomerVO2DTO(CustomerVO vo){
        if (vo==null){
            return null;
        }
        CustomerDTO dto=new CustomerDTO();
        BeanUtils.copyProperties(vo,dto);
        PInvestmentPortfolioEnum pInvestmentPortfolioEnum = PInvestmentPortfolioEnum.getPInvestmentPortfolioEnum(dto.getEvaluateResult());
        if (pInvestmentPortfolioEnum != null) {
            dto.setDesc(pInvestmentPortfolioEnum.getDesc());
            dto.setShareRate(pInvestmentPortfolioEnum.getShareRate());
            dto.setCurrencyRate(pInvestmentPortfolioEnum.getCurrencyRate());
            dto.setBondRate(pInvestmentPortfolioEnum.getBondRate());
        }
        return dto;
    }

    public static CustomerVO parseCustomerDTO2VO(CustomerDTO dto)  {
        if (dto==null){
            return null;
        }
        CustomerVO vo=new CustomerVO();
        BeanUtils.copyProperties(dto,vo);
        return vo;
    }

    public static List<CustomerVO> parseCustomerDTO2VO(List<CustomerDTO> list)  {
        if (CollectionUtils.isEmpty(list)){
            return Collections.emptyList();
        }
        List<CustomerVO> result=new ArrayList<CustomerVO>();
        for (CustomerDTO dto:list) {
            result.add(parseCustomerDTO2VO(dto));
        }
        return result;
    }

    public static List<CustomerDTO> parseCustomerVO2DTO(List<CustomerVO> list)  {
        if (CollectionUtils.isEmpty(list)){
            return Collections.emptyList();
        }
        List<CustomerDTO> result=new ArrayList<CustomerDTO>();
        for (CustomerVO vo:list) {
            result.add(parseCustomerVO2DTO(vo));
        }
        return result;
    }

    public static CurrencyPurchaseDTO parseCurrencyPurchaseVO2DTO(CurrencyPurchaseVO vo){
        if (vo==null){
            return null;
        }
        CurrencyPurchaseDTO dto=new CurrencyPurchaseDTO();
        dto.setId(vo.getId());
        dto.setCurrencyId(vo.getCurrencyId());
        dto.setCustomerId(vo.getCustomerId());
        dto.setNum(vo.getNum());
        DateFormat format=new SimpleDateFormat(dateFormat);
        dto.setPurchaseDate(format.format(vo.getPurchaseDate()));
        return dto;
    }

    public static CurrencyPurchaseVO parseCurrencyPurchaseDTO2VO(CurrencyPurchaseDTO dto)  {
        if (dto==null){
            return null;
        }
        CurrencyPurchaseVO vo=new CurrencyPurchaseVO();
        vo.setId(dto.getId());
        vo.setCurrencyId(dto.getCurrencyId());
        vo.setCustomerId(dto.getCustomerId());
        vo.setNum(dto.getNum());
        DateFormat format=new SimpleDateFormat(dateFormat);
        try {
            vo.setPurchaseDate(format.parse(dto.getPurchaseDate()));
        } catch (Exception e) {
            logger.error("parseCurrencyPurchaseDTO2VO failed dto="+dto,e);
        }

        return vo;
    }

    public static List<CurrencyPurchaseVO> parseCurrencyPurchaseDTO2VO(List<CurrencyPurchaseDTO> list)  {
        if (CollectionUtils.isEmpty(list)){
            return Collections.emptyList();
        }
        List<CurrencyPurchaseVO> result=new ArrayList<CurrencyPurchaseVO>();
        for (CurrencyPurchaseDTO dto:list) {
            result.add(parseCurrencyPurchaseDTO2VO(dto));
        }
        return result;
    }

    public static List<CurrencyPurchaseDTO> parseCurrencyPurchaseVO2DTO(List<CurrencyPurchaseVO> list)  {
        if (CollectionUtils.isEmpty(list)){
            return Collections.emptyList();
        }
        List<CurrencyPurchaseDTO> result=new ArrayList<CurrencyPurchaseDTO>();
        for (CurrencyPurchaseVO vo:list) {
            result.add(parseCurrencyPurchaseVO2DTO(vo));
        }
        return result;
    }

    public static FundPurchaseDTO parseFundPurchaseVO2DTO(FundPurchaseVO vo){
        if (vo==null){
            return null;
        }
        FundPurchaseDTO dto=new FundPurchaseDTO();
        dto.setId(vo.getId());
        dto.setFundId(vo.getFundId());
        dto.setCustomerId(vo.getCustomerId());
        dto.setNum(vo.getNum());
        DateFormat format=new SimpleDateFormat(dateFormat);
        dto.setPurchaseDate(format.format(vo.getPurchaseDate()));
        return dto;
    }

    public static FundPurchaseVO parseFundPurchaseDTO2VO(FundPurchaseDTO dto)  {
        if (dto==null){
            return null;
        }
        FundPurchaseVO vo=new FundPurchaseVO();
        vo.setId(dto.getId());
        vo.setFundId(dto.getFundId());
        vo.setCustomerId(dto.getCustomerId());
        vo.setNum(dto.getNum());
        DateFormat format=new SimpleDateFormat(dateFormat);
        try {
            vo.setPurchaseDate(format.parse(dto.getPurchaseDate()));
        } catch (Exception e) {
            logger.error("parse datefailed");
        }
        return vo;
    }

    public static List<FundPurchaseVO> parseFundPurchaseDTO2VO(List<FundPurchaseDTO> list)  {
        if (CollectionUtils.isEmpty(list)){
            return Collections.emptyList();
        }
        List<FundPurchaseVO> result=new ArrayList<FundPurchaseVO>();
        for (FundPurchaseDTO dto:list) {
            result.add(parseFundPurchaseDTO2VO(dto));
        }
        return result;
    }

    public static List<FundPurchaseDTO> parseFundPurchaseVO2DTO(List<FundPurchaseVO> list)  {
        if (CollectionUtils.isEmpty(list)){
            return Collections.emptyList();
        }
        List<FundPurchaseDTO> result=new ArrayList<FundPurchaseDTO>();
        for (FundPurchaseVO vo:list) {
            result.add(parseFundPurchaseVO2DTO(vo));
        }
        return result;
    }

    public static NewsDTO parseNewsVO2DTO(NewsVO vo){
        if (vo==null){
            return null;
        }
        NewsDTO dto=new NewsDTO();
        dto.setId(vo.getId());
        dto.setContent(vo.getContent());
        dto.setTitle(vo.getTitle());
        dto.setImg(vo.getImg());
        DateFormat format=new SimpleDateFormat(dateFormat);
        dto.setAddTime(format.format(vo.getAddTime()));
        return dto;
    }

    public static NewsVO parseNewsDTO2VO(NewsDTO dto)  {
        if (dto==null){
            return null;
        }
        NewsVO vo=new NewsVO();
        vo.setId(dto.getId());
        vo.setImg(dto.getImg());
        vo.setContent(dto.getContent());
        vo.setTitle(dto.getTitle());
        DateFormat format=new SimpleDateFormat(dateFormat);
        try {
            vo.setAddTime(format.parse(dto.getAddTime()));
        } catch (Exception e) {
            logger.error("parse date failed date=" + dto.getAddTime(), e);
        }
        return vo;
    }

    public static List<NewsVO> parseNewsDTO2VO(List<NewsDTO> list)  {
        if (CollectionUtils.isEmpty(list)){
            return Collections.emptyList();
        }
        List<NewsVO> result=new ArrayList<NewsVO>();
        for (NewsDTO dto:list) {
            result.add(parseNewsDTO2VO(dto));
        }
        return result;
    }

    public static List<NewsDTO> parseNewsVO2DTO(List<NewsVO> list)  {
        if (CollectionUtils.isEmpty(list)){
            return Collections.emptyList();
        }
        List<NewsDTO> result=new ArrayList<NewsDTO>();
        for (NewsVO vo:list) {
            result.add(parseNewsVO2DTO(vo));
        }
        return result;
    }

    public static CustomerCommentDTO parseCustomerCommentVO2DTO(CustomerCommentVO vo){
        if (vo==null){
            return null;
        }
        CustomerCommentDTO dto=new CustomerCommentDTO();;
        dto.setId(vo.getId());
        dto.setCommentText(vo.getCommentText());
        dto.setTitle(vo.getTitle());
        dto.setCustomerId(vo.getCustomerId());
        dto.setTag(vo.getTag());
        dto.setReplyBy(vo.getReplyBy());
        dto.setReplyText(vo.getReplyText());
        if (StringUtils.isNotEmpty(vo.getTag())) {
            List<String> tags = new ArrayList<String>();
            String [] strs=vo.getTag().split(",");
            for (int i=0;i<strs.length;i++) {
                tags.add(strs[i]);
            }
            dto.setTagList(tags);
        }
        DateFormat format=new SimpleDateFormat(dateFormat);
        dto.setAddtime(format.format(vo.getAddTime()));
        return dto;
    }

    public static CustomerCommentVO parseCustomerCommentDTO2VO(CustomerCommentDTO dto)  {
        if (dto==null){
            return null;
        }
        CustomerCommentVO vo=new CustomerCommentVO();
        vo.setCustomerId(dto.getCustomerId());
        vo.setId(dto.getId());
        vo.setTitle(dto.getTitle());
        vo.setCommentText(dto.getCommentText());
        vo.setReplyText(dto.getReplyText());
        vo.setReplyBy(dto.getReplyBy());
        vo.setTag(dto.getTag());
        DateFormat format = new SimpleDateFormat(dateFormat);
        try {
            vo.setAddtime(format.parse(dto.getAddTime()));
        } catch (Exception e) {
            logger.error("parse date failed date="+dto.getAddTime(),e);
        }
        return vo;
    }

    public static List<CustomerCommentVO> parseCustomerCommentDTO2VO(List<CustomerCommentDTO> list)  {
        if (CollectionUtils.isEmpty(list)){
            return Collections.emptyList();
        }
        List<CustomerCommentVO> result=new ArrayList<CustomerCommentVO>();
        for (CustomerCommentDTO dto:list) {
            result.add(parseCustomerCommentDTO2VO(dto));
        }
        return result;
    }

    public static List<CustomerCommentDTO> parseCustomerCommentVO2DTO(List<CustomerCommentVO> list) {
        if (CollectionUtils.isEmpty(list)){
            return Collections.emptyList();
        }
        List<CustomerCommentDTO> result=new ArrayList<CustomerCommentDTO>();
        for (CustomerCommentVO vo:list) {
            result.add(parseCustomerCommentVO2DTO(vo));
        }
        return result;
    }

    public static CustomerAccountDTO parseCustomerAccountVO2DTO(CustomerAccountVO vo){
        if (vo==null){
            return null;
        }
        CustomerAccountDTO dto=new CustomerAccountDTO();
        BeanUtils.copyProperties(vo,dto);
        return dto;
    }

    public static CustomerAccountVO parseCustomerAccountDTO2VO(CustomerAccountDTO dto) {
        if (dto==null){
            return null;
        }
        CustomerAccountVO vo=new CustomerAccountVO();
        BeanUtils.copyProperties(dto,vo);
        return vo;
    }

    public static List<CustomerAccountVO> parseCustomerAccountDTO2VO(List<CustomerAccountDTO> list)  {
        if (CollectionUtils.isEmpty(list)){
            return Collections.emptyList();
        }
        List<CustomerAccountVO> result=new ArrayList<CustomerAccountVO>();
        for (CustomerAccountDTO dto:list) {
            result.add(parseCustomerAccountDTO2VO(dto));
        }
        return result;
    }

    public static List<CustomerAccountDTO> parseCustomerAccountVO2DTO(List<CustomerAccountVO> list)  {
        if (CollectionUtils.isEmpty(list)){
            return Collections.emptyList();
        }
        List<CustomerAccountDTO> result=new ArrayList<CustomerAccountDTO>();
        for (CustomerAccountVO vo:list) {
            result.add(parseCustomerAccountVO2DTO(vo));
        }
        return result;
    }




}
