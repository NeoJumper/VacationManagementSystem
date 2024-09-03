package com.kcc.vacation.domain.employee.mapper;

<<<<<<< HEAD
import com.kcc.vacation.domain.employee.dto.request.UpdateMyInfo;
import com.kcc.vacation.domain.employee.dto.response.MyInfo;
import com.kcc.vacation.domain.employee.dto.request.EmployeeCreate;
import com.kcc.vacation.domain.employee.dto.request.EmployeeFormLoginDataUpdate;
import com.kcc.vacation.domain.employee.dto.request.EmployeeSocialDataUpdate;
=======
import com.kcc.vacation.domain.employee.dto.request.*;
import com.kcc.vacation.domain.employee.dto.response.MyInfo;
>>>>>>> a4f4c951d95c5eb1b0a7a1186eebb374db7b1e1b
import com.kcc.vacation.domain.employee.dto.response.Employee;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface EmployeeMapper {

    void save(EmployeeCreate employeeCreate);

    Employee findById(int id);

    Employee findByEmail(String email);

    Employee findByOauthId(String oauthId);

    void updateSocialData(EmployeeSocialDataUpdate socialDataUpdate);
    void updateFormLoginData(EmployeeFormLoginDataUpdate formLoginDataUpdate);
    MyInfo getMyInfo(int employeeId);
    int updateMyInfo(@Param("updateMyInfo") UpdateMyInfo updateMyInfo);
<<<<<<< HEAD
=======

    void updateAuthenticationCode(EmployeeAuthenticationCodeUpdate authenticationData);
    void updateVerified(EmployeeVerifiedUpdate authenticationData);
>>>>>>> a4f4c951d95c5eb1b0a7a1186eebb374db7b1e1b
}
