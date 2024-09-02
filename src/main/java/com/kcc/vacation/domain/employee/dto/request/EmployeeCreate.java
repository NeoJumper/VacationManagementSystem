package com.kcc.vacation.domain.employee.dto.request;


import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.sql.Timestamp;

@NoArgsConstructor
@Getter
@Setter
public class EmployeeCreate {


    private int id;
    private String name;
    private String password;
    private String passwordCheck;
    private Timestamp hireDate;
    private String oauthId;
    private String email;
    private String phoneNumber;
    private int vacationDays;
    private String joinState;
    private int deptId;
    private String position;
    private String authority;

    @Builder
    public EmployeeCreate(int id, String name, String password,String oauthId, String passwordCheck , Timestamp hireDate, String email, String phoneNumber, int vacationDays, String joinState, int deptId, String position, String authority) {
        this.id = id;
        this.name = name;
        this.hireDate = hireDate;
        this.oauthId = oauthId;
        this.password = password;
        this.passwordCheck = passwordCheck;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.vacationDays = vacationDays;
        this.joinState = joinState;
        this.deptId = deptId;
        this.position = position;
        this.authority = authority;
    }
}