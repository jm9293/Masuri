<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
    <title>Login Demo - Kakao JavaScript SDK</title>
    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

</head>
<body>
 	<div>카카오 아이디 : <span id="kakaoIdentity"></span></div>

    <div>닉네임 : <span id="kakaoNickName"></span></div>

    <div>프로필 이미지 : <img id="kakaoProfileImg" src=""/></div>

    <div>썸네일 이미지 : <img id="kakaoThumbnailImg" src=""/></div>

    <br/>

    <a id="kakao-login-btn"></a>
    <a id="kakao-login-btn"></a>
    <a href="http://developers.kakao.com/logout"></a>
    <script type='text/javascript'>

    document.addEventListener("DOMContentLoaded", function() {



        // @details 카카오톡 Developer API 사이트에서 발급받은 JavaScript Key

        Kakao.init( "7e5dd1b3d783cce86b62c626f0af2fe2" );



        // @breif 카카오 로그인 버튼을 생성합니다.

        Kakao.Auth.createLoginButton({

              container : "#kakao-login-btn"

            , success : function( authObj ) {



                // console.log( authObj );



                Kakao.API.request({

                      url : "/v2/user/me"

                    , success : function( res ) {



                        console.log( res );



                        // @breif 아이디

                        document.getElementById( "kakaoIdentity" ).innerHTML = res.id;
                        document.getElementById( "kakaoNickName" ).innerHTML = res.kakao_account.email;

                       

                       



                    }, fail : function( error ) {

                        alert( JSON.stringify( error ) );

                    }

                });

            }

            , fail : function( error ) {

                alert( JSON.stringify( error ));

            }

        });

    });
    </script>
</body>
</html>