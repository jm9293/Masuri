$(function() {

		$("#inputEmaildirect").hide();
		$("#emailSelect").change(function() {
				if($("#emailSelect").val()==='direct') {
					$("#emailSelect").hide();
	                $("#inputEmaildirect").show();
	                $("#inputEmaildirect").keyup();
				}
	        }) 
	       
		 $("#idtext").keyup(function(){
	            var value =  $("#idtext").val();
	           if(/[a-z0-9]{4,6}/.test(value)&&/[a-z]/.test(value)&&/[0-9]/.test(value)){
	            
	        	$("#idtext").addClass("is-invalid");
	        	$("#id-invalid").text("중복확인을 해주세요.");
	            $("#idchk-btn").removeAttr("disabled");
	           }else{
	        	   
	        	$("#id-invalid").text("아이디는 4~6자 영문소문자+숫자여야 합니다.");
	            $("#idtext").addClass("is-invalid"); 
	            $("#idchk-btn").attr("disabled","");
	           }
	           
	           validchk();
	       })

		$("#pwtext").keyup(function() {
			var value = $("#pwtext").val();
			if (/(?=.*[a-zA-Z])(?=.*\d).{6,8}/.test(value)) {
				$("#pwtext").removeClass("is-invalid");
				$("#pwtext").addClass("is-valid");
			} else {
				$("#pwtext").removeClass("is-valid");
				$("#pwtext").addClass("is-invalid");
			}

			validchk();
		})
		
	
		$("#pwchk").keyup(function() {
			var value = $("#pwchk").val();
			if (value === $("#pwtext").val()) {
				$("#pwchk").removeClass("is-invalid");
				$("#pwchk").addClass("is-valid");
			} else {
				$("#pwchk").removeClass("is-valid");
				$("#pwchk").addClass("is-invalid");
			}

			validchk();
		})

		$("#nametext").keyup(function() {
			var value = $("#nametext").val();
			if (/[가-힣]{2,}/.test(value)) {
				$("#nametext").removeClass("is-invalid");
				$("#nametext").addClass("is-valid");
			} else {
				$("#nametext").removeClass("is-valid");
				$("#nametext").addClass("is-invalid");
			}

			validchk();
		})

		$("#phonetext").keyup(function() {
			var value = $("#phonetext").val();
			if (/[0-9]{10,11}/.test(value)) {
				$("#phonetext").removeClass("is-invalid");
				$("#phonetext").addClass("is-valid");
			} else {
				$("#phonetext").removeClass("is-valid");
				$("#phonetext").addClass("is-invalid");
			}

			validchk();
		})

		$("#emailtext").keyup(
				function() {
					var value;
					if ($("#emailSelect").val() !== 'direct') {
						value = $("#emailtext").val() + '@'
								+ $("#emailSelect").val()
					} else {
						value = $("#emailtext").val() + '@'
								+ $("#inputEmaildirect").val()
					}

					if (/[a-z0-9_+.-]+@([a-z0-9-]+\.)+[a-z0-9]{2,4}/
							.test(value)) {
						$("#emailtext").removeClass("is-invalid");
						$("#emailtext").addClass("is-valid");
					} else {
						$("#emailtext").removeClass("is-valid");
						$("#emailtext").addClass("is-invalid");
					}

					validchk();
				})

		$("#inputEmaildirect").keyup(function() {
			var value;
			value = $("#emailtext").val() + '@' + $("#inputEmaildirect").val()

			if (/[a-z0-9_+.-]+@([a-z0-9-]+\.)+[a-z0-9]{2,4}/.test(value)) {
				$("#inputEmaildirect").removeClass("is-invalid");
				$("#inputEmaildirect").addClass("is-valid");
			} else {
				$("#inputEmaildirect").removeClass("is-valid");
				$("#inputEmaildirect").addClass("is-invalid");
			}

			validchk();
		})

		$("#introtext").keyup(function() {
			var value = $("#introtext").val();
			if (value != "") {
				$("#introtext").removeClass("is-invalid");
				$("#introtext").addClass("is-valid");
			} else {
				$("#introtext").removeClass("is-valid");
				$("#introtext").addClass("is-invalid");
			}

			validchk();
		})
		function validchk() {
			var chk = $("#idtext").hasClass("is-valid")
					&& $("#pwtext").hasClass("is-valid")
					&& $("#pwchk").hasClass("is-valid")
					&& $("#nametext").hasClass("is-valid")
					&& $("#phonetext").hasClass("is-valid")
					&& $("#emailtext").hasClass("is-valid")
					&& $("#introtext").hasClass("is-valid")

			if (chk) {
				$("#signup-btn").removeAttr("disabled");
			} else {
				$("#signup-btn").attr("disabled", "");
			}
			return chk;
		}

	});
	function submitchk() {

		$("#idtext").keyup();
		$("#pwtext").keyup();
		$("#pwchk").keyup();
		$("#nametext").keyup();
		$("#phonetext").keyup();
		$("#emailtext").keyup();
		$("#introtext").keyup();

		return validchk();

	}

	function createChk() {
		if (idlist.indexOf($("#idtext").val()) != -1) {
			alert("중복된 ID 입니다.");
		} else {
			$("#idtext").removeClass("is-invalid");
			$("#idtext").addClass("is-valid");
			$("#idchk-btn").text("체크완료");
			$("#idtext").attr("readonly", "");
			$("#idchk-btn").attr("disabled", "");
		}
	}