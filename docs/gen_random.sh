#!/bin/bash

func01(){
    aa4=1
    cat > ${bb1}.html << EOF1
<!DOCTYPE html>
<html>
    <head>
        <script>
            var songList={};
            //console.log("b001 :", songList);

EOF1
}
func02(){
    cat >> ${bb1}.html << EOF2
            songList.a_${aa4}="${aa2}" ;
EOF2
}
func03(){
    cat >> ${bb1}.html << EOF3

            var len=Object.keys(songList).length;
            //console.log("b003 : songList length : ", len);

            var index=0 ;
            var result="" ;
            var title2=" 暫停，等待用戶按鍵 " ;
            var inited=0 ;

            function randomChoice(choices) {
                            var rand = Math.random() ;
                            //console.log("b101 : rand : ", rand);

                            index = Math.floor( rand * len);
                            //console.log("b103 : index : ", index);

                            result = choices['a_' + index];
                            //console.log("b109 : result : ", result);

                            return result ;
                        }

            function nextAudio() {
                            try{
                                            //console.log("b201 :", "try_pauseing then start next 1 ");
                                            x.pause();
                                            //console.log("b201 :", "try_pauseing then start next 2 ");
                                        }
                            catch(err){
                                        }
                            finally{
                                            t = randomChoice(songList);

                                            const pp1 = document.getElementById("p1");
                                            pp1.innerHTML = t ;
                                            //console.log("b401 : try play", t );

                                            let ff1 = t.lastIndexOf("/") + 1;
                                            let sub1 = t.substr(ff1);
                                            let ff2 = sub1.indexOf(".") ;
                                            let sub2 = sub1.substr(0,ff2);
                                            title2 = sub2 ;

                                            const pp2 = document.getElementById("p2");
                                            pp2.innerHTML = "播放中 : " + index + " : " + title2 ;

                                            const pp3 = document.getElementById("p3");
                                            pp3.innerHTML = " == ${bb2} / " + len + " ==" ;


                                            //console.log("b401 : try play", t );
                                            //x = new Audio(t);
                                            //x.play();

                                            var source15 = document.getElementById('audioSourceP15');
                                            source15.src = t ;

                                            var audio14 = document.getElementById('audioP14');
                                            audio14.load(); //call this to just preload the audio14 without playing
                                            audio14.play(); //call this to play the song right away


                                            //console.log("inited :", inited);
                                            if ( inited == 1 ) {
                                                inited=2;
                                                document.getElementById("audioP14").style="width:95%;";
                                            }
                                            if ( inited == 0 ) {
                                                document.getElementById("btPlay").disabled  = false;
                                                document.getElementById("btPause").disabled = false;
                                                document.getElementById("audioP14").style="width:60%;";
                                                inited=1;
                                            }
                                        }
                        };
            function playAudio() {
                            //console.log("b801 :", "stop only ");
                            //x.pause();

                            var audio16 = document.getElementById('audioP14');
                            audio16.play(); //call this to play the song right away

                            const pp3 = document.getElementById("p2");
                            pp3.innerHTML = "播放 : " + index + " : " + title2 ;
                        }
            function pauseAudio() {
                            //console.log("b801 :", "stop only ");
                            //x.pause();

                            var audio17 = document.getElementById('audioP14');
                            audio17.pause(); //call this to play the song right away

                            const pp3 = document.getElementById("p2");
                            pp3.innerHTML = "暫停 : " + index + " : " + title2 ;
                        }
        </script>

    </head>
    <body>
<button style="font-size: 105px; background-color: #f44336; border-radius: 25%; " 
    id="btNext"  onclick="nextAudio()"         > 下一首 </button></h1>
<button style="font-size: 105px; background-color: #4CAF50; border-radius: 25%; " 
    id="btPlay"  onclick="playAudio()"  disabled> 播放 </button></h1>
<button style="font-size: 105px; background-color: #f44336; border-radius: 25%; " 
    id="btPause" onclick="pauseAudio()" disabled> 暫停 </button>
    <p id="p1">暫停，等待用戶按鍵 !</p>
    <h1 style="font-size:3vw" id="p2" > 暫停，等待用戶按鍵  !</h1>
    <audio id="audioP14" controls="controls" style="width: 800px;" >
        <source id="audioSourceP15" src=""></source>
        Your browser does not support the audio format.
    </audio>
    <h1 style="font-size:5vw" id="p3" > === ${bb2} === </h1>
    <br><br>
    <a href='https://sctv2019.github.io/all/'> https://sctv2019.github.io/all/ </a>
    </body>
</html

EOF3
}
func021(){
    for aa2 in $(cat  ${aa1} |grep url=\"  |tr ' ' "\n" |grep ^url= |awk -F= '{print $2}'|tr -d \")
    do
        if [ ${aa4} -eq 1 ] 
        then
            aa3=""
        else
            aa3=","
        fi
        func02 
        aa4=$(( ${aa4} + 1 ))
    done
}
func022(){
    dd1=$(echo -n ${aa1}|wc -c)
    for aa2 in $(find  ${aa1} -type f -name "*.mp3")
    do
        if [ ${aa4} -eq 1 ] 
        then
            aa3=""
        else
            aa3=","
        fi
        aa2=${bb3}${aa2:${dd1}}
        func02 
        aa4=$(( ${aa4} + 1 ))
    done
}





bb1=r_sctv02
bb2='麻辣空間02'
bb3=http://mp4.eaafb.com/mp3_sctv_
bb4=/v1t/100_sctv/mp3_sctv_
func01 
for aa1 in ${bb4}
do
    func022 ${aa1}
done
func03
cat ${bb1}.html > ${bb4}.zip/index.html

#exit


bb1=r_laohei
bb2='公民老黑'
func01 
for aa1 in laohei2019.mp3.rss laohei2020.mp3.rss laohei2021.mp3.rss laohei2022.mp3.rss
do
    func021 ${aa1}
done
func03


bb1=r_sctv
bb2='麻辣空間'
func01 
for aa1 in sctv2019.mp3.rss sctv2020.mp3.rss sctv2021.mp3.rss sctv2022.mp3.rss
do
    func021 ${aa1}
done
func03

bb1=r_yolo
bb2='yolo街'
func01 
for aa1 in yolo2022.mp3.rss
do
    func021 ${aa1}
done
func03

