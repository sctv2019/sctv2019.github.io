#!/bin/bash

func01(){
    cat > ${bb1}.html << EOF1
<!DOCTYPE html>
<html>
    <head>
        <script>
            var songList = [
EOF1
}
func02(){
    cat >> ${bb1}.html << EOF2
${aa3}"${aa2}"
EOF2
}
func03(){
    cat >> ${bb1}.html << EOF3
                        ];
            //this gets a random url from the list
            function randomChoice(choices) {
                            var index = Math.floor(Math.random() * choices.length);
                            return choices[index];
                        }
            //this is just a place holder you can change this function to anything

            /*this trys to pause x and then play a new song but if x is not defined then you 
           get an error so you have to do try catch finally*/
            function playAudio() {
                            try{
                                            x.pause();
                                        }
                            catch(err){
                                        }
                            finally{
                                            t = randomChoice(songList);
                                            const pp1 = document.getElementById("p1");
                                            pp1.innerHTML = t ;
                                            let ff1 = t.lastIndexOf("/") + 1;
                                            let sub1 = t.substr(ff1);
                                            let ff2 = sub1.indexOf(".") ;
                                            let sub2 = sub1.substr(0,ff2);
                                            const pp2 = document.getElementById("p2");
                                            pp2.innerHTML = sub2 ;
                                            x = new Audio(t);
                                            x.play();
                                        }
                        };
            function pauseAudio() {
                            x.pause();
                        }
        </script>

    </head>
    <body>
        <button style="font-size: 150px; background-color: #4CAF50; border-radius: 25%; " onclick="playAudio()" > 播放 </button></h1>
        <button style="font-size: 150px; background-color: #f44336; border-radius: 25%; " onclick="pauseAudio()"> 暫停 </button>
        <p id="p1">Hello World!</p>
        <h1 style="font-size:3vw" id="p2" > Hello World2 </h1>
    </body>
</html

EOF3
}
func021(){
    aa4=1
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

bb1=r_laohei
func01 
for aa1 in laohei2019.mp3.rss laohei2020.mp3.rss laohei2021.mp3.rss laohei2022.mp3.rss
do
    func021 ${aa1}
done
func03


bb1=r_sctv
for aa1 in sctv2019.mp3.rss sctv2020.mp3.rss sctv2021.mp3.rss sctv2022.mp3.rss
do
    func021 ${aa1}
done

bb1=r_yolo
for aa1 in yolo2022.mp3.rss
do
    func021 ${aa1}
done

