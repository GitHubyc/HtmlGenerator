package com.xakj.model;

public class Codes {
//添加
//    unitEntity.setUnitId(unitId);
//    unitEntity.setCreateDate(DateUtil.now());
//    unitEntity.setUpdateDate(DateUtil.now());

//    dutyDao.savaBatch(addEnterpriseInfoInputDto.convertDutyEntitys(unitId));

    //一对多包含查询
//    DutyEntity dutyEntity = new DutyEntity();
//    dutyEntity.setUnitId(dto.getUnitId());
//    List<DutyEntity> dutyEntitys = dutyDao.findAll(0, 0, dutyEntity);
//    List<EnterpriseInfoDto.DutyDto> dutyDtos = new ArrayList<EnterpriseInfoDto.DutyDto>();
//    for (int j = 0; j < dutyEntitys.size(); j++) {
//        EnterpriseInfoDto.DutyDto dutyDto = new EnterpriseInfoDto.DutyDto();
//        BeanUtils.copyProperties(dutyEntitys.get(j), dutyDto);
//        dutyDtos.add(dutyDto);
//    }
//    if (dutyDtos.size() > 0) {
//        dto.setDutyDtos(dutyDtos);
//    }


//    @ApiModelProperty(value = "主体责任", name = "dutyDtos", example = "主体责任")
//    private List<DutyDto> dutyDtos;
//返回当前主体责任
//public List<DutyEntity> convertDutyEntitys(String enterpriseId){
//    List<DutyEntity> entities = Lists.newArrayList();
//    if(this.getDutyDtos() != null && this.getDutyDtos().size() > 0){
//        List<String> dutyTypes = new ArrayList<String>();
//        for (AddEnterpriseInfoInputDto.DutyDto dto:this.getDutyDtos()) {
//            if (dutyTypes.contains(dto.getDutyType())) {
//                throw new ServiceException("责任类型重复！");
//            }
//            DutyEntity entity = new DutyEntity();
//            BeanUtils.copyProperties(dto,entity);
//            entity.setUnitId(enterpriseId);
//            entity.setDutyId(UuidUtil.get32UUID());
//            entity.setCreateDate(DateUtil.now());
//            entity.setUpdateDate(DateUtil.now());
//            entities.add(entity);
//            dutyTypes.add(entity.getDutyType());
//        }
//    }
//    return entities;
//}
}
