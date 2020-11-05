var weatherList = {
  200: "번개와 보슬비",
  201: "번개와 비",
  202: "번개와 집중 호우",
  210: "천둥",
  211: "천둥 번개",
  212: "강한 천둥 번개",
  221: "매우 강한 천둥 번개",
  230: "번개와 가벼운 이슬비",
  231: "번개와 이슬비",
  232: "번개와 집중 호우",
  300: "약한 이슬비",
  301: "이슬비",
  302: "강한 이슬비",
  310: "약한 이슬비",
  311: "이슬비",
  312: "강한 이슬비",
  313: "소나기",
  314: "강한 소나기",
  321: "소나기",
  500: "가벼운 비",
  501: "비",
  502: "강한 비",
  503: "집중 호우",
  504: "집중 호우",
  511: "어는 비",
  520: "가벼운 소나기",
  521: "소나기",
  522: "강한 소나기",
  531: "매우 강한 소나기",
  600: "약한 눈",
  601: "눈",
  602: "거센 눈",
  611: "진눈 깨비",
  612: "급 진눈 깨비",
  615: "약한 눈과 비",
  616: "눈과 비",
  620: "눈",
  621: "소낙눈",
  622: "강한 소낙눈",
  701: "안개",
  711: "연기",
  721: "실안개",
  731: "황사 바람",
  741: "안개",
  751: "황사",
  761: "황사",
  762: "화산재",
  771: "돌풍",
  781: "태풍",
  800: "맑은 하늘",
  801: "구름 조금",
  802: "조각 구름",
  803: "조각 구름",
  804: "흐림",
  951: "바람 없음",
  952: "남실 바람",
  953: "산들 바람",
  954: "건들 바람",
  955: "흔들 바람",
  956: "된바람",
  957: "센바람",
  958: "강풍",
  959: "극심한 강풍",
  960: "폭풍우",
  961: "폭풍",
  962: "허리케인",
};
var latitude;
var longitude;
var apiURI;
try {
  navigator.geolocation.getCurrentPosition(function (pos) {
    latitude = pos.coords.latitude;
    longitude = pos.coords.longitude;
    apiURI =
      "http://api.openweathermap.org/data/2.5/weather?lat=" +
      latitude +
      "&lon=" +
      longitude +
      "&appid=" +
      "ed9f54057cc3edae5d4ac5e81158c265&lang=kr";
    getWeathr();
  });
} catch (error) {
  //위치찾는중 에러 발생시 서울로 불러옴
  alert("에러");
  apiURI =
    "http://api.openweathermap.org/data/2.5/weather?lat=" +
    37.56826 +
    "&lon=" +
    126.977 +
    "&appid=" +
    "ed9f54057cc3edae5d4ac5e81158c265&lang=kr";
  getWeathr();
}

function getWeathr() {
  $.ajax({
    url: apiURI,
    dataType: "json",
    type: "GET",
    async: "false",
    success: function (resp) {
      //   console.log("현재온도 : " + (resp.main.temp - 273.15));
      //   console.log("현재습도 : " + resp.main.humidity);
      //   console.log("날씨 : " + weatherList[resp.weather[0].id]);
      //   console.log("상세날씨설명 : " + resp.weather[0].description);
      //   console.log("날씨 이미지 : " + resp.weather[0].icon);
      //   console.log("바람   : " + resp.wind.speed);
      //   console.log("나라   : " + resp.sys.country);
      //   console.log("도시이름  : " + resp.name);
      //   console.log("구름  : " + resp.clouds.all + "%");
      var imgURL =
        "http://openweathermap.org/img/wn/" + resp.weather[0].icon + "@2x.png";
      $("#weatherimg").attr("src", imgURL);
      $(".weathertxt").html(
        "<h3>" +
          resp.name+" "+(resp.main.temp - 273.15).toFixed(1)+"℃<br>(" +
          weatherList[resp.weather[0].id] +
          ")</h3> 구름 : " +
          resp.clouds.all +
          "%" +
          " <br />현재습도 : " +
          resp.main.humidity +
          "%" +
          " <br />바람 : " +
          resp.wind.speed +
          "mps"
      );
    },
  });
}
setTimeout(function () {
  if ($(".weathertxt").text().trim() == "날씨정보") {
    apiURI =
      "http://api.openweathermap.org/data/2.5/weather?lat=" +
      37.56826 +
      "&lon=" +
      126.977 +
      "&appid=" +
      "ed9f54057cc3edae5d4ac5e81158c265&lang=kr";
    getWeathr();
  } //5초안에 날씨정보를 불러오는데 이상이 생긴다면 서울로 불러옴
}, 5000);
