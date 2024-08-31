<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <title>Modal Content</title>
    <link rel="stylesheet" type="text/css" href="/resources/css/modal.css">
 
    <style>
        
        
    </style>

</head>
<body>
    <div id="modal-main">
        <div class="modal-header">
            <h5 class="modal-title" id="historyModalLabel">휴가 유형 추가하기</h5>
            <button type="button" style=" border: 0; background: transparent; font-size: 2rem;" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <div class="modal-body">
            <form id="inputForm">
                <div class="form-group">
                    <label style="margin:10px 0px;" for="inputField1">휴가 유형 이름</label>
                    <input type="text" class="form-control" id="inputField1" name="inputField1" placeholder="여기에 입력하세요" required>
                </div>
                <div class="form-group">
                    <label style="margin:10px 0px;">유급 여부</label>
                    <div class="radio-group">
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="isPaid" id="noPaid" checked>
                            <label class="form-check-label" for="noPaid">
                                무급
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="isPaid" id="paid">
                            <label class="form-check-label" for="paid">
                                유급 
                            </label>
                        </div>  
                    </div>  
                </div>
                <div class="form-group">
                    <label style="margin:10px 0px;" for="inputField3">최대 사용 가능일 수</label>
                    <input type="text" class="form-control" id="inputField3" name="inputField3" placeholder="여기에 입력하세요" required>
                </div>
                <div class="form-group">
                    <label style="margin:10px 0px;" for="inputField4">메모</label>
                    <textarea class="form-control" id="inputField4" name="inputField4" rows="5" placeholder="내용을 입력하세요"></textarea>
                </div>
            </form>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn .quiet-btn" data-dismiss="modal">닫기</button>
            <button type="submit" class="btn .quiet-btn" id="submitButton">저장</button>
        </div>
    </div>
</body>
</html>
