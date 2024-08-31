<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
  <link rel="stylesheet" type="text/css" href="/resources/css/styles.css">
  <link rel="stylesheet" type="text/css" href="/resources/css/vacation-type.css">
  
 <!-- modal 사용 : jquery -->
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <!-- modal 사용 : bootstrap js도 필요함 -->
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
 
</head>

<body>
    <%@ include file="/resources/components/header.jsp" %>
    <%@ include file="/resources/components/sidebar.jsp" %>
    


  <div id="mainArea">
    <div id ="vacation-type-main">
        <div id ="vacation-type-header">
          <h3 >휴가유형관리</h3>

          <div class="d-grid gap-2 d-md-flex justify-content-md-end" style="margin-top:5%; margin-bottom:3%">
            <button class="btn btn-primary me-md-2" id="vacation-type-button" type="button">휴가유형추가</button>
            <button class="btn btn-primary" id="vacation-type-button" type="button">휴가유형삭제</button>
          </div>
        </div>
        

        <div id ="vacation-type-document">
       
          <table class="table">
            <thead class="table-light">
              <tr>
                <th scope="col">
                  <input class="form-check-input" type="checkbox" id="flexCheckDefault">
                </th>
                <th scope="col">Column 1</th>
                <th scope="col">Column 2</th>
                <th scope="col">Column 3</th>
                <th scope="col">Column 4</th>
              </tr>
            </thead>

            <tbody>
              <tr>
                <th scope="row">
                <input class="form-check-input" type="checkbox" id="check1">
                </th>
                <td>Column 1</td>
                <td>Column 2</td>
                <td>Column 3</td>
                <td>Column 4</td>
              </tr>
              <tr>
                <th scope="row">
                <input class="form-check-input" type="checkbox" id="check2">
              
                </th>
                <td>Column 1</td>
                <td>Column 2</td>
                <td>Column 3</td>
                <td>Column 4</td>
              </tr>
              <tr>
                <th scope="row">
                <input class="form-check-input" type="checkbox" id="check3">
              
                </th>
                <td>Column 1</td>
                <td>Column 2</td>
                <td>Column 3</td>
                <td>Column 4</td>
              </tr>
            </tbody>
          </table>
        </div>
        
        <div class="modal fade" id="MoaModal" tabindex="-1" role="dialog" aria-labelledby="historyModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-xl" role="document">
                <div class="modal-content">
                    <%@ include file="/resources/components/admin/addVacationTypeModal.jsp" %>    
                </div>
            </div>
        </div>


        <div id="root">
            <button type="button" id="modal_opne_btn" class="btn btn-primary">
                모달 창 열기
            </button>
        </div>

    </div>
  </div>
      

   <script>
        $(document).ready(function() {
            $('#modal_opne_btn').click(function() {
                    $('#MoaModal').modal('show');
            });
        });
    </script>

    
</body>
</html>
